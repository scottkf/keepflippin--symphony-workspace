<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-element-prefixes="date">

<xsl:template name="calendar">
	<xsl:param name="today" select="$today"/>

	<!-- Calculate the offset to the first day in this month -->
	<xsl:variable name="first-day-offset">
		<xsl:text>-P</xsl:text>
		<xsl:value-of select="date:day-in-month($today) - 1" />
		<xsl:text>D</xsl:text>
	</xsl:variable>

	<xsl:variable name="first-of-month"	select="date:add($today, $first-day-offset)" />

	<!-- Calculate the offset to the first Sunday before or on the
	first of this month -->

	<xsl:variable name="first-sunday-offset">
		<xsl:text>-P</xsl:text>
		<xsl:value-of select="date:day-in-week($first-of-month) - 1" />
		<xsl:text>D</xsl:text>
	</xsl:variable>
	<xsl:variable name="start-of-calendar" select="date:add($first-of-month, $first-sunday-offset)" />

	<table id="cal"	summary="Calendar for {date:month-name($today)} {date:year($today)}">

		<!-- generate caption with name of month plus links to preceding
		and following months -->
		<tr>
			<td class="month-nav" colspan="7">
				<xsl:call-template name="preceding-month">
					<xsl:with-param name="date" select="$today"/>
				</xsl:call-template>

				<xsl:value-of select="date:month-name($today)"/>
				<xsl:text>&#xa0;</xsl:text>
				<xsl:value-of select="date:year($today)"/>

				<xsl:call-template name="following-month">
					<xsl:with-param name="date" select="$today"/>
				</xsl:call-template>
			</td>
		</tr>

		<!-- Call the template with two parameters: where to start and
		when to end -->

		<xsl:call-template name="calendar-week">
			<xsl:with-param name="today" select="$today" />
			<xsl:with-param name="start-date" select="$start-of-calendar" />
			<xsl:with-param name="for-month" select="date:month-in-year($today)" />
		</xsl:call-template>
	</table>
</xsl:template>


		<!-- calendar-week recursively calls itself until the month of the Sunday of the following week differs from for-month, at which point it exits. It may have been slightly more efficient (in terms of memory) to do tail-recursion; however, the cost would have been excessive copying of the result tree. As the depth of this recursion will never exceed 6, the danger of overflowing the stack is small. Note that calendar-week does not let calendar-day perform the recursion; since the number of iterations is fixed and small, unrolling the loop seemed to be the obvious optimization.

		Note: if Mia has a year-long dry spell, this template is screwed. -->

<xsl:template name="calendar-week">
	<xsl:param name="today" />
	<xsl:param name="start-date" />
	<xsl:param name="for-month" />

	<tr>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="today" select="$today" />
			<xsl:with-param name="day" select="$start-date" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="today" select="$today" />
			<xsl:with-param name="day" select="date:add($start-date,'P1D')" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="today" select="$today" />
			<xsl:with-param name="day" select="date:add($start-date,'P2D')" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="today" select="$today" />
			<xsl:with-param name="day" select="date:add($start-date,'P3D')" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="today" select="$today" />
			<xsl:with-param name="day" select="date:add($start-date,'P4D')" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="today" select="$today" />
			<xsl:with-param name="day" select="date:add($start-date,'P5D')" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
		<xsl:call-template name="calendar-day">
			<xsl:with-param name="today" select="$today" />
			<xsl:with-param name="day" select="date:add($start-date,'P6D')" />
			<xsl:with-param name="for-month" select="$for-month" />
		</xsl:call-template>
	</tr>

	<xsl:variable name="next-week" select="date:add($start-date,'P7D')" />

	<xsl:if test="$for-month = date:month-in-year($next-week)">
		<xsl:call-template name="calendar-week">
			<xsl:with-param name="today" select="$today" />
			<xsl:with-param name="start-date" select="$next-week"/>
			<xsl:with-param name="for-month" select="$for-month"/>
		</xsl:call-template>
	</xsl:if>
</xsl:template>


		<!-- Most of calendar-day is elided here, as it is specific to Condensed Comics. Note that since the recursion was unrolled in calendar-week above, the template is straightforward: -->

<xsl:template name="calendar-day">
	<xsl:param name="today" />
	<xsl:param name="day" />
	<xsl:param name="for-month" />

	<td>
		<xsl:attribute name="class">
			<xsl:choose>
				<xsl:when test="$for-month != date:month-in-year($day)">
					<xsl:text>other-month</xsl:text>
				</xsl:when>
				<xsl:when test="$today != $day">
					<xsl:text>this-month</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>this-day</xsl:text>
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
</xsl:template>
<xsl:template name="following-month">
</xsl:template>
<xsl:template name="optional-hyperlink-to-date">
	<xsl:call-template name="format-date">
    <xsl:with-param name="date" select="$day"/>
    <xsl:with-param name="format" select="'D'"/>
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>