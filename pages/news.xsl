<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>
<xsl:import href="../utilities/get-archive.xsl"/>
<xsl:import href="../utilities/get-comments.xsl"/>

<xsl:template name="top">
	<div>
		<h2>
		<xsl:choose>
			<xsl:when test="$year != '' and $entry != ''">
				<xsl:value-of select="/data/news/entry/title"/>
				<xsl:apply-templates select="/data/news/entry" mode="admin" />
			</xsl:when>
			<xsl:otherwise>
				The latest...
			</xsl:otherwise>
		</xsl:choose>
	</h2>
	</div>
</xsl:template>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$year != '' and $entry != ''">
			<xsl:call-template name="single-article" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="article-list"/>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

</xsl:stylesheet>