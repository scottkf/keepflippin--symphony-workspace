<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl" />
<xsl:import href="../utilities/get-archive.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>
<xsl:import href="../utilities/calendar.xsl" />

<xsl:template name="top">
	<div>
		<h2>
			<xsl:if test="$session != ''">
				<xsl:value-of select="substring-before($session, '-')"/>&#160;<xsl:value-of select="substring-after($session,'-')"/>
			</xsl:if>
			Schedule
		</h2>
		<ul class="nav">
			<li><a href="{$root}/schedule/{$session}">View the weekly schedule</a></li>
		</ul>
	</div>
</xsl:template>

<xsl:param name="places" />
<xsl:param name="classes" />
<xsl:template match="data">
	<!-- <div id="events">
		<ul>
			<xsl:apply-templates select="/data/schedule/entry" mode="event">
				<xsl:with-param name="day" select="$relative-day" />
			</xsl:apply-templates>
		</ul>
	</div> -->
	<div id="show-hide-links">
	</div>
	<div id="calendar-month">
		<xsl:call-template name="calendar" />
	</div>
</xsl:template>
</xsl:stylesheet>