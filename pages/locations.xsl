<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-places.xsl"/>

<xsl:template match="/data">
	<xsl:apply-templates select="places" />
</xsl:template>
	
</xsl:stylesheet>