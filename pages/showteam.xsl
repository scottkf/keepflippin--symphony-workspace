<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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




	<img class="toppic" src="http://keepflippin.com/images/67.jpg" />

	<p class="showteam">
	Our Showteam has been featured at Disney World and Universal Studios! 
	Locally, they have appeared at Artigras, Jupiter/Tequesta Art Fair, Jupiter Jubilee, Abacoa, SunFest and numerous fairs. They also returned to "<a href="http://www.gktw.org/">Give Kids the World</a>", a resort for children with terminal illnesses in Kissimmee. Our Showteam's extraordinary talent, dedication and hard work inspires all of our gymnasts!
	</p>

	<p>
	</p>
	<div id="left">
	<h3>Showteam Members</h3>
	<table class="showteam">
	   <tbody><tr><td>Alicia</td><td class="right">Amber</td></tr>
	  <tr><td>BJ</td><td class="right">Brittany</td></tr>
	  <tr><td>Collin</td><td class="right">Haley</td></tr>
	  <tr><td>Kacie</td><td class="right">Lyara</td></tr>
	  <tr><td>Megan</td><td class="right">Morgane</td></tr>
	  <tr><td class="bottom">Savannah</td><td class="bottom" style="border-right: 0pt none;"></td></tr>

	</tbody></table>

	</div>
	<div id="right">
	<h3>Preteam members</h3>
	<table class="showteam">
	  <tbody><tr><td>Alexis</td><td class="right">Julia</td></tr>
	  <tr><td class="bottom">Ryan</td><td class="bottom" style="border-right: 0pt none;"></td></tr>

	</tbody></table>

	</div>
</xsl:template>

</xsl:stylesheet>