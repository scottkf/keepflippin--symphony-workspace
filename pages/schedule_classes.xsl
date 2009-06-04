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
			Filtering by <b>&#8220;<xsl:value-of select="/data/classes/entry/class-name[@handle = $classes]"/>&#8221;</b>
			<!-- <xsl:if test="$places != ''">
				and by <b>&#8220;<xsl:value-of select="/data/classes/entry/class-name[@handle = $classes]"/>&#8221;</b>
			</xsl:if> -->
		</p>
	</div>
</xsl:template>


<xsl:template match="data">
	<xsl:variable name="number_of_results" select="count(/data/*[starts-with(name(), 'schedule')]/entry[class/item/@handle = $classes]/date/current)"/>
	<xsl:choose>
		<xsl:when test="$number_of_results = 0">
			Sorry, there aren't any <xsl:value-of select="classes/entry[class-name/@handle = $classes]/class-name"/> classes in this period.
		</xsl:when>
		<xsl:otherwise>
			We found <xsl:value-of select="number_of_results"/> classes for this period.
		</xsl:otherwise>
	</xsl:choose>
	<div id="calendar">
		<xsl:call-template name="calendar" />
	</div>
</xsl:template>
</xsl:stylesheet>