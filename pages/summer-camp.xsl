<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template name="top">
	<div id="summercamp">
		<div id="badge-home"></div>
		<div class="introduction">
			<h2 class="header"><a href="{$root}/about">Summer Camp 2010</a></h2>
			<p>
				Come join us for Summer camp, <!--<strong><em>&#8220;Flippin' around the world in 8 weeks!&#8221;</em></strong>--> There will be gymnastics, games, field trips, karate, movies, talent shows, ice cream parties and much much more! Camp starts on June 7th and goes through July 30th. A schedule of activities is below. To signup, or for further questions, <a href="{$root}/contact">contact us</a>.
			</p>
		</div>
		<div>
			<a href="#" alt="learning to paint at go van gogh" title="learning to paint at go van gogh"><img src="{$workspace}/images/summer_camp_banner-2.jpg" /></a>
		</div>
	</div>
</xsl:template>

<xsl:template match="data">
	<div id="left">
	<h4><strong>Camp times:</strong></h4><ul>
	<li>Half days - 9:00am - 12:30pm</li>
	<li>Full days - 9:00am - 5:30pm</li>
	</ul><h4><strong>Ages:</strong></h4><ul>
	<li>Half day - Tumble Tots and up</li>
	<li>Full day - 5 yr. old and up</li>
	</ul><h4><strong>Prices:</strong></h4>
	<p>Prices are per child per week, no mixing and matching of days of different weeks is permitted.</p>
	<table class="camp">
	<tbody><tr><th>Half days</th><th></th><th>Full Days</th><th></th></tr>
	<tr><td>one half day</td><td>$40</td><td>one full day</td><td>$55</td></tr>
	<tr><td>two</td><td>$65</td><td>two</td><td>$105</td></tr>
	<tr><td>three</td><td>$90</td><td>three</td><td>$145</td></tr>
	<tr><td>four</td><td>$110</td><td>four</td><td>$185</td></tr>
	<tr><td>five</td><td>$115</td><td>five</td><td>$205</td></tr>
	</tbody></table>
	</div>
	<div id="right">
	<h4><strong>Activities include:</strong></h4><a href="{$workspace}/files/Summer-Calender-2010.pdf"><div style="float: right; width: 150px;"><img src="{$workspace}/images/summer-camp-thumbnail.PNG" style=" height: auto; width: 150px" /><br /><strong>Summer Camp Schedule (PDF)</strong></div></a><ul>
	<li><strong>Gymnastics</strong></li>
	<li>Games</li>
	<li>Field trips [transport is a 50 passenger charter bus with TV, A/C and restrooms]</li>
	<li>Karate by Purple Dragon Dojo</li>
	<li>Bounce house</li>
	<li>Talent show</li>
	<li><a href="http://www.go-van-gogh.com/">Go Van Gogh</a></li>
	<li><a href="http://bounceu.com/">Bounce U</a></li>
	<li>Ice cream party and much more!</li>
	<li>A complete list <a href="{$workspace}/files/Summer-Calender-2010.pdf">can be found here</a>. This is a <a href="http://get.adobe.com/reader/">PDF file</a>, for which you need <a href="http://get.adobe.com/reader/">Adobe Acrobat</a>, and you can get that <a href="http://get.adobe.com/reader/">here!</a></li>
	</ul><p><strong>PLEASE NOTE:</strong> No refunds, credits or changing days is allowed once registered. We are very strict about late pick-ups and will charge accordingly.</p>
	<h3><em>Enough literature! How do I signup?</em></h3>
	<p>
	  By <a href="{$root}/contact">contacting us</a>
    via plane, train or automobile! Though in person or perhaps on the phone is preferable. You can find out how to find us <a href="{$root}/contact">here, on the contact page</a>.
  </p>
	</div>
</xsl:template>

</xsl:stylesheet>