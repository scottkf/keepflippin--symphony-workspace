<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template name="top">
	<div>
		<h2>Directions</h2>
	</div>
</xsl:template>

<xsl:template match="data">
	<div id="map" style="width: 556px; height: 500px"></div>
	<p>
		You can use the controls on the top left side of the map to navigate around (zoom, pan, flip), and you can also get driving directions either <b>to</b> Keep Flippin' or <b>From</b> Keep Flippin'. Javascript must be enabled, and if you're interested in driving directions, popups must be enabled from Keep Flippin'.
	</p>
	<p>
		If at this point, nothing works... We are located just east of I-95 and the turnpike, in the Winn Dixie shopping plaza on the north side of Indiantown Road in Jupiter, FL. Our address is 6761 Indiantown Road #4. We are located in the cutout near Palm Beach Ice Cream and Atlantic Arts.
	</p>
</xsl:template>

</xsl:stylesheet>
