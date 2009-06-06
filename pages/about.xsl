<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-performances.xsl"/>
<xsl:import href="../utilities/get-comments.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>

<xsl:template name="top">
	<div>
		<h2>About us!</h2>
	</div>
</xsl:template>

<xsl:template match="data">
	<img class="toppic" src="{$workspace}/images/starroom.jpg" />
	<p>
		<img style="float: right; padding-right: 5px;" src="{$workspace}/images/handstandman.gif" /> 
		<b>Keep Flippin's</b> <span class="gym">gymnastics</span> facility is truly unique. Our one of a kind program is <u>performance based</u>, rather than being competition-based. We embrace our mission to teach <span class="gym">gymnastics</span> and give our gymnasts the full range of the gymnastic experience. Each student is lovingly guided towards reaching their potential - <i>and beyond</i>. Our program teaches all aspects of <span class="gym">gymnastics</span> and apparatus.  We embrace our gymnasts at any age or skill level and will teach them everything they wish to learn.
	</p>

	<p>
		We have an outstanding record of achievement here at Keep Flippin' one that we take pride in. Our fantastic gymnastic show team is truly remarkable, performing all year throughout Florida  and amazing crowds wherever they go. However, no one is left out in our program. All of our gymnasts are given the spot light.  At the end of every year all of our gymnasts perform on a <b>huge stage</b> in April to show off what they have learned to all of our proud parents and the community we have forged.
	</p>


	<p>
		Along with <span class="gym">gymnastics</span> our proud gymnasts learn <span class="bold">confidence</span>, develop <span class="bold">self-esteem</span> <i>and</i> stage presence. They glow with pride and accomplishment.  That is the essence of...
	</p>

		<p>
			Please email <a href="mailto:darylsue@keepflippin.com">Daryl Sue</a> with questions or please <a href="http://keepflippin.com/contact">contact us</a> for further information. 
		</p>

		<a name="dar"></a>
		<h2>Daryl Sue, Director</h2>
		<p>
			<a href="mailto:darylsue@keepflippin.com">Daryl Sue</a>, USGF, AGSAA, is a former Pan Am Competitor, with a dance and theatre background. She is a founder of the "Rebounders" gymnastic exhibition team that performed throughout the Northeast and was invited to perform at the New York World's Fair.
		</p>
		<p>
			Daryl Sue has also been an aerobics instructor for 18 years with a background in Physical Education and Special Education . She studied sports medicine and kinesiology and applies the methods to all her exercise and gymnastic work. As the southeast representative for SPRI Inc., she traveled extensively to promote the use of aerobic tubes and bands for different health clubs and studios, as well as a "SPRIercise" Fit Program for school children.
		</p><p>
		She is AFAA certified and is a well-known personal trainer throughout Palm Beach County. She will continue to travel to promote the new "Keep Flippin" franchises.

	</p>

	<p>
		Keep Flippin is located on <b>West Indiantown Rd.</b> in the Winn Dixie shopping plaza, next to Medallion clothing, near Atlantic Arts dance studio.

	</p>



</xsl:template>

</xsl:stylesheet>
