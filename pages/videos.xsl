<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-gallery.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:template name="top">
	<div>
		<h2>Videos</h2>
	</div>
</xsl:template>

<xsl:template match="data">
		<div id="left">
			<h4>Photos</h4>
			<h5>click on a gallery to view it's contents!</h5>
			<xsl:call-template name="gallery-list"/>
		</div>
		<div id="right">
			<h4>On the web</h4>
        <ul class="quicklinks">
          <li class="twitter"><a href="http://twitter.com/keepflippin"><img src="{$workspace}/images/icons/twitterbird.jpg" alt="follow us on twitter" title="follow us on twitter" /></a></li>
    			<li><a href="http://www.facebook.com/pages/Jupiter-FL/Keep-Flippin/208723055787?ref=nf"><img src="{$workspace}/images/icons/facebook_32.png" alt="view us on facebook" title="view us on facebook" /></a></li>
    			<li><a href="{$root}/rss"><img src="{$workspace}/images/icons/rss-32x32.png" alt="rss" title="rss" /></a></li>
        </ul>
      <h4>Videos</h4>
      <ul style="list-style-type: none; margin-left: 0em; padding-left: 0em">
        <xsl:apply-templates select="videos/entry" />
      </ul>

      <h4>Programs&#160;<img src="{$workspace}/images/icons/icon_a_acrobat.png" alt="acrobat" /></h4>
      <h5>from the end of the year show, <a href="http://get.adobe.com/reader/">in pdf format</a>.</h5>
      <ul class="programs">
        <xsl:for-each select="programs/entry">
          <li>
            <a href="{$workspace}{file/@path}/{file/filename}">
              <img src="{$root}/image/1/120/160{thumbnail/@path}/{thumbnail/filename}" alt="program thumbnail" />
              <h5><xsl:value-of select="title"/>&#160;<small>[<xsl:value-of select="file/@size"/>]</small></h5>
              </a>
          </li>
        </xsl:for-each>
      </ul>
    </div>
</xsl:template>




</xsl:stylesheet>