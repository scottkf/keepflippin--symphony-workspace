<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-gallery.xsl"/>

<xsl:template match="data">
	<ul id="gallery">
	<xsl:apply-templates select="photos-tags/entry" mode="photo" />
	</ul>
</xsl:template>




</xsl:stylesheet>