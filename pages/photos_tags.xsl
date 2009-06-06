<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-gallery.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:template name="top">
	<div>
		<h2>Photos</h2>
		<p>
			Everything related to <b>&#8220;<xsl:value-of select="/data/photos-tags/entry/tags/item[@handle = $tags]"/>&#8221;</b>
		</p>
	</div>
</xsl:template>

<xsl:template match="data">
	<ul id="gallery">
	<xsl:apply-templates select="photos-tags/entry" mode="photo" />
	</ul>

   <xsl:call-template name="pagination">
       <xsl:with-param name="pagination-element" select="/data/photos-tags/pagination" />
       <xsl:with-param name="display-number" select="'3'" />
			 <xsl:with-param name="url">
			 	 <xsl:value-of select="$root"/>
				<xsl:value-of select="'/photos/tags/'"/>
				<xsl:value-of select="$tags"/>
				<xsl:value-of select="'/$'"/>
			 </xsl:with-param>
   </xsl:call-template>

</xsl:template>




</xsl:stylesheet>