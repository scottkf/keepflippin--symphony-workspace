<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	xmlns:math="http://exslt.org/math"
	extension-element-prefixes="date math">

<xsl:template match="/data/schedule*" mode="events">
	<xsl:param name="day" />
	<xsl:choose>
		<!-- filter by class, since we can't do it through the DS -->
		<xsl:when test="$classes != ''">
			<xsl:apply-templates select="entry[class/item/@handle = $classes or not(class)]">
				<xsl:with-param name="day" select="$day"/>
			</xsl:apply-templates>
		</xsl:when>
		<!-- otherwise give everything -->
		<xsl:otherwise>
			<xsl:apply-templates select="entry">
				<xsl:with-param name="day" select="$day"/>
			</xsl:apply-templates>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="/data/schedule*/entry">
	<xsl:param name="day" />
	
	<!-- check if we can display the class -->
	<xsl:variable name="start-day" select="date/start" />
	<xsl:variable name="current-day" select="date/current" />
	<xsl:variable name="end-day" select="date/end" />

	<!-- if the event exists in this month, this not be necessary since I altered the DS -->
		<!-- <xsl:if test="(not(contains(date:difference($start-day,$day),'-')) and contains(date:difference($end-day,$day),'-')) or date:month-in-year($current-day) = date:month-in-year($day)"> -->
	<xsl:choose>
		<!-- event repeating every week -->
		<xsl:when test="((date/@mode = 'weeks' and date/@units = '1') or (date/@mode = 'days' and date/@units = '7')) and date:day-name($current-day) = date:day-name($day)">
				<xsl:apply-templates select="." mode="event" />
		</xsl:when>
		<!-- event repeating every day -->
		<xsl:when test="(date/@mode = 'days')">
			<!-- the difference in days between the start day and current
			 			substring removes the xs:duration crap so we're left with a difference in days
			-->
			<xsl:variable name="date-difference" select="substring-after(substring-before(date:difference($day,$start-day),'D'),'P')" />
			<xsl:if test="(translate($start-day,'-','') &lt;= translate($day,'-','')) and (translate($day,'-','') &lt;= translate($end-day,'-','')) and $date-difference mod date/@units = 0">
				<xsl:apply-templates select="." mode="event" />					
			</xsl:if>
		</xsl:when>
		<!-- event repeating every month (by date) 
					the expression in the middle calculates the absolute number of months between two dates (not mod 12)
					((current-month - original-month) + (current-year - original-year)*12) mod how-often-in-months-it-repeats
					the variables $current-day and $day are backwards here
		-->
		<xsl:when test="date/@mode = 'months-by-date' and (math:abs(date:month-in-year($day) - date:month-in-year($current-day) + (date:year($day) - date:year($current-day))*12) mod date/@units = 0) and date:day-in-month($current-day) = date:day-in-month($day)">
			<xsl:apply-templates select="." mode="event" />				
		</xsl:when>
	</xsl:choose>		
	
</xsl:template>

<xsl:template match="/data/schedule*/entry" mode="event">
	<xsl:variable name="entry-id" select="class/item/@id" />
	<xsl:choose>
		<!-- if the item has a class attached -->
		<xsl:when test="class != ''">
				<li class="{/data/classes-list/entry[@id = $entry-id]/class-name/@handle}">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$root" />
							<xsl:text>/classes/class/</xsl:text>
							<xsl:value-of select="/data/classes-list/entry[@id = $entry-id]/class-name/@handle" />
						</xsl:attribute>
						<xsl:value-of select="name" />
					</a>
					<!-- <xsl:copy-of select="substring(/data/classes-list/entry[@id = $entry-id]/description/*,1,50)" />
					<xsl:if test="string-length(/data/classes-list/entry[@id = $entry-id]/description) &gt; 50">
						<a href="{$root}/news/{title/@handle}/">
							...
						</a>
					</xsl:if> -->
				</li>
		</xsl:when>
		<!-- otherwise it's a non-class event, like 'tuition due' -->
		<xsl:otherwise>
			<li>
				<a href="#">
					<xsl:value-of select="name" />
				</a>
			</li>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


</xsl:stylesheet>
