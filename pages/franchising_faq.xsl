<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template name="top">
	<div>
		<h2><a href="{$root}/franchising">Franchising</a></h2>
			<ul class="nav">
				<xsl:apply-templates select="/data/navigation/page[@handle = 'franchising']/page"/>
			</ul>
	</div>
</xsl:template>

<xsl:template match="data">


<p>
	<img src="{$workspace}/images/franchise-picture.jpg" />
</p>
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

	<h3>Why us?</h3>
	<p>
		An amazing franchise opportunity awaits you! Our one of a kind performance gymnastics company offers a unique experience for our students combining gymnastic and motor skill development in a caring and encouraging atmosphere. Since we are exclusively, <span class="title_nb">"performance gymnastics"</span>, all students are invited to perform in a professional venue to show off their learned skills, talent and newfound confidence. 
	</p>


	<h3>What type of franchise is available?</h3>
	<p>
		KEEP FLIPPIN' GYMNASTICS offers you the opportunity to operate a business that provides gymnastics classes for children and young adults of all ages in a non-competitive, friendly, and supportive environment.
	</p>


	<h3>Will I receive help on the purchase of inventory and supplies?</h3>
	<p>
		Absolutely! We will fit your needs to your own gym and provide:
		<ul class="orange">
			<li><b>Our gym layout.</b></li>
			<li><b>A scheduling system.</b></li>
			<li><b>Initial on-site training, and continuing training to help your business evolve.</b></li>
			<li><b>Training videos to further increase your familiarity with our process.</b></li>
			<li><b>Most importantly, all information related to how to best approach the performance aspect of our business.</b></li>
		</ul>
	</p>

	<h3>Must I buy my equipment and supplies from you?</h3>
	<p>
		Yes - we are proud to host our own high quality line of Keep Flippin' equipment and support
	</p>

	<h3>Does Keep Flippin' offer a finance program?</h3>
	<p>
		We currently do not offer a finance program
	</p>


	<h3>Will I have an exclusive territory?</h3>
	<p>
		KEEP FLIPPIN' GYMNASTICS does not grant you an exclusive or protected territory. We do provide you with an Area of Primary Responsibility with an approximate population of 50,000 persons. We will not establish other franchises or company-owned businesses in your area. You must restrict your marketing and direct solicitations for customers to your Area of Primary Responsibility.
	</p>


	<h3>What is the term of the KEEP FLIPPIN' GYMNASTICS Franchise Agreement?</h3>
	<p>
		The initial term of the Franchise Agreement is five years from the date the Franchise Agreement is signed. The franchise is renewable for three additional terms of five years each, providing you have complied with the provisions of the Franchise Agreement.</p>


		<h3>How much does it cost to develop a Keep Flippin' Franchise?</h3>
		<p><img src="http://keepflippin.com/images/102.jpg" height="544" width="550" /></p>


		<h3>How much is the fee for continuing support services?</h3>
		<p>
			The continuing supports services, or "royalty fee", is 6% of your gross sales and is paid weekly. This fee entitles you to use the KEEP FLIPPIN' GYMNASTICS service mark, use of distinctive system, marketing assistance, ongoing business development and counseling, and other benefits that come with being a KEEP FLIPPIN' GYMNASTICS franchise.
		</p>


		<h3>What about advertising?</h3>
		<p>
			The KEEP FLIPPIN' GYMNASTICS  name and reputation is an important part of our business. You will spend a minimum of $6,000 grand-opening advertising during the first three months of operations. You will also spend at least 4% of your gross sales per month on local advertising for the first year. In addition, if we should establish fees for a Marketing Fund, you will be expected to make Marketing Fund contributions of up to 2% of your weekly gross sales.
		</p>






		<h3>What is my next step?</h3>
		<p>
				<a href="{$root}/franchising/contact">Contact us</a>
		</p>

</xsl:template>
	
</xsl:stylesheet>