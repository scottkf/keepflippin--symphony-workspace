<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
<xsl:template name="footer">
	<div id="footer">
		<div id="highlighting">
			<!-- <div id="camp">
				<h2><a href="{$root}/summer-camp">Summer Camp - Gymnastics, field trips, games, and more!</a></h2>
				<p>Come join us for Summer camp! There will be gymnastics, games, field trips, karate, movies, talent shows, ice cream parties and much much more! Camp starts on June 8th and goes through July 31st. <a href="{$root}/news/2009/summer-camp">Read More...</a></p>
			</div> -->
			<div id="classes-bottom">
				<h2><a href="{$root}/classes">Our Classes - for any skill level</a></h2>
				<p>Our USA Program is comprised of three different skill levels: <a href="{$root}/classes/red">Red</a> for beginners, <a href="{$root}/classes/white">White</a> for Intermediate gymnasts, and
	               <a href="{$root}/classes/blue">Blue</a> for Advanced gymnasts. </p>
		
				<p>In addition, we also have classes available <a href="{$root}/classes/middle-school">Middle School students</a>, <a href="{$root}/classes/adult-tumbling">High School students and adults</a>, a <a href="{$root}/classes/open-freerunning">drop-in freerunning (parkour) style class, </a>as well as <a
	               href="{$root}/classes/open-gym">Open Gym</a>, where students can focus on what they wish.</p><p>All of these classes are available at our Jupiter, FL location!</p>
			</div>
			<div id="showteam-bottom">
				<h2><a href="{$root}/showteam">Our Showteam - performance gymnasts</a></h2>
				<p>Our performing Showteam has been featured at <a href="http://disney.com">Disney World</a> and <a href="http://www.universalorlando.com">Universal Studios!</a>
</p><p>
Locally, they have appeared at <a href="http://www.artigras.org/">Artigras</a>, Jupiter/Tequesta Art Fair, <a href="http://www.jupiter.fl.us/JUBILEE/">Jupiter Jubilee</a>, Abacoa, <a href="http://www.sunfest.com/">SunFest</a> and numerous fairs. They also returned to "<a href="http://www.gktw.org/">Give Kids the World</a>", a resort for children with terminal illnesses in Kissimmee. Our Showteam's extraordinary talent, dedication and hard work inspires all of our gymnasts!
</p>
		
			</div>
		</div>
		<div id="news">
			<h2><a href="{$root}/news">Latest News - learn about new happenings at keep flippin'</a></h2>
	        	<xsl:apply-templates select="/data/frontpage-news-items/entry" />
			<h5><a href="{$root}/news">Please continue on and read more...</a></h5>
			<h2><a class="social" href="#">On the web - you can also find us on the following</a></h2>
  		<ul>
        <li class="twitter"><a href="http://twitter.com/keepflippin"><img src="{$workspace}/images/icons/twitterbird.png" alt="follow us on twitter" title="follow us on twitter" /></a></li>
  			<li><a href="http://www.facebook.com/pages/Jupiter-FL/Keep-Flippin/208723055787?ref=nf"><img src="{$workspace}/images/icons/facebook.png" alt="view us on facebook" title="view us on facebook" /></a></li>
  		</ul>
		</div>

		<hr />
		
		<div id="bottom_nav">
			<ul>
				<li><a href="{$root}">home</a></li>
				<li><a href="{$root}/classes">classes</a></li>
				<li><a href="{$root}/schedule">schedule</a></li>
				<li><a href="{$root}/franchising">franchising</a></li>
				<li><a href="{$root}/halloween-carnival">halloween carnival</a></li>
				<li><a href="{$root}/photos">media</a></li>
				<li><a href="{$root}/showteam">showteam</a></li>
				<li><a href="{$root}/about">about kf</a></li>
        <li><a href="{$root}/contact/Problem%20with%20the%20website">problems?</a></li>
        <li><a href="http://tesoriere.com">made@tesoriere</a></li>
			</ul>
      <small>Copyright &#169; 2009 Keep Flippin' Gymnastics Franchising, Inc. All trademarks and registered trademarks appearing on keepflippin.com are the property of their respective owners.</small>
		</div>


	</div>

</xsl:template>

</xsl:stylesheet>