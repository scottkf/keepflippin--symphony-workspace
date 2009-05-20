<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-performances.xsl"/>
<xsl:import href="../utilities/get-comments.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>

<xsl:template match="data">
			<xsl:apply-templates select="frontpage-articles/entry[position() &gt;= 2 and position() &lt;= 3]"	mode="left" />  
			<div id="right">
				<div class="introduction">
					<h2><a href="{$root}">Welcome to the new keepflippin.com</a></h2>
					<p>
						Our gymnastics program is truly unique, it is performance based, rather than competitive. Each student is guided lovingly towards their goal - and beyond. <a href="{$root}/about">Learn more about Keep Flippin’...</a>
					</p>
				</div>
  <xsl:apply-templates select="frontpage-articles/entry[1]	"/>
  <hr/>
  <xsl:apply-templates select="performances"/>

			</div>
</xsl:template>

</xsl:stylesheet>