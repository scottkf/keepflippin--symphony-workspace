<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>
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
		<link rel="icon" type="images/png" href="{$workspace}/images/icons/bookmark.png" />
	<link rel="stylesheet" href="{$workspace}/css/screen.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="{$workspace}/css/index.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="{$workspace}/css/print.css" type="text/css" media="print" />
	<!--[if IE]><link rel="stylesheet" href="{$workspace}/css/ie.css" type="text/css" media="screen, projection"><![endif]-->
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/github-voice.css" />
		<link rel="alternate" type="application/rss+xml" href="/rss/" />
	</head>
<body id="{$current-page}">
	<a id="feedback" href="#" />
	<div id="header">


		
		<div id="logo">
			<a href="{$root}"><img src="{$workspace}/images/kf-logo.png" alt="keep flippin' logo"/></a>
		</div>
		<div id="menu">
			<ul>
				<xsl:choose>
					<xsl:when test="/data/events/login-info/@logged-in = 'true'">
						<li><a href="{$root}/symphony/logout/">Logout</a></li> 
					</xsl:when>
					<xsl:otherwise>
						<li><a href="{$root}/symphony">Login</a></li> 
					</xsl:otherwise>
				</xsl:choose>
				<li><a href="{$root}">Register</a></li> 
				<li><a href="{$root}">Locations</a></li> 
				<li><a href="{$root}">Community</a></li> 
			</ul>
		</div>
		<div id="nav">
			<xsl:apply-templates select="data/navigation"/>
		</div>
	</div>
	<div id="middle">
		<div id="content">
			<div id="badge">
			</div>
                        <xsl:apply-templates />
		</div>
	</div>
	<div id="footer">
		<div id="left">
			<div id="camp">
				<h2><a href="{$root}">Summer Camp - Gymnastics, field trips, games, and more!</a></h2>
				<p>Come join us for Summer camp! There will be gymnastics, games, field trips, karate, movies, talent shows, ice cream parties and much much more! Camp starts on June 8th and goes through July 31st. <a href="{$root}">Read More...</a></p>
			</div>
			<div id="classes">
				<h2><a href="{$root}">Our Classes - for any skill level</a></h2>
				<p>Our USA Program is comprised of three different skill levels: <a href="{$root}">Red</a> for beginners, <a href="White">White</a> for Intermediate gymnasts, and
	               <a href="{$root}">Blue</a> for Advanced gymnasts.</p>
		
				<p>In addition, we also have classes available <a href="http://some-site.com/">Middle School</a> and High School students, as well as <a
	               href="http://some-site.com/">Open Gym</a>, where students can focus on what they wish.</p>
			</div>
		</div>
		<div id="news">
			<h2><a href="{$root}/latest">Latest News - learn about new happenings at keep flippin'</a></h2>
         <xsl:apply-templates select="/data/frontpage-news-items/entry" />
			<h3><a href="{$root}/latest">Looking for further information? Please continue on and read more...</a></h3>
		</div>

		<hr />
		
		<div id="bottom_nav">
			<ul>
				<li><a href="{$root}">home</a></li>
				<li><a href="{$root}">classes</a></li>
				<li><a href="{$root}">schedule</a></li>
				<li><a href="{$root}">franchising</a></li>
				<li><a href="{$root}">summer camp</a></li>
				<li><a href="{$root}">pictures</a></li>
				<li><a href="{$root}">search</a></li>
				<li><a href="{$root}">about kf</a></li>
				<li><a href="{$root}">sitemap</a></li>
			</ul>
		</div>


	</div>



<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="{$workspace}/javascript/github-voice/jquery.github-voice.js"></script>
<xsl:text disable-output-escaping="yes"><![CDATA[
<script type="text/javascript">
//<![CDATA[
$(function() {
  $('a#feedback').githubVoice('scottkf', 'keepflippin--on-symphony', {
		limit : 10
	})
});
//]]>]]&gt;
&lt;/script>
</xsl:text>
	</body>
</html>

</xsl:template>

</xsl:stylesheet>