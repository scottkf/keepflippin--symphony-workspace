<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	xmlns:math="http://exslt.org/math"
	extension-element-prefixes="date math">

<xsl:import href="date-time.xsl" />

<xsl:template match="/data/schedule*" mode="events">
	<xsl:param name="day" />
	<xsl:param name="time" />
	<xsl:param name="limit" select="'3'" />
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
  <xsl:copy-of select="date"/>
	<xsl:choose>
		<!-- filter by class, since we can't do it through the DS, otherwise we lose all other events -->
		<xsl:when test="$time = '' and entry[date/current = $day and name/@handle = 'closed']">
			<xsl:apply-templates select="entry[date/current = $day and name/@handle = 'closed']" mode="event" />
		</xsl:when>
		<xsl:when test="$time = '' and $classes != ''">
			<xsl:apply-templates select="entry[class/item/@handle != 'event' and (date/current = $day or (date/start = $day and date/end = $day)) and (class/item/@handle = $classes)]" mode="event" />
		</xsl:when>
		<xsl:when test="$time != ''">
			<xsl:variable name="day-in-seconds" select="date:seconds(concat($day,'T',format-number($time, '00'),':00:00'))" />
			<xsl:apply-templates select="entry[class/item/@handle != 'summer-camp' and (date:day-in-week(date/current) = date:day-in-week($day)) and date:seconds(concat($day,'T',date/current/@time,':00')) &gt;= $day-in-seconds and date:seconds(concat($day,'T',date/current/@time,':00')) &lt; ($day-in-seconds + 3600)]" mode="event" />
		</xsl:when>
		<xsl:when test="$time = ''">
			<!-- grab all the regular events -->
			<xsl:apply-templates select="entry[class/item/@handle = 'event' and date/current = $day]" mode="event" />			
			<xsl:apply-templates select="entry[class/item/@handle != 'summer-camp' and class/item/@handle != 'event' and date/current = $day][position() &lt; $limit]" mode="event" />
			<xsl:apply-templates select="entry[class/item/@handle != 'summer-camp' and class/item/@handle != 'event' and date/current = $day][position() &gt;= $limit]" mode="event">
				<xsl:with-param name="css-class">
					<xsl:value-of select="'overflow'"/>
				</xsl:with-param>
				<xsl:with-param name="day" select="$day" />
			</xsl:apply-templates>
			<xsl:if test="count(entry[class/item/@handle != 'event' and class/item/@handle != 'summer-camp' and date/current = $day]) &gt; 0">
				<li class="more" rel="{$d}">
					<a href="javascript:Calendar.toggleClasses('{$d}')">&#8230; more</a>
				</li>
			</xsl:if>
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template match="/data/schedule*/entry" mode="event">
	<xsl:param name="css-class" />
	<xsl:param name="day" />
	<xsl:variable name="entry-id" select="class/item/@id" />
	<xsl:variable name="d">
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="$day"/>
			<xsl:with-param name="format" select="'d'"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:choose>
		<!-- if the item has a class attached -->
		<xsl:when test="class/item/@handle != 'summer-camp' and class/item/@handle != 'team' and class/item/@handle != 'event'">
				<li>
					<xsl:if test="$css-class != ''">
						<xsl:attribute name="rel">
							<xsl:value-of select="$d"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="class">
						<xsl:value-of select="class/item/@handle"/>
						<xsl:if test="$css-class != ''">
							<xsl:text> </xsl:text>
							<xsl:value-of select="$css-class"/>
						</xsl:if>
						<xsl:value-of select="' class'"/>
					</xsl:attribute>
					<a title="{class/item}">
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
						<xsl:if test="$current-page != 'schedule'">
							<small> &#8212;
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date/start"/>
									<xsl:with-param name="format" select="'t'" />
								</xsl:call-template>
							</small>
						</xsl:if>
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
				<xsl:attribute name="class">
					<xsl:value-of select="name/@handle"/>
					<xsl:if test="class/item/@handle = 'team'">
						<xsl:value-of select="' class'"/>
					</xsl:if>
				</xsl:attribute>
				<a href="#">
					<xsl:value-of select="name" />
					<xsl:if test="class/item/@handle = 'summer-camp'"><br />
						<xsl:if test="string(date/start/@time) != string(date/end/@time)">
							<small><em>
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date/start"/>
									<xsl:with-param name="format" select="'t'" />
								</xsl:call-template>
								&#8212;
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date/end"/>
									<xsl:with-param name="format" select="'t'" />
								</xsl:call-template>
							</em></small>							
						</xsl:if>
					</xsl:if>
				</a>
			</li>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


</xsl:stylesheet>
