<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-places.xsl"/>

<xsl:template name="top">
	<div>
		<h2>
			<xsl:choose>
				<xsl:when test="$location != ''">
					<xsl:value-of select="/data/places/entry/name"/>					
				</xsl:when>
				<xsl:otherwise>
					Locations
				</xsl:otherwise>
			</xsl:choose>
		</h2>
	</div>
</xsl:template>

<xsl:template match="/data">
	<xsl:choose>
		<xsl:when test="$location != ''">
			<xsl:apply-templates select="places/entry" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="places" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
	
</xsl:stylesheet>