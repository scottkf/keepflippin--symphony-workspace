<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="places">
	<xsl:apply-templates select="entry" />
</xsl:template>

<xsl:template match="places/entry">
	<h2><xsl:value-of select="name"/></h2>
	<b>Address:</b>	<xsl:value-of select="street-address"/>
	<xsl:if test="suite != ''">
		suite# <xsl:value-of select="suite"/>, 
	</xsl:if>
	<xsl:value-of select="city"/>, <xsl:value-of select="state"/>, <xsl:value-of select="postal-code"/>, 
	<xsl:value-of select="country"/><br />
	<b>Type</b>: <xsl:value-of select="type/item"/>
	<p>
		<a href="{$root}/schedule/places/+/{$this-year}/{$this-month}/{name/@handle}">View classes at this location on the calendar</a>
	</p>
</xsl:template>
	
</xsl:stylesheet>