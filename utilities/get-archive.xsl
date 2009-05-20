<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="get-images.xsl"/>

<xsl:template match="news">
  <xsl:apply-templates select="year/month"/>
</xsl:template>

<xsl:template match="month">
  <h4>
    <xsl:call-template name="format-date">
      <xsl:with-param name="date" select="concat(../@value, '-', @value, '-01')"/>
      <xsl:with-param name="format" select="'M Y'"/>
    </xsl:call-template>
  </h4>
  <xsl:apply-templates select="entry"/>
</xsl:template>

<xsl:template match="month/entry">
  <div class="list">
    <span class="date">
      <xsl:call-template name="format-date">
        <xsl:with-param name="date" select="publish-this-article-on"/>
        <xsl:with-param name="format" select="'D'"/>
      </xsl:call-template>
    </span>
		<div class="article">
			<xsl:apply-templates select="." mode="full" />
		</div>
  </div>
</xsl:template>

</xsl:stylesheet>