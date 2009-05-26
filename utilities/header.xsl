<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="header">
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
				<li><a href="{$root}/locations?short" rel="facebox">Locations</a></li> 
				<li><a href="{$root}">Community</a></li> 
			</ul>
		</div>
		<div id="nav">
			<xsl:apply-templates select="data/navigation"/>
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>