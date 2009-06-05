<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="performances">
	<h3>
		<a href="{$root}/schedule">Upcoming performances</a>
		<xsl:if test="$is-logged-in = 'true'">
			<xsl:text> &#8212; </xsl:text>
			<a href="{$root}/symphony/publish/{section/@handle}/new/">Add</a>
		</xsl:if>
	</h3>
	<dl class="performance">
		<xsl:apply-templates select="entry"/>
	</dl>
</xsl:template>

<xsl:template match="performances/entry">
	<dt>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="start-date"/>
			<xsl:with-param name="format" select="'d m t'"/>
		</xsl:call-template>
		<xsl:if test="end-date != ''">
			<xsl:text> until </xsl:text>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="end-date"/>
				<xsl:with-param name="format" select="'t'"/>
			</xsl:call-template>
			<xsl:text> &#8212; </xsl:text>
		</xsl:if>
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