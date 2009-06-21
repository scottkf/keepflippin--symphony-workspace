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
		<xsl:apply-templates select="frontpage-articles/entry[important = 'Yes' and @article-images &gt; 0]"	mode="left" />
	</div>
	<div id="right">
	  <xsl:apply-templates select="frontpage-articles/entry[important = 'Yes' and @article-images = 0]	"/>
	  <xsl:apply-templates select="performances"/>
		<h4><a href="{$root}/news">Continue reading for the latest news...</a></h4>
	</div>
</xsl:template>

</xsl:stylesheet>