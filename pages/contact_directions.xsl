<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template name="head">
  <!-- <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAxNlWEKpbOHkXhcfIsQgzdRS6IlhYvigTexoEmVuvX9YqEp1AlhSBcZYf8lb4YEKLq_zXsBn8GeRmLQ" type="text/javascript"></script> -->
	<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAxNlWEKpbOHkXhcfIsQgzdRT2IVV_TNAFZZ5jxU7R4sNNB_DWmBSThAin4OyApzkMegv1jMZTPnRRDA" type="text/javascript"></script>
	<script type="text/javascript" src="{$workspace}/javascript/googlemaps.inc.js"></script>			
	<xsl:text disable-output-escaping="yes"><![CDATA[
	<script type="text/javascript">
		$(document).ready(function() { 
				]]></xsl:text>
	<xsl:for-each select="/data/places-directions/entry">
		<xsl:text disable-output-escaping="yes"><![CDATA[
			point[k] = new GLatLng(]]></xsl:text><xsl:value-of select="latitude-longitude"/>
		<xsl:text disable-output-escaping="yes"><![CDATA[);
			address[k++] = "]]></xsl:text>
			<xsl:value-of select="street-address"/><br /><xsl:value-of select="city"/>, <xsl:value-of select="state/item"/>.  <xsl:value-of select="postal-code"/><br /><xsl:value-of select="phone-number"/>
		<xsl:text disable-output-escaping="yes"><![CDATA[";
		]]></xsl:text>		
	</xsl:for-each>
	<xsl:text disable-output-escaping="yes"><![CDATA[
			load();
		});
		window.unload = GUnload;
		</script>
	]]></xsl:text>
</xsl:template>

<xsl:template name="top">
	<div>
		<h2>Directions</h2>
	</div>
</xsl:template>

<xsl:template match="data">
	<div id="left" class="directions">
	<div id="map" style="width: 556px; height: 500px"></div>
	</div>
	<div id="right" class="directions">
		<h3>Information</h3>
		<p>
			You can use the controls on the top left side of the map to navigate around (zoom, pan, flip), and you can also get driving directions either <b>to</b> Keep Flippin' or <b>From</b> Keep Flippin'. Javascript must be enabled, and if you're interested in driving directions, popups must be enabled from Keep Flippin'.
		</p>
		<p>
			Click on a location name to go to that location in the map.
		</p>
		<p>
			<xsl:for-each select="places-directions/entry">
				<span>
					<h4>
						<a href="#">
							<xsl:attribute name="id">
								<xsl:value-of select="'place-addresses'"/>
								<xsl:value-of select="position()-1"/>
							</xsl:attribute>
							<xsl:value-of select="name"/>
						</a>
					</h4>
					<xsl:value-of select="street-address"/><br /><xsl:value-of select="city"/>, <xsl:value-of select="state/item"/>.  <xsl:value-of select="postal-code"/><br /><xsl:value-of select="phone-number"/>
				</span>
			</xsl:for-each>
		</p>
	</div>
</xsl:template>

</xsl:stylesheet>
