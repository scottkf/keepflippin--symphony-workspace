<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-gallery.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$gallery != ''">
			<xsl:call-template name="gallery" />
		</xsl:when>
		<xsl:otherwise>
			<h2>Galleries</h2>
			<h4>click on a gallery to view it's contents!</h4>
			<xsl:call-template name="gallery-list"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>




</xsl:stylesheet>