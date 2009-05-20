<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-archive.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>
<xsl:import href="../utilities/calendar.xsl" />

<xsl:template match="data">
	<style type="text/css">
		table { border: 1px solid black; }
		tr { border: 1px solid black; }
		td { border: 1px solid black; height: 20px; width: 20px }
		.this-day { background-color: green; }
		.other-month { background-color: #bbb; color: #888 }
	</style>
	<xsl:call-template name="calendar" />
</xsl:template>

</xsl:stylesheet>