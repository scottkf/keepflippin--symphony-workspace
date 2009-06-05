<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>
<xsl:import href="../utilities/get-classes.xsl"/>

<xsl:template name="top">
	<div>
		<h2>
		<xsl:choose>
			<xsl:when test="$class != ''">
				<xsl:value-of select="/data/classes/entry/class-name"/>
				<xsl:apply-templates select="/data/classes/entry" mode="admin" />
			</xsl:when>
			<xsl:otherwise>
				Classes
			</xsl:otherwise>
		</xsl:choose>
		</h2>
	</div>
</xsl:template>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$class != ''">
		  <xsl:apply-templates select="classes/entry" mode="full" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="classes" mode="short" />
			<xsl:call-template name="important" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>