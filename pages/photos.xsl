<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-gallery.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:template name="top">
	<div>
		<xsl:choose>
			<xsl:when test="$gallery != ''">
				<h2>Photos</h2>
				<p>
				<b><xsl:value-of select="/data/galleries/entry/title"/></b> &#8212;
				<xsl:value-of select="/data/galleries/entry/short-description"/>
				</p>
			</xsl:when>
			<xsl:otherwise>
				<h2>Media</h2>
			</xsl:otherwise>
		</xsl:choose>
	</div>
</xsl:template>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$gallery != ''">
			<xsl:call-template name="gallery" />
		</xsl:when>
		<xsl:otherwise>
			<div id="left">
			<h4>Photos</h4>
			<h5>click on a gallery to view it's contents!</h5>
			<xsl:call-template name="gallery-list"/>
			<h4>Videos</h4>
			<p>
				<a href="http://www.facebook.com/pages/Jupiter-FL/Keep-Flippin/208723055787?ref=nf#/pages/Jupiter-FL/Keep-Flippin/208723055787?v=app_2392950137&amp;viewas=661097653">@facebook</a>
			</p>
		</div>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>




</xsl:stylesheet>