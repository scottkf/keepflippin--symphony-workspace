<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="next-session">
	<xsl:param name="session"/>
	<xsl:variable name="s" select="substring-before($session, '-')" />
	<xsl:variable name="y" select="substring-after($session, '-')" />

	<xsl:choose>
		<xsl:when test="$s = 'fall'">
			<xsl:value-of select="'winter'"/>
			<xsl:text>-</xsl:text>
			<xsl:value-of select="$y + 1"/>			
		</xsl:when>
		<xsl:when test="$s = 'spring'">
			<xsl:value-of select="'summer'"/>
			<xsl:text>-</xsl:text>
			<xsl:value-of select="$y"/>
		</xsl:when>
		<xsl:when test="$s = 'summer'">
			<xsl:value-of select="'fall'"/>
			<xsl:text>-</xsl:text>
			<xsl:value-of select="$y"/>
		</xsl:when>
		<xsl:when test="$s = 'winter'">
			<xsl:value-of select="'summer'"/>
			<xsl:text>-</xsl:text>
			<xsl:value-of select="$y"/>			
		</xsl:when>
		<xsl:when test="$s = 'summer'">
			<xsl:value-of select="'fall'"/>
			<xsl:text>-</xsl:text>
			<xsl:value-of select="$y"/>			
		</xsl:when>
	</xsl:choose>
		
</xsl:template>

<xsl:template name="session-starts">
	<xsl:param name="session"/>
	<xsl:variable name="s" select="substring-before($session, '-')" />
	<xsl:variable name="y" select="substring-after($session, '-')" />
	<xsl:value-of select="$y"/>
	<xsl:value-of select="'/'"/>
	<xsl:choose>
		<xsl:when test="$s = 'spring'">
			<xsl:value-of select="'01'"/>
		</xsl:when>
		<xsl:when test="$s = 'summer'">
			<xsl:value-of select="'06'"/>
		</xsl:when>
		<xsl:when test="$s = 'winter'">
			<xsl:value-of select="'01'"/>
		</xsl:when>
		<xsl:when test="$s = 'fall'">
			<xsl:value-of select="'09'"/>
		</xsl:when>
	</xsl:choose>
</xsl:template>


</xsl:stylesheet>
