<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="performances">
  <xsl:if test="count(entry) &gt; 0">
  	<h3 style="margin-bottom: 0px">
                   
  		<a name="performances">Upcoming performances</a>
  		<xsl:if test="$is-logged-in = 'true'">
  			<xsl:text> &#8212; </xsl:text>
  			<a href="{$root}/symphony/publish/{section/@handle}/new/">Add</a>
  		</xsl:if>
  	</h3>
        <h4>by our <a href="{$root}/showteam">performing Showteam</a></h4>
  	<dl class="performance">
  		<xsl:apply-templates select="entry"/>
  	</dl>
  </xsl:if>
</xsl:template>

<xsl:template match="performances/entry">
	<dt>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="start-date"/>
			<xsl:with-param name="format" select="'M d, t'"/>
		</xsl:call-template>
		<xsl:if test="end-date != ''">
			<xsl:text> until </xsl:text>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="end-date"/>
				<xsl:with-param name="format" select="'t'"/>
			</xsl:call-template>
			<xsl:text> &#8212; </xsl:text>
		</xsl:if><xsl:text>&#160;</xsl:text>
		<a>
			<xsl:if test="url != ''">
				<xsl:attribute name="href">
					<xsl:value-of select="url" />
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="location" />
		</a>
	</dt>
	<dd><xsl:copy-of select="description/*"/></dd>
	
</xsl:template>

</xsl:stylesheet>