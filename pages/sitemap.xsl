<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" omit-xml-declaration="no" />
 
<xsl:template match="/">
	<xsl:call-template name="sitemap" />
</xsl:template>
 
<xsl:template name="sitemap">
<urlset
      xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
		<xsl:apply-templates select="/data/navigation/page" mode="sitemap" />
</urlset>
</xsl:template>
 
<xsl:template match="page" mode="sitemap">
    <url>
        <loc>
            <xsl:value-of select="concat($root,'/')"/>
            <xsl:for-each select="ancestor::page | current()">
                <xsl:value-of select="concat(@handle,'/')"/>
            </xsl:for-each>
        </loc>
    </url>
    <xsl:apply-templates select="page[not(types/type = 'hidden') and not(types/type = 'admin')]" mode="sitemap"/>
</xsl:template>
 
</xsl:stylesheet>