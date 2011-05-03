<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
	extension-element-prefixes="exsl">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>
<xsl:import href="../utilities/get-archive.xsl"/>
<xsl:import href="../utilities/get-comments.xsl"/>

<xsl:template name="top">
	<div>
		<h2>
			Showteam
		</h2>
	</div>
</xsl:template>

<xsl:template match="data">

	<div id="left">
		<img class="toppic" src="{$workspace}/images/showteam-2010-limestone.jpg" />



		<p>
		</p>
	</div>
	<div id="right">
		<h3>Our Showteam</h3>
		<p class="showteam">
		Our performing Showteam has been featured at <a href="http://disney.com">Disney World</a> and <a href="http://www.universalorlando.com">Universal Studios!</a></p><p>
		Locally, they have appeared at <a href="http://www.artigras.org/">Artigras</a>, Jupiter/Tequesta Art Fair, <a href="http://www.jupiter.fl.us/JUBILEE/">Jupiter Jubilee</a>, Abacoa, <a href="http://www.sunfest.com/">SunFest</a> and numerous fairs. They also returned to "<a href="http://www.gktw.org/">Give Kids the World</a>", a resort for children with terminal illnesses in Kissimmee. Our Showteam's extraordinary talent, dedication and hard work inspires all of our gymnasts!
		</p>
		<p class="showteam">
                Interested in joining the Showteam? Performance and tumbling are required! We have a strict list of required tumbling skills, which is available upon request by speaking to Daryl Sue.
		</p>
                <xsl:if test="count(performances/entry) &gt; 0">
                <p>A list of our performances <a href="{$root}#performances">can be found by clicking here</a>.</p>
                <p>Photos and videos of our performances <a href="{$root}/photos">can be found by clicking here</a>.</p>
                </xsl:if>
		<h4>Showteam Members</h4>
		<table class="showteam">
		   <tbody>
				<xsl:for-each select="showteam-members/entry[type/item/@handle = 'team']">
					<xsl:if test="position() mod 2 = 1">
						<tr><td><xsl:value-of select="name"/></td><td><xsl:value-of select="following-sibling::entry[position() and type/item/@handle = 'team']/name"/></td></tr>
					</xsl:if>
				</xsl:for-each>
			</tbody>
		</table>
		<h4>Preteam members</h4>
		<table class="preteam">
		   <tbody>
				<xsl:for-each select="showteam-members/entry[type/item/@handle = 'preteam']">
					<xsl:if test="position() mod 2 = 1">
						<tr><td><xsl:value-of select="name"/></td><td><xsl:value-of select="following-sibling::entry[position() and type/item/@handle = 'preteam']/name"/></td></tr>
					</xsl:if>
				</xsl:for-each>
			</tbody>
		</table>

	</div>
</xsl:template>

</xsl:stylesheet>
