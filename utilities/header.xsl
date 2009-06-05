<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="header">
	<a id="feedback" href="#" />
	<div id="header">
		<xsl:if test="$short = 0">
			<div id="badge"></div>
		</xsl:if>
		<div id="logo">
			<a href="{$root}"><img src="{$workspace}/images/kf-logo.png" alt="keep flippin' logo"/></a>
		</div>
		<div id="menu">
			<ul>
				<li><a href="{$root}/locations?short" rel="locations">Locations</a></li> 
				<li><a href="{$root}">Community</a></li> 
				<xsl:choose>
					<xsl:when test="/data/events/login-info/@logged-in = 'true'">
						<li><a href="{$root}/symphony/logout/">Logout</a></li> 
					</xsl:when>
					<xsl:otherwise>
						<li><a href="{$root}/symphony">Login</a></li> 
					</xsl:otherwise>
				</xsl:choose>
			</ul>
		</div>
		<div id="nav">
			<xsl:apply-templates select="data/navigation"/>
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>