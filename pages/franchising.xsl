<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template name="top">
	<div>
  		<h2>
  			Franchising
  		</h2>
  		<p>
  		  Below you can find further information about how you can become a part of a unique way of promoting gymnastics! 
  	  </p>
  	  <h3>Additional information</h3>
  		<ul>
				<xsl:apply-templates select="/data/navigation/page[@handle = 'franchising']/page"/>
  		</ul>
  	</div>
</xsl:template>

<xsl:template match="data">
	
	<div id="left">
		<ol>
			<li><a href="#history">History</a></li>
			<li><a href="#experience">Experience</a></li>
			<li><a href="#support">Support</a></li>
			<li><a href="#steps">Steps to owning your own Gym</a></li>
			<li><a href="#next">Next</a></li>
		</ol>
	</div>
	<div id="right">


	<p>
		<img src="{$workspace}/images/franchise-picture.jpg" />
	</p>
	<p>A unique franchise opportunity, Keep Flippin's business model is clear, concise and easy to follow.</p>
	<p>We have used our many years of gymnastics and business experience to develop this model. As part of our family, you get the full support and services of the Keep Flippin team, a group that is committed to providing you with hands-on training, consulting, equipment and the resources you will need for your own Keep Flippin gym. </p>

	<a name="history"></a>
	<h3>History</h3>

	<p>Keep Flippin Gymnastics, founded in 1987 by Daryl Sue, has been instructing students in the art of performance gymnastics at many different venues and locations. We were on contract with the Palm Beach County School Board for ten years, and set up at various schools. With a permanent home in Jupiter Fl, Keep Flippin is now looking to establish performance gymnastics gyms nationally and internationally.</p>
	<p>We believe that our program is a unique, one-of-a-kind opportunity that awaits you!</p>


	<a name="experience"></a>
	<h3>No Prior Experience Necessary</h3>

	<p>We have an extensive training program for the gymnastics and business operation of your gym. Our comprehensive program includes:
	</p><ul><li>A two week training program at our Jupiter, FL. location, where you will learn all aspects of the business such as: coaching techniques, scheduling, advertising, marketing the all important performance portion of our program, and much more.</li>
	<li>Two weeks of training at your gym with our experienced team of advisors who will assist in the gym's set up as well as the implementation of all of our programs.</li>
	<li>We also assist you in site selection.</li>
</ul>

<h3>We support you every step of the way.</h3>

<p>Our role doesn't end when you open your doors. </p>
<p>	As a Keep Flippin Franchise, you gain the full resources of a team committed to your gym through continued training, consulting, marketing, equipment, research and technical support.</p>
<p>	Join our family and experience the satisfaction of owning a business that helps to instill confidence and self-esteem in each and every student.</p>

<a name="steps"></a>
<h3>
	Steps to owning your own <b>Keep Flippin'</b></h3>
	<ul class="orange"> 
		<li>Why us?</li>
		<li>Franchise Requirements</li>
		<li>Franchise Support</li>
		<li>Concepts</li>
		<li>Real Estate Criteria</li>
		<li>First Time Franchise</li>
		<li>Discovery Day</li>
		<li>Grand Opening</li>
	</ul>
	<a name="next"></a>
	<h3>What is my next step?</h3>
	<div>
		<a href="{$root}/franchising/contact">Contact us for more information!</a>
	</div>

</div>

</xsl:template>
	
</xsl:stylesheet>