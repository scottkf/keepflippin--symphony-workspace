<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template name="top">
	<div id="summercamp">
		<div id="badge-home"></div>
		<div class="introduction">
			<h2 class="header"><a href="{$root}/about">Summer Camp</a></h2>
			<p>
				Come join us for Summer camp, <strong><em>&#8220;Flippin' around the world in 8 weeks!&#8221;</em></strong> There will be gymnastics, games, field trips, karate, movies, talent shows, ice cream parties and much much more! Camp starts on June 8th and goes through July 31st. <a href="{$root}/schedule/classes/summer-2009/2009/06/summer-camp/keep-flippin-headquarters">A schedule of activities</a> is below. To signup, or for further questions, <a href="{$root}/contact">contact us</a>.
			</p>
		</div>
		<div>
			<a href="http://www.go-van-gogh.com/" alt="learning to paint at go van gogh" title="learning to paint at go van gogh"><img src="{$workspace}/images/summer_camp_banner-2.jpg" /></a>
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
	<h4><strong>Activities include:</strong></h4><ul>
	<li>gymnastics</li>
	<li>games</li>
	<li>field trips [transport is a 50 passenger charter bus with TV, A/C and restrooms]</li>
	<li>karate</li>
	<li>bounce house</li>
	<li>talent show</li>
	<li>ice cream party and much more!</li>
	<li>A complete list for <a href="{$root}/schedule/classes/summer-{$this-year}/{$this-year}/06/summer-camp/keep-flippin-headquarters">June can be found here</a>, and <a href="{$root}/schedule/classes/summer-{$this-year}/{$this-year}/07/summer-camp/keep-flippin-headquarters">July, here.</a></li>
	</ul><p><strong>PLEASE NOTE:</strong> No refunds, credits or changing days is allowed once registered. We are very strict about late pick-ups and will charge accordingly.</p>
	<h3><em>Enough literature! How do I signup?</em></h3>
	<p>
	  By <a href="{$root}/contact">contacting us</a>
    via plane, train or automobile! Though in person or perhaps on the phone is preferable. You can find out how to find us <a href="{$root}/contact">here, on the contact page</a>.
  </p>
	</div>
</xsl:template>

</xsl:stylesheet>