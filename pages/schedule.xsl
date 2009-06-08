<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-element-prefixes="date">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/calendar.xsl" />

<xsl:template name="top">
	<div>
		<h2>
			<xsl:if test="$session != '+' and $session != ''">
				<xsl:value-of select="substring-before($session, '-')"/>&#160;<xsl:value-of select="substring-after($session,'-')"/>
			</xsl:if>
			Schedule
		</h2>
		<ul class="nav">
			<li><a href="{$root}/schedule/calendar/{$this-session}">View the monthly calendar</a></li>
		</ul>
	</div>
</xsl:template>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$session != ''">
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<div id="calendar">
		<xsl:call-template name="calendar-by-week" />
	</div>
</xsl:template>


  
</xsl:stylesheet>