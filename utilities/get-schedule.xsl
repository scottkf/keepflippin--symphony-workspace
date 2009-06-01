<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	xmlns:math="http://exslt.org/math"
	extension-element-prefixes="date math">


<xsl:template match="/data/schedule*" mode="events">
	<xsl:param name="day" />
	<xsl:param name="time" />
	<xsl:variable name="y">
		<xsl:call-template name="format-date">
	    <xsl:with-param name="date" select="$day"/>
	    <xsl:with-param name="format" select="'Y'"/>
	  </xsl:call-template>
	</xsl:variable>
	<xsl:variable name="m">
		<xsl:call-template name="format-date">
	    <xsl:with-param name="date" select="$day"/>
	    <xsl:with-param name="format" select="'n'"/>
	  </xsl:call-template>
	</xsl:variable>
	<xsl:variable name="d">
		<xsl:call-template name="format-date">
	    <xsl:with-param name="date" select="$day"/>
	    <xsl:with-param name="format" select="'d'"/>
	  </xsl:call-template>
	</xsl:variable>
	<xsl:choose>
		<!-- filter by class, since we can't do it through the DS, otherwise we lose all over events -->
		<xsl:when test="$time = '' and entry[date/current = $day and name/@handle = 'closed']">
			<xsl:apply-templates select="entry[date/current = $day and name/@handle = 'closed']" mode="event" />
		</xsl:when>
		<xsl:when test="$time = '' and $classes != ''">
			<xsl:apply-templates select="entry[date/current = $day and (class/item/@handle = $classes or not(class))]" mode="event" />
		</xsl:when>
		<xsl:when test="$time != ''">
			<xsl:variable name="day-in-seconds" select="date:seconds(concat($day,'T',$time,':00:00'))" />
			<xsl:apply-templates select="entry[(date:day-in-week(date/current) = date:day-in-week($day)) and date:seconds(concat($day,'T',date/current/@time,':00')) &gt;= $day-in-seconds and date:seconds(concat($day,'T',date/current/@time,':00')) &lt; ($day-in-seconds + 3600)]" mode="event" />
		</xsl:when>
		<xsl:when test="$time = ''">
			<xsl:apply-templates select="entry[date/current = $day]" mode="event" />
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template match="/data/schedule*/entry" mode="event">
	<xsl:variable name="entry-id" select="class/item/@id" />
	<xsl:choose>
		<!-- if the item has a class attached -->
		<xsl:when test="class/item != ''">
				<li class="{class/item/@handle}">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$root" />
							<xsl:text>/classes/</xsl:text>
							<xsl:value-of select="class/item/@handle" />
							<xsl:text>?short</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="class">
							<xsl:text>colorbox</xsl:text>
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
