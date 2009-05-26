<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="places">
	<xsl:apply-templates select="places/entry" />
</xsl:template>


<xsl:template match="places/entry">
	<xsl:param name="admin" />
	<xsl:param name="entry-id" select="@id" />
	<h3>
		<a href="{$root}/news/{substring(publish-this-article-on, 1, 4)}/{title/@handle}/">
			<xsl:value-of select="name"/>
		</a>
		<xsl:if test="$admin">
			<xsl:apply-templates select="." mode="admin" />
		</xsl:if>
	</h3>
	<xsl:copy-of select="*" />
</xsl:template>