<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl" />
<xsl:import href="../utilities/get-archive.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>
<xsl:import href="../utilities/calendar.xsl" />

<xsl:template name="top">
	<div>
		<h2>Schedule</h2>
		<p>
			Showing only classes at <b>&#8220;<xsl:value-of select="/data/schedule-events-places-classes/entry/place/item"/>&#8221;</b>
		</p>
	</div>
</xsl:template>

<xsl:template match="data">
	<div id="calendar">
		<xsl:call-template name="calendar" />
	</div>
</xsl:template>
</xsl:stylesheet>