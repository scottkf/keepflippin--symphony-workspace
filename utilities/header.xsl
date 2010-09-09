<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="header">
	<div id="header">
		<xsl:if test="$short = 0">
			<a href="{$root}/about" id="badge" title="about us"></a>
		</xsl:if>
		<div id="logo">
			<a href="{$root}"><img src="{$workspace}/images/kf-logo.png" alt="keep flippin' of jupiter logo"/></a>
		</div>
		<div id="menu">
			<ul>
				<!-- <li><a href="{$root}/locations">Locations</a></li> -->
				<li><a href="{$root}/news">News</a></li>
				<li><a href="{$root}/halloween-carnival">Halloween Carnival</a></li>
                                <li><a href="{$root}/showteam">Showteam</a></li>
				<li><a href="{$root}/about">About</a></li>
        <!-- <xsl:choose>
          <xsl:when test="/data/events/login-info/@logged-in = 'true'">
            <li><a href="{$root}/symphony/logout/">Logout</a></li> 
          </xsl:when>
          <xsl:otherwise>
            <li><a href="{$root}/symphony">Login</a></li> 
          </xsl:otherwise>
        </xsl:choose> -->
			</ul>
		</div>
		<div id="nav">
			<xsl:apply-templates select="data/navigation"/>
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>