<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>

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
		<link rel="icon" type="images/png" href="{$workspace}/images/icons/bookmark.png" />
	<link rel="stylesheet" href="{$workspace}/css/screen.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="{$workspace}/css/index.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="{$workspace}/css/print.css" type="text/css" media="print" />
	<!--[if IE]><link rel="stylesheet" href="{$workspace}/css/ie.css" type="text/css" media="screen, projection"><![endif]-->
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/github-voice.css" />
		<link rel="alternate" type="application/rss+xml" href="/rss/" />
	</head>
	<body>
		<div id="masthead">
			<h1>
				<a href="{$root}"><xsl:value-of select="$website-name"/></a>
			</h1>
			<h1>
				<a href="#" class="testing"><xsl:value-of select="$website-name"/></a>
			</h1>
			<xsl:apply-templates select="data/navigation"/>
		</div>
		<div id="package">
			<div id="content">
				<xsl:apply-templates/>
			</div>
		</div>
		<ul id="footer">
			<li>Orchestrated by <a class="symphony" href="http://symphony21.com/">Symphony</a></li>
			<li>Broadcasted via <a class="rss" href="{$root}/rss/">XML Feed</a></li>
		</ul>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="{$workspace}/javascript/github-voice/jquery.github-voice.js"></script>
<xsl:text disable-output-escaping="yes"><![CDATA[
<script type="text/javascript">
//<![CDATA[
$(function() {
  $('a.testing').githubVoice('scottkf', 'keepflippin--on-symphony');
});
//]]>]]&gt;
&lt;/script>
</xsl:text>
	</body>
</html>

</xsl:template>

</xsl:stylesheet>