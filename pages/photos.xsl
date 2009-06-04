<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-gallery.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:template name="top">
	<div>
		<h2>Photos</h2>
		<p>
			<xsl:choose>
				<xsl:when test="$gallery != ''">
					<b><xsl:value-of select="/data/galleries/entry/title"/></b> &#8212;
					<xsl:value-of select="/data/galleries/entry/short-description"/>
				</xsl:when>
				<xsl:otherwise>
					click on a gallery to view it's contents!
				</xsl:otherwise>
			</xsl:choose>
		</p>
	</div>
</xsl:template>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$gallery != ''">
			<xsl:call-template name="gallery" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="gallery-list"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>




</xsl:stylesheet>