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
		<xsl:if test="$root-page = 'photos'">
			<link rel="stylesheet" href="{$workspace}/css/gallery.css" type="text/css" media="screen, projection" />
		</xsl:if>
		<link rel="stylesheet" href="{$workspace}/css/print.css" type="text/css" media="print" />
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/github-voice.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/colorbox.css" />
		<!--[if IE]><link rel="stylesheet" href="{$workspace}/css/ie.css" type="text/css" media="screen, projection"><![endif]-->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
		<script type="text/javascript" src="{$workspace}/javascript/github-voice/jquery.github-voice.js"></script>
		<script type="text/javascript" src="{$workspace}/javascript/jquery.colorbox-min.js"></script>
		<xsl:if test="$current-page = 'directions'">
	    <!-- <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAxNlWEKpbOHkXhcfIsQgzdRS6IlhYvigTexoEmVuvX9YqEp1AlhSBcZYf8lb4YEKLq_zXsBn8GeRmLQ" type="text/javascript"></script> -->
			<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAxNlWEKpbOHkXhcfIsQgzdRT2IVV_TNAFZZ5jxU7R4sNNB_DWmBSThAin4OyApzkMegv1jMZTPnRRDA" type="text/javascript"></script>
			<script type="text/javascript" src="{$workspace}/javascript/googlemaps.inc.js"></script>			
			<xsl:text disable-output-escaping="yes"><![CDATA[
			<script type="text/javascript">
				$(document).ready(function() {
					load()
				})
			</script>
			]]></xsl:text>		
		</xsl:if>
		<xsl:text disable-output-escaping="yes"><![CDATA[
		<script type="text/javascript">
		$(document).ready(function() { 
			$("a[rel='locations']").colorbox({transition:"elastic"});
			$('a.colorbox').colorbox({transition:"elastic", width:"55%"});
			$("a[rel='gallery']").colorbox({transition:"elastic"});				
		})
		</script>
		]]></xsl:text>		
		<link rel="alternate" type="application/rss+xml" href="/rss/" />
	</xsl:if>
</head>
<body id="{$root-page}">
	<xsl:if test="$short = 0">
		<xsl:call-template name="header" />
		<div id="middle">
			<div id="welcome-kf">
				<xsl:call-template name="top" />
			</div>
			<div id="content">
				<xsl:if test="$short = 0">
					<div id="badge"></div>
				</xsl:if>
	      <xsl:apply-templates />
			</div>
		</div>
	</xsl:if>
	<xsl:if test="$short = 1">
		<xsl:apply-templates />
	</xsl:if>
	<xsl:if test="$short = 0">
		<xsl:call-template name="footer" />		
	</xsl:if>
	</body>
</html>

</xsl:template>

</xsl:stylesheet>