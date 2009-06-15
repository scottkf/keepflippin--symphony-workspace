<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/header.xsl"/>
<xsl:import href="../utilities/footer.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>
<xsl:import href="../utilities/next-session.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />
	
<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>
<xsl:variable name="next-session">
	<xsl:call-template name="next-session">
		<xsl:with-param name="session" select="$this-session"/>
	</xsl:call-template>
</xsl:variable>

<xsl:template match="/">

<html>
<head>
	<title>
		<xsl:call-template name="page-title"/>
	</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta name="description" content="Keep Flippin' is performance-based gymnastics. We are also franchising!" />
  <meta name="keywords" content="gymnastic franchising, franchising, performance gymnastics, performance franchising, gymnastic franchise, franchise, keep flipping, keep flipping gymnastics" />
  <meta name="copyright" content="Keep Flippin'" />
  <meta name="company" content="Keep Flippin'" />
	<xsl:if test="$short = 0">
		<link rel="icon" type="images/png" href="{$workspace}/images/icons/bookmark.png" />
		<link rel="stylesheet" href="{$workspace}/css/screen.css" type="text/css" media="screen, projection" />
		<xsl:if test="$root-page = 'schedule'">
			<link rel="stylesheet" href="{$workspace}/css/calendar.css" type="text/css" media="screen, projection" />
		</xsl:if>
		<xsl:if test="$root-page = 'photos'">
			<link rel="stylesheet" href="{$workspace}/css/gallery.css" type="text/css" media="screen, projection" />
		</xsl:if>
		<xsl:if test="$current-page = 'tags'">
			<link rel="stylesheet" href="{$workspace}/css/pagination.css" type="text/css" media="screen, projection" />			
		</xsl:if>
		<link rel="stylesheet" href="{$workspace}/css/print.css" type="text/css" media="print" />
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/colorbox.css" />
		<!--[if IE]><link rel="stylesheet" href="{$workspace}/css/ie.css" type="text/css" media="screen, projection"><![endif]-->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
		<script type="text/javascript" src="{$workspace}/javascript/jquery.colorbox-min.js"></script>
  	<script type="text/javascript" src="{$workspace}/javascript/analytics.js"></script>
		<script type="text/javascript" src="{$workspace}/javascript/site.js"></script>
		<xsl:if test="$current-page = 'calendar'">
			<script type="text/javascript" src="{$workspace}/javascript/calendar.js"></script>			
		</xsl:if>
		<xsl:if test="$is-logged-in = 'true' and ($current-page = 'schedule' or $current-page = 'calendar' or $root-page = 'schedule')">
			<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/datepicker.css" />
			<script type="text/javascript" src="{$workspace}/javascript/datejs.core.js"></script>
			<script type="text/javascript" src="{$workspace}/javascript/dates.js"></script>
		</xsl:if>
		<xsl:if test="$current-page = 'directions'">
			<xsl:call-template name="head" />
		</xsl:if>
		<link rel="alternate" type="application/rss+xml" href="{$root}/rss/" />
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