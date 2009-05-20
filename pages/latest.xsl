<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-archive.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>

<xsl:template match="data">
  <h2>The latest...</h2>
  <xsl:apply-templates select="news"/>
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

</xsl:stylesheet>