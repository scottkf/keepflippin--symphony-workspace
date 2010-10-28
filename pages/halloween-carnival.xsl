<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template name="top">
	<div id="birthdays">
		<div id="badge-home"></div>
		<div class="introduction">
			<h2 class="header"><a href="{$root}/about">Halloween Carnival</a></h2>
			<p>
				Keep Flippin' Gymnastics presents our 8th annual Halloween Carnival. There will be games, a bounce house, food, <strong>fantastic prizes</strong>, raffles and a costume contest for children, parents and coaches!<br /><br />It will be held on <strong>Saturday, October 23th 2010</strong> from 5:00 to 8:00 P.M.
			</p>
		</div>
 <div>
<a href="#" alt="halloween carnival 2009" title="halloween carnival 2009"><img src="{$workspace}/gallery-images/halloween-2009.JPG" /></a>
</div>
	</div>
</xsl:template>

<xsl:template match="data">
	<div id="left">
	<h4><strong>Tickets go on sale Monday September 27th:</strong></h4><ul>
	<li><em>$12.00</em> in advance, before <strong>10/23/10</strong></li>
	<li><em>$15.00</em> the day of the carnival</li></ul>
        <p><strong>Only 200 Tickets will be sold!</strong></p>
        <h4><strong>On October 23th, there will be:</strong></h4><ul>
	<li>Games</li>
	<li>A Bounce House</li>
	<li>Food</li>
	<li>Fantastic Prizes!</li>
	<li>Raffles</li>
	<li>A costume contest for children, coaches <em>and</em> parents</li>
        <li><em>"Thriller"</em>, An amazing performance by our <a href="{$root}/showteam">gymnastic showteam</a></li>
	</ul>
	</div>
	<div id="right">
	<h4><strong>Itinerary:</strong></h4><ul style="list-style-type: none">
	<li><b>5:00</b> - Doors open</li>
	<li><b>5:30</b> - Feast to your heart's content</li>
	<li><b>5:45</b> - Costume contest for children, parents and coaches</li>
	<li><b>6:30</b> - <em><strong>THRILLER!</strong></em></li>
	<li><b>6:45</b> - Coloring contest winners announced</li>
	<li><b>7:30</b> - <em><strong>THRILLER AGAIN!</strong></em></li>
	<li><b>8:00</b> - Doors close</li>
	</ul>
        <h4><strong>Where is it at?</strong></h4>
        <p>At Keep Flippin'! Please visit <strong><a href="{$root}/contact/directions/keep-flippin-headquarters">this page for directions.</a></strong></p>
	</div>
</xsl:template>

</xsl:stylesheet>