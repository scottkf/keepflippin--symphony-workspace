<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-performances.xsl"/>
<xsl:import href="../utilities/get-comments.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>

<xsl:template name="top">
	<div>
		<div id="badge-home"></div>
		<div class="introduction">
			<h2 class="header"><a href="{$root}/about">An Exciting Way of Doing Gymnastics.</a></h2>
			<p>
				Our gymnastics program is truly unique, it is performance based, rather than competitive. Each student is guided lovingly towards their goal - and beyond. <a href="{$root}/about">Learn more about Keep Flippin’...</a>
			</p>
		</div>
		<div>
			<a href="{$root}/showteam" title="about the showteam"><img src="{$workspace}/images/home-right.jpg" alt="showteam group picture" /></a>
		</div>
	</div>
</xsl:template>

<xsl:template match="data">
	<div id="left">
		<xsl:apply-templates select="frontpage-articles/entry[important = 'Yes' and position() &gt;= 2 and position() &lt;= 3]"	mode="left" />
	</div>
	<div id="right">
	  <xsl:apply-templates select="frontpage-articles/entry[important = 'Yes' and position() = 1]	"/>
		<ul class="quicklinks">
      <li class="twitter"><a href="http://twitter.com/keepflippin"><img src="{$workspace}/images/icons/twitterbird.jpg" alt="follow us on twitter" title="follow us on twitter" /></a></li>
			<li><a href="http://www.facebook.com/pages/Jupiter-FL/Keep-Flippin/208723055787?ref=nf"><img src="{$workspace}/images/icons/facebook_32.png" alt="view us on facebook" title="view us on facebook" /></a></li>
			<li><a href="{$root}/rss"><img src="{$workspace}/images/icons/rss-32x32.png" alt="rss" title="rss" /></a></li>
		</ul>
	  <xsl:apply-templates select="performances"/>
		<h4><a href="{$root}/news">Continue reading for the latest news...</a></h4>
	</div>
</xsl:template>

</xsl:stylesheet>