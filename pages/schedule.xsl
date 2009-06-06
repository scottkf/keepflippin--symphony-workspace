<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-element-prefixes="date">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/calendar.xsl" />

<xsl:template name="top">
	<div>
		<h2>Schedule</h2>
		<ul class="nav">
			<li><a href="{$root}/schedule/calendar/{$this-session}">View the monthly calendar</a></li>
		</ul>
	</div>
</xsl:template>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$session != ''">
			<xsl:if test="$session != '+'">
				<h3><xsl:value-of select="substring-before($session, '-')"/>&#160;<xsl:value-of select="substring-after($session,'-')"/> schedule</h3>
			</xsl:if>
			<xsl:if test="$places != ''">
				<h4>Filtering by place: &#8220;<xsl:value-of select="schedule/entry/place/item"/>&#8221;</h4>
			</xsl:if>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<div id="calendar">
		<xsl:call-template name="calendar-by-week" />
	</div>
</xsl:template>


  
</xsl:stylesheet>