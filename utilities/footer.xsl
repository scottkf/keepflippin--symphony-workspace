<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
<xsl:template name="footer">
	<div id="footer">
		<div id="left">
			<div id="camp">
				<h2><a href="{$root}/summer-camp">Summer Camp - Gymnastics, field trips, games, and more!</a></h2>
				<p>Come join us for Summer camp! There will be gymnastics, games, field trips, karate, movies, talent shows, ice cream parties and much much more! Camp starts on June 8th and goes through July 31st. <a href="{$root}/news/2009/summer-camp">Read More...</a></p>
			</div>
			<div id="classes-bottom">
				<h2><a href="{$root}/classes">Our Classes - for any skill level</a></h2>
				<p>Our USA Program is comprised of three different skill levels: <a href="{$root}/classes/red">Red</a> for beginners, <a href="{$root}/classes/white">White</a> for Intermediate gymnasts, and
	               <a href="{$root}/classes/blue">Blue</a> for Advanced gymnasts.</p>
		
				<p>In addition, we also have classes available <a href="{$root}/classes/middle-school">Middle School</a> and High School students, as well as <a
	               href="{$root}/classes/open-gym">Open Gym</a>, where students can focus on what they wish.</p>
			</div>
		</div>
		<div id="news">
			<h2><a href="{$root}/news">Latest News - learn about new happenings at keep flippin'</a></h2>
         <xsl:apply-templates select="/data/frontpage-news-items/entry" />
			<h3><a href="{$root}/news">Looking for further information? Please continue on and read more...</a></h3>
		</div>

		<hr />
		
		<div id="bottom_nav">
			<ul>
				<li><a href="{$root}">home</a></li>
				<li><a href="{$root}/classes">classes</a></li>
				<li><a href="{$root}/schedule">schedule</a></li>
				<li><a href="{$root}/franchising">franchising</a></li>
				<li><a href="{$root}/summer-camp">summer camp</a></li>
				<li><a href="{$root}/photos">pictures</a></li>
				<li><a href="{$root}/showteam">showteam</a></li>
				<li><a href="{$root}/about">about kf</a></li>
				<li><a href="{$root}">sitemap</a></li>
			</ul>
		</div>


	</div>



	<xsl:text disable-output-escaping="yes"><![CDATA[
	<script type="text/javascript">
	$(function() {
	  $('a#feedback').githubVoice('scottkf', 'keepflippin--on-symphony', {
			limit : 10
		})
	});
	</script>
	]]></xsl:text>
</xsl:template>

</xsl:stylesheet>