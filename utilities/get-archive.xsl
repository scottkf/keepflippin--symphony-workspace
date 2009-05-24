<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="get-images.xsl"/>

<xsl:template name="article-list">
	<h2>The latest...</h2>
  <xsl:apply-templates select="news/entry" />
	<h2>
		<xsl:choose>
			<xsl:when test="$year &lt;= 2009 or $this-year = 2009">
				<a href="{$root}">There isn't anything older than this, please go back &#187;</a>
			</xsl:when>
			<xsl:when test="$year &gt; 2009">
				<a href="{$root}/{$root-page}/{substring($year - 1,1,4)}">View older &#187;</a>
			</xsl:when>
			<xsl:otherwise>
				<a href="{$root}/{$root-page}/{substring($this-year - 1,1,4)}">View older &#187;</a>
			</xsl:otherwise>
		</xsl:choose>
	</h2>
</xsl:template>

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

<xsl:template match="month/entry | news/entry">
  <div class="list">
    <span class="date">
      <xsl:call-template name="format-date">
        <xsl:with-param name="date" select="publish-this-article-on"/>
        <xsl:with-param name="format" select="'D'"/>
      </xsl:call-template>
    </span>
		<div class="article-wide">
			<xsl:apply-templates select="." mode="full" />
		</div>
  </div>
</xsl:template>

</xsl:stylesheet>