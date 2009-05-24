<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl" />
<xsl:import href="../utilities/get-archive.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>
<xsl:import href="../utilities/calendar.xsl" />

<xsl:param name="places" />
<xsl:param name="classes" />
<xsl:template match="data">
	<div id="events">
		<ul>
			<xsl:apply-templates select="/data/schedule/*/*/*/entry" mode="event">
				<xsl:with-param name="day" select="$relative-day" />
			</xsl:apply-templates>
		</ul>
	</div>
	<div id="calendar">
		<xsl:call-template name="calendar" />
	</div>
</xsl:template>
</xsl:stylesheet>