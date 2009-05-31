<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/header.xsl"/>
<xsl:import href="../utilities/footer.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />
	
<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>

<xsl:template match="/">

<html>
<head>
	<title>
		<xsl:call-template name="page-title"/>
	</title>
	<xsl:if test="$short = 0">
		<link rel="icon" type="images/png" href="{$workspace}/images/icons/bookmark.png" />
		<link rel="stylesheet" href="{$workspace}/css/screen.css" type="text/css" media="screen, projection" />
		<xsl:if test="$root-page = 'schedule'">
			<link rel="stylesheet" href="{$workspace}/css/calendar.css" type="text/css" media="screen, projection" />
		</xsl:if>
		<link rel="stylesheet" href="{$workspace}/css/print.css" type="text/css" media="print" />
		<!--[if IE]><link rel="stylesheet" href="{$workspace}/css/ie.css" type="text/css" media="screen, projection"><![endif]-->
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
		<script type="text/javascript" src="{$workspace}/javascript/github-voice/jquery.github-voice.js"></script>
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/github-voice.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/facebox.css" />
		<script type="text/javascript" src="{$workspace}/javascript/facebox.js"></script>
		<xsl:text disable-output-escaping="yes"><![CDATA[
		<script type="text/javascript">
		//<![CDATA[
		$(document).ready(function() { 
			$('a[rel^=facebox]').facebox();
		})	//]]>]]&gt;
		&lt;/script>
		</xsl:text>		
		<link rel="alternate" type="application/rss+xml" href="/rss/" />
	</xsl:if>
</head>
<body id="{$root-page}">
	<xsl:if test="$short = 0">
		<xsl:call-template name="header" />		
	</xsl:if>
	<div id="middle">
		<div id="content">
			<xsl:if test="$short = 0">
				<div id="badge"></div>
			</xsl:if>
      <xsl:apply-templates />
		</div>
	</div>
	<xsl:if test="$short = 0">
		<xsl:call-template name="footer" />		
	</xsl:if>
	</body>
</html>

</xsl:template>

</xsl:stylesheet>