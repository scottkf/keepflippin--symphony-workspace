<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>
<xsl:import href="../utilities/get-classes.xsl"/>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="class != ''">
			  <xsl:apply-templates select="classes/entry" mode="full" />
		</xsl:when>
		<xsl:otherwise>
		  <xsl:apply-templates select="classes/entry" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>