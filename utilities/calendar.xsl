<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
  xmlns:str="http://exslt.org/strings"
	xmlns:math="http://exslt.org/math"
	extension-element-prefixes="date str math">


<xsl:import href="get-schedule.xsl" />
<!--
Name: XSLT Calendar 
Description:  
	The purpose is to generate a calendar you can view by month, to be used in symphony.
	To override what goes in each day, go to the bottom and edit the optional-hyperlink-to-date template,
		to edit the next/previous month links, edit the following-month and preceding-month templates.
Version: 0.3
Original Author: Robe Menke <http://www.the-wabe.com/notebook/xslt-calendar.html>
Modified by: Scott Tesoriere <http://github.com/scottkf>
URL: http://gist.github.com/115859
-->
<xsl:param name="relative-day">
	<xsl:variable name="day">
		<xsl:call-template name="last-day-in-month">
			<xsl:with-param name="year" select="$year"/>
			<xsl:with-param name="month" select="$month" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:choose>
		<xsl:when test="$year &gt;= 1 or $month &gt;= 1">
			<xsl:value-of select="concat(format-number($year,'0000'),'-',format-number($month ,'00'),'-',$day)" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$today" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:param>
<xsl:param name="classes"/>

<xsl:template name="last-day-in-month">
	<xsl:param name="month" />
	<xsl:param name="year" />
	<xsl:choose>
		<xsl:when test="$month = 2 and not($year mod 4) and ($year mod 100 or not ($year mod 400))">
			<xsl:value-of select="29"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="substring('31283130313031303130313031', 2* $month - 1,2)"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

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
			<th class="month-nav" colspan="7">
				<xsl:call-template name="preceding-month">
					<xsl:with-param name="date" select="$relative-day"/>
				</xsl:call-template>

				<xsl:value-of select="date:month-name($relative-day)"/>
				<xsl:text>&#xa0;</xsl:text>
				<xsl:value-of select="date:year($relative-day)"/>

				<xsl:call-template name="following-month">
					<xsl:with-param name="date" select="$relative-day"/>
				</xsl:call-template>
			</th>
		</tr>
		<tr>
			<th>Sunday</th>
			<th>Monday</th>
			<th>Tuesday</th>
			<th>Wednesday</th>
			<th>Thursday</th>
			<th>Friday</th>
			<th>Saturday</th>
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
	<xsl:param name="date" />
	<xsl:variable name="last-month"	select="date:add($date, '-P1M')" />
	<xsl:call-template name="build-link">
		<xsl:with-param name="month" select="$last-month" />
		<xsl:with-param name="text">
			&#60; previous
		</xsl:with-param>
	</xsl:call-template>
</xsl:template>

<xsl:template name="following-month">
	<xsl:param name="date" />
	<xsl:variable name="next-month"	select="date:add($date, 'P1M')" />
	<xsl:call-template name="build-link">
		<xsl:with-param name="month" select="$next-month" />
		<xsl:with-param name="text">
			next &#62;
		</xsl:with-param>
	</xsl:call-template>
</xsl:template>


<xsl:template name="build-link">
	<xsl:param name="month" />
	<xsl:param name="text" />
	<a>
		<xsl:attribute name="href">
			<xsl:value-of select="$root" />
			<xsl:text>/</xsl:text>
			<xsl:if test="$parent-path != ''">
				<xsl:value-of select="$parent-path" />
				<xsl:text>/</xsl:text>				
			</xsl:if>
			<xsl:value-of select="$current-page" />
			<xsl:text>/</xsl:text>
			<xsl:choose>
				<xsl:when test="$session != ''">
					<xsl:value-of select="$session"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>+</xsl:text>					
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="date:year($month)" />
			<xsl:text>/</xsl:text>
			<xsl:value-of select="format-number(date:month-in-year($month) ,'00')" />
			<xsl:choose>
				<xsl:when test="$current-page = 'classes'">
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$classes" />
					<xsl:text>/</xsl:text>
					<xsl:if test="$places != ''">
						<xsl:value-of select="$places"/>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$current-page = 'places'">
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$places" />
					<xsl:text>/</xsl:text>
					<xsl:if test="$classes != ''">
						<xsl:value-of select="$classes"/>
					</xsl:if>
				</xsl:when>

			</xsl:choose>
		</xsl:attribute>
		<xsl:value-of select="$text" />
	</a>
</xsl:template>

<!-- override this to change what goes in the td -->
<xsl:template name="optional-hyperlink-to-date">
	<xsl:param name="day" />
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


<!-- display by week -->
<xsl:template name="calendar-by-week">  
  <xsl:param name="is-today">
    <xsl:choose>
      <xsl:when test="not($year) or $year='today' or $today = concat($year,'-',$month,'-',$day)">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="not-month">
    <xsl:choose>
      <xsl:when test="not($month)">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="not-day">
    <xsl:choose>
      <xsl:when test="not($day)">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="date">
    <xsl:choose>
      <xsl:when test="not($year) or $year='today'">
        <xsl:value-of select="$today"/>
      </xsl:when>
      <xsl:when test="$year and not($month)">
        <xsl:value-of select="concat($year,'-01-01')"/>
      </xsl:when>
      <xsl:when test="$year and $month and not($day)">
        <xsl:value-of select="concat($year,'-',$month,'-01')"/>
      </xsl:when>
      <xsl:when test="$year and $month and $day">
        <xsl:value-of select="concat(format-number($year,'0000'),'-',format-number($month,'00'),'-',format-number($day,'00'))"/>
      </xsl:when>
    </xsl:choose>
  </xsl:param>
    <xsl:param name="day">
      <xsl:choose>
        <xsl:when test="not($year) or $year='today'">
          <xsl:value-of select="substring($date,9,2)"/>
        </xsl:when>
        <xsl:when test="$month and not($day)">
          <xsl:value-of select="substring($date,9,2)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="format-number($day,'00')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:param>
    <xsl:param name="month">
      <xsl:choose>
        <xsl:when test="not($year) or $year='today'">
          <xsl:value-of select="substring($date,6,2)"/>
        </xsl:when>
        <xsl:when test="not($month) and $year!='today'">
          <xsl:value-of select="'01'"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="format-number($month,'00')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:param>
    <xsl:param name="year">
      <xsl:choose>
        <xsl:when test="not($year) or $year='today'">
          <xsl:value-of select="substring($date,1,4)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="format-number($year,'0000')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:param>
     <xsl:call-template name="calendar-week-setup">
       <xsl:with-param name="date" select="$date"/>
     </xsl:call-template>
</xsl:template>

<xsl:template name="calendar-week-setup">
	<xsl:param name="date" />
  <xsl:param name="weekday-format"/>
  <table summary="calendar">
    <thead>
      <tr>
        <th></th>
        <xsl:choose>
          <xsl:when test="$weekday-format='one-letter'">
            <th>M</th>
            <th>T</th>
            <th>W</th>
            <th>T</th>
            <th>F</th>
            <th>S</th>
          </xsl:when>
          <xsl:when test="$weekday-format='short'">
            <th>Mon</th>
            <th>Tue</th>
            <th>Wed</th>
            <th>Thu</th>
            <th>Fri</th>
            <th>Sat</th>
          </xsl:when>
          <xsl:otherwise>
            <th>Monday</th>
            <th>Tuesday</th>
            <th>Wednesday</th>
            <th>Thursday</th>
            <th>Friday</th>
            <th>Saturday</th>
          </xsl:otherwise>
        </xsl:choose>
      </tr>
    </thead>
    <tbody>
      <xsl:call-template name="calendar-week-hours">
				<xsl:with-param name="date" select="$date" />
				<xsl:with-param name="end" select="'20'" />
				<xsl:with-param name="skip" select="'13 14'"/>
			</xsl:call-template>
    </tbody>
  </table>
</xsl:template>



<xsl:template name="calendar-week-hours">
	<xsl:param name="date" />
  <xsl:param name="minutes" select="'00'"/>
  <xsl:param name="am-pm" select="'AM'"/>
	<xsl:param name="count" select="10"/>
	<xsl:param name="end" select="8" />
	<xsl:param name="skip"/>
  <xsl:param name="hour">
		<xsl:choose>
			<xsl:when test="$count = 0">12</xsl:when>
			<xsl:otherwise><xsl:value-of select="$count"/></xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="hour-two-four">
		<xsl:choose>
			<xsl:when test="$am-pm = 'PM'">
				<xsl:value-of select="$count+12"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$count"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	
	<xsl:variable name="relative">
		<xsl:text>-P</xsl:text>
		<xsl:choose>
			<xsl:when test="date:day-in-week($date) = 1">
				<xsl:value-of select="date:day-in-week($date)+5"/>
			</xsl:when>
			<xsl:when test="date:day-in-week($date) >= 2">
				<xsl:value-of select="date:day-in-week($date)-2" />
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
		<!-- -2 because it starts number from sunday which is 1 -->
		<xsl:text>D</xsl:text>
	</xsl:variable>
	<xsl:variable name="first-day-in-week">
		<xsl:value-of select="date:add($date,$relative)"/>
	</xsl:variable>
	<!-- hack to skip hours, fix me -->
	<xsl:if test="($count != '1') and ($count != '2') and ($count != 'PM')">
		
	<tr class="hour-row">
		<td class="hour"><xsl:value-of select="concat($hour,':',$minutes,' ',$am-pm)"/></td>
    <td>
			<ul>
			<xsl:apply-templates select="/data/*[starts-with(name(), 'schedule')]" mode="events">
				<xsl:with-param name="day" select="date:add($first-day-in-week,'P0D')" />
				<xsl:with-param name="time" select="$hour-two-four"/>
			</xsl:apply-templates>    	
			</ul>
    </td>
    <td>
			<ul>
			<xsl:apply-templates select="/data/*[starts-with(name(), 'schedule')]" mode="events">
				<xsl:with-param name="day" select="date:add($first-day-in-week,'P1D')" />
				<xsl:with-param name="time" select="$hour-two-four"/>
			</xsl:apply-templates>    	    	
			</ul>
    </td>
    <td>
			<ul>
			<xsl:apply-templates select="/data/*[starts-with(name(), 'schedule')]" mode="events">
				<xsl:with-param name="day" select="date:add($first-day-in-week,'P2D')" />
				<xsl:with-param name="time" select="$hour-two-four"/>
			</xsl:apply-templates>    	
			</ul>
    </td>
    <td>
			<ul>
			<xsl:apply-templates select="/data/*[starts-with(name(), 'schedule')]" mode="events">
				<xsl:with-param name="day" select="date:add($first-day-in-week,'P3D')" />
				<xsl:with-param name="time" select="$hour-two-four"/>
			</xsl:apply-templates>    	    	
			</ul>
    </td>
    <td>
			<ul>
			<xsl:apply-templates select="/data/*[starts-with(name(), 'schedule')]" mode="events">
				<xsl:with-param name="day" select="date:add($first-day-in-week,'P4D')" />
				<xsl:with-param name="time" select="$hour-two-four"/>
			</xsl:apply-templates>    	    	
			</ul>
    </td>
    <td>
			<ul>
			<xsl:apply-templates select="/data/*[starts-with(name(), 'schedule')]" mode="events">
				<xsl:with-param name="day" select="date:add($first-day-in-week,'P5D')" />
				<xsl:with-param name="time" select="$hour-two-four"/>
			</xsl:apply-templates>    	    	
			</ul>
    </td>
  </tr>
</xsl:if>

    <xsl:if test="$count &lt; 11 and $am-pm = 'AM'">
			<xsl:call-template name="calendar-week-hours">
      	<xsl:with-param name="minutes" select="$minutes"/>
	      <xsl:with-param name="am-pm" select="$am-pm"/>
				<xsl:with-param name="count" select="$count + 1"/>
				<xsl:with-param name="date" select="$date" />
				<xsl:with-param name="skip" select="$skip" />
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="$count = 11 and $am-pm = 'AM'">
			<xsl:call-template name="calendar-week-hours">
      	<xsl:with-param name="minutes" select="$minutes"/>
      	<xsl:with-param name="am-pm" select="'PM'"/>
				<xsl:with-param name="count" select="0"/>
				<xsl:with-param name="date" select="$date" />				
				<xsl:with-param name="skip" select="$skip" />
			</xsl:call-template>
    </xsl:if>
    <xsl:if test="$count &lt; $end and $am-pm = 'PM'">
			<xsl:call-template name="calendar-week-hours">
      	<xsl:with-param name="minutes" select="$minutes"/>
      	<xsl:with-param name="am-pm" select="$am-pm"/>
				<xsl:with-param name="count" select="$count + 1"/>
				<xsl:with-param name="date" select="$date" />
				<xsl:with-param name="skip" select="$skip" />
			</xsl:call-template>
    </xsl:if>
</xsl:template>


</xsl:stylesheet>