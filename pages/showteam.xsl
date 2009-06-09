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


	<xsl:variable name="showteam">
		<person handle="team">Alicia</person>
		<person handle="team">Brittany</person>
		<person handle="team">Haley</person>
		<person handle="team">Collin</person>
		<person handle="team">Megan</person>
		<person handle="team">Amber</person>
		<person handle="team">Morgane</person>
		<person handle="team">BJ</person>
		<person handle="team">Alexis</person>
		<person handle="team">Julia</person>
		<person handle="preteam">Lexi</person>
		<person handle="preteam">Brooke</person>
		<person handle="preteam">Rachael</person>
		<person handle="preteam">Hannah</person>
		<person handle="preteam">Ryan</person>
	</xsl:variable>
	<!-- <xsl:when test="exsl:node-set($value)/value[@handle = name(current())]"> -->

	<xsl:variable name="team">
		<xsl:for-each select="exsl:node-set($showteam)/person[@handle = 'team']">
			<xsl:sort select="." />
			<xsl:copy-of select="." />
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="preteam">
		<xsl:for-each select="exsl:node-set($showteam)/person[@handle = 'preteam']">
			<xsl:sort select="." />
			<xsl:copy-of select="." />
		</xsl:for-each>
	</xsl:variable>

	<div id="left">
		<img class="toppic" src="http://keepflippin.com/images/67.jpg" />



		<p>
		</p>
	</div>
	<div id="right">
		<h3>Our Showteam</h3>
		<p class="showteam">
		Our Showteam has been featured at <a href="http://disney.com">Disney World</a> and Universal Studios! 
		Locally, they have appeared at <a href="http://www.artigras.org/">Artigras</a>, Jupiter/Tequesta Art Fair, <a href="www.jupiter.fl.us/JUBILEE/">Jupiter Jubilee</a>, Abacoa, <a href="http://www.sunfest.com/">SunFest</a> and numerous fairs. They also returned to "<a href="http://www.gktw.org/">Give Kids the World</a>", a resort for children with terminal illnesses in Kissimmee. Our Showteam's extraordinary talent, dedication and hard work inspires all of our gymnasts!
		</p>
		<h4>Showteam Members</h4>
		<table class="showteam">
		   <tbody>
				<xsl:for-each select="exsl:node-set($team)/person">
					<xsl:if test="position() mod 2 = 1">
						<tr><td><xsl:value-of select="."/></td><td><xsl:value-of select="following-sibling::person[position()]"/></td></tr>
					</xsl:if>
				</xsl:for-each>
			</tbody>
		</table>
		<h4>Preteam members</h4>
		<table class="preteam">
		   <tbody>
				<xsl:for-each select="exsl:node-set($preteam)/person">
					<xsl:if test="position() mod 2 = 1">
						<tr><td><xsl:value-of select="."/></td><td><xsl:value-of select="following-sibling::person[position()]"/></td></tr>
					</xsl:if>
				</xsl:for-each>
			</tbody>
		</table>

	</div>
</xsl:template>

</xsl:stylesheet>