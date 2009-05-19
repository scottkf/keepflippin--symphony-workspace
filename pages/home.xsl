<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>
<xsl:import href="../utilities/get-notes.xsl"/>
<xsl:import href="../utilities/get-comments.xsl"/>

<xsl:template match="data">
			<div class="article">
				<h3><a href="{$root}"><div><img src="{$workspace}/images/article_image.jpg" alt="summer camp logo" /></div>Summer Camp</a></h3>
				<p>Come join us for Summer camp! There will be gymnastics, games, field trips, karate, movies, talent shows, ice cream parties and much much more! Camp starts on June 8th and goes through July 31st.</p>
			</div>
			<div class="article">
				<h3><a href="{$root}"><div><img src="{$workspace}/images/article_image.jpg" alt="End of the year show logo" /></div>End of the year show</a></h3>
				<p>As you all know we are a performance based gym. This means our students will be performing at the end of the year show in April at the Eissey Campus Theatre in Palm Beach Gardens where all the students participate and receive a Trophy.</p>
			</div>
			<div id="right">
				<div class="introduction">
					<h2><a href="{$root}">Welcome to the new keepflippin.com</a></h2>
					<p>
						Our gymnastics program is truly unique, it is performance based, rather than competitive. Each student is guided lovingly towards their goal - and beyond. <a href="/">Learn more about Keep Flippin’...</a>
					</p>

				</div>
  <xsl:apply-templates select="homepage-article"/>
  <hr/>
  <xsl:apply-templates select="notes"/>

			</div>
</xsl:template>

</xsl:stylesheet>