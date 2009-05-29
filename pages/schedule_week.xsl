<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-element-prefixes="date">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/calendar.xsl" />

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$session != ''">
			<h2><xsl:value-of select="$session"/> schedule</h2>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<div id="calendar">
		<a href="{$root}/schedule/{$session}">See what's going on by month!</a>
		<xsl:call-template name="calendar-by-week" />
	</div>
</xsl:template>


  
</xsl:stylesheet>