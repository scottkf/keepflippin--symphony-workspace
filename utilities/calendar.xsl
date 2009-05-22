<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-element-prefixes="date">

<!--
Name: XSLT Calendar 
Description:  
	The purpose is to generate a calendar you can view by month, to be used in symphony.
	To override what goes in each day, go to the bottom and edit the optional-hyperlink-to-date template,
		to edit the next/previous month links, edit the following-month and preceding-month templates.
Version: 0.1
Original Author: Robe Menke <http://www.the-wabe.com/notebook/xslt-calendar.html>
Modified by: Scott Tesoriere <http://github.com/scottkf>
URL: http://gist.github.com/115859
-->
<xsl:param name="relative-day">
	<xsl:choose>
		<xsl:when test="not(contains($current-path,'?'))">
			<xsl:value-of select="$today" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="concat(format-number($url-year,'0000'),'-',format-number($url-month ,'00'),'-',$this-day)" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:param>

<xsl:template name="calendar">


	<!-- Calculate the offset to the first day in this month -->
	<xsl:variable name="first-day-offset">
		<xsl:text>-P</xsl:text>
		<xsl:value-of select="date:day-in-month($relative-day) - 1" />
		<xsl:text>D</xsl:text>
	</xsl:variable>

	<xsl:variable name="first-of-month"	select="date:add($relative-day, $first-day-offset)" />

	<!-- Calculate the offset to the first Sunday before or on the
	first of this month -->

	<xsl:variable name="first-sunday-offset">
		<xsl:text>-P</xsl:text>
		<xsl:value-of select="date:day-in-week($first-of-month) - 1" />
		<xsl:text>D</xsl:text>
	</xsl:variable>
	<xsl:variable name="start-of-calendar" select="date:add($first-of-month, $first-sunday-offset)" />

	<table id="cal"	summary="Calendar for {date:month-name($relative-day)} {date:year($relative-day)}">

		<!-- generate caption with name of month plus links to preceding
		and following months -->
		<tr>
			<td class="month-nav" colspan="7">
				<xsl:call-template name="preceding-month">
					<xsl:with-param name="date" select="$relative-day"/>
				</xsl:call-template>

				<xsl:value-of select="date:month-name($relative-day)"/>
				<xsl:text>&#xa0;</xsl:text>
				<xsl:value-of select="date:year($relative-day)"/>

				<xsl:call-template name="following-month">
					<xsl:with-param name="date" select="$relative-day"/>
				</xsl:call-template>
			</td>
		</tr>

		<!-- Call the template with two parameters: where to start and
		when to end -->

		<xsl:call-template name="calendar-week">
			<xsl:with-param name="relative-day" select="$relative-day" />
			<xsl:with-param name="start-date" select="$start-of-calendar" />
			<xsl:with-param name="for-month" select="date:month-in-year($relative-day)" />
		</xsl:call-template>
	</table>
</xsl:template>


		<!-- calendar-week recursively calls itself until the month of the Sunday of the following week differs from for-month, at which point it exits. It may have been slightly more efficient (in terms of memory) to do tail-recursion; however, the cost would have been excessive copying of the result tree. As the depth of this recursion will never exceed 6, the danger of overflowing the stack is small. Note that calendar-week does not let calendar-day perform the recursion; since the number of iterations is fixed and small, unrolling the loop seemed to be the obvious optimization.

		Note: if Mia has a year-long dry spell, this template is screwed. -->

<xsl:template name="calendar-week">
	<xsl:param name="relative-day" />
	<xsl:param name="start-date" />
	<xsl:param name="for-month" />

	<tr>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="relative-day" select="$relative-day" />
			<xsl:with-param name="day" select="$start-date" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="relative-day" select="$relative-day" />
			<xsl:with-param name="day" select="date:add($start-date,'P1D')" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="relative-day" select="$relative-day" />
			<xsl:with-param name="day" select="date:add($start-date,'P2D')" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="relative-day" select="$relative-day" />
			<xsl:with-param name="day" select="date:add($start-date,'P3D')" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="relative-day" select="$relative-day" />
			<xsl:with-param name="day" select="date:add($start-date,'P4D')" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="relative-day" select="$relative-day" />
			<xsl:with-param name="day" select="date:add($start-date,'P5D')" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="relative-day" select="$relative-day" />
			<xsl:with-param name="day" select="date:add($start-date,'P6D')" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
	</tr>

	<xsl:variable name="next-week" select="date:add($start-date,'P7D')" />

	<xsl:if test="$for-month = date:month-in-year($next-week)">
		<xsl:call-template name="calendar-week">
			<xsl:with-param name="relative-day" select="$relative-day" />
			<xsl:with-param name="start-date" select="$next-week"/>
			<xsl:with-param name="for-month" select="$for-month"/>
		</xsl:call-template>
	</xsl:if>
</xsl:template>


		<!-- Most of calendar-day is elided here, as it is specific to Condensed Comics. Note that since the recursion was unrolled in calendar-week above, the template is straightforward: -->

<xsl:template name="calendar-day">
	<xsl:param name="relative-day" />
	<xsl:param name="day" />
	<xsl:param name="for-month" />

	<td>
		<xsl:attribute name="class">
			<xsl:choose>
				<xsl:when test="$for-month != date:month-in-year($day)">
					<xsl:text>other-month</xsl:text>
				</xsl:when>
				<xsl:when test="$today = $day">
					<xsl:text>this-day</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>this-month</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>

		<!-- Generate either a link or just a text node
		containing date:day-of-month($day) -->
		<xsl:call-template name="optional-hyperlink-to-date">
			<xsl:with-param name="day" select="$day" />
		</xsl:call-template>
	</td>
</xsl:template>



<xsl:template name="preceding-month">
	<xsl:variable name="last-month"	select="date:add($date, '-P1M')" />
	<xsl:call-template name="build-link">
		<xsl:with-param name="month" select="$last-month" />
		<xsl:with-param name="text">
			&#60; previous
		</xsl:with-param>
	</xsl:call-template>
</xsl:template>

<xsl:template name="following-month">
	<xsl:variable name="next-month"	select="date:add($date, 'P1M')" />
	<xsl:call-template name="build-link">
		<xsl:with-param name="month" select="$next-month" />
		<xsl:with-param name="text">
			next &#62;
		</xsl:with-param>
	</xsl:call-template>
</xsl:template>


<xsl:template name="build-link">
	<a>
		<xsl:attribute name="href">
			<xsl:value-of select="$root" />
			<xsl:choose>
				<xsl:when test="contains($current-path,'?')">
					<xsl:value-of select="substring-before($current-path, '?')" />					
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$current-path" />
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>?year=</xsl:text>
			<xsl:value-of select="date:year($month)" />
			<xsl:text>&amp;month=</xsl:text>
			<xsl:value-of select="format-number(date:month-in-year($month) ,'00')" />
		</xsl:attribute>
		<xsl:value-of select="$text" />
	</a>
</xsl:template>

<!-- override this to change what goes in the td -->
<xsl:template name="optional-hyperlink-to-date">
	<xsl:call-template name="format-date">
    <xsl:with-param name="date" select="$day"/>
    <xsl:with-param name="format" select="'D'"/>
  </xsl:call-template>
	<ul>
		<xsl:apply-templates select="/data/*[starts-with(name(), 'schedule')]" mode="events">
			<xsl:with-param name="day" select="$day" />
		</xsl:apply-templates>
	</ul>
</xsl:template>

	<xsl:template match="/data/schedule*" mode="events">
	<xsl:param name="day" />
	<xsl:variable name="start-day" select="entry/date/start" />
	<xsl:variable name="current-day" select="entry/date/current" />
	<xsl:variable name="end-day" select="entry/date/end" />
	<xsl:if test="not(contains(date:difference($start-day,$day),'-')) and contains(date:difference($end-day,$day),'-') and date:day-name($current-day) = date:day-name($day)">
		<xsl:apply-templates select="entry[@id]"/>
	</xsl:if>
</xsl:template>

<xsl:template match="/data/schedule*/entry">
	<xsl:variable name="entry-id" select="class/item/@id" />
		<li>
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="$root" />
				<xsl:text>/classes/class/</xsl:text>
				<xsl:value-of select="/data/classes-list/entry[@id = $entry-id]/class-name/@handle" />
			</xsl:attribute>
			<xsl:value-of select="class/item" />
		</a>
		<xsl:copy-of select="substring(/data/classes-list/entry[@id = $entry-id]/description/*,1,50)" />
		<xsl:if test="string-length(/data/classes-list/entry[@id = $entry-id]/description) &gt; 50">
			<a href="{$root}/news/{title/@handle}/">
				...
			</a>
		</xsl:if>
	</li>
</xsl:template>


</xsl:stylesheet>