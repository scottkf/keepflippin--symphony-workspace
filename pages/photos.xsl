<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-gallery.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:template name="top">
	<div>
		<xsl:choose>
			<xsl:when test="$gallery != ''">
				<h2>Photos</h2>
                                <a href="{$root}/photos">Back to the gallery list</a>
				</xsl:when>
				<xsl:otherwise>
				<h2 class="header"><a href="{$root}/about">Media</a></h2>
				</xsl:otherwise>
			</xsl:choose>
	</div>
</xsl:template>

<xsl:template match="data">
	<style type="text/css">
		.ui-tabs .ui-tabs-nav { margin: 0em; padding: 0; }
		.ui-tabs .ui-tabs-nav li { list-style: none; float: left; position: relative; margin: 0 0em 1px 0; border-bottom: 0 !important; padding: 0; white-space: nowrap; }
		.ui-tabs .ui-tabs-nav li a { float: left; padding: 0em 2em 0.2em 2em; text-decoration: none;}
		.ui-tabs .ui-tabs-nav li.ui-tabs-selected { margin-bottom: 0; padding-bottom: 1px; font-weight: bold; background: #EAF0F6;}
		.ui-tabs .ui-tabs-nav li.ui-tabs-selected a, .ui-tabs .ui-tabs-nav li.ui-state-disabled a, .ui-tabs .ui-tabs-nav li.ui-state-processing a { cursor: text; font-weight: bold;}
		.ui-tabs .ui-tabs-nav li a, .ui-tabs.ui-tabs-collapsible .ui-tabs-nav li.ui-tabs-selected a { cursor: pointer; } 
		.ui-tabs .ui-tabs-panel { display: block; border-width: 0;  background: #EAF0F6; }
		.ui-tabs .ui-tabs-hide { display: none !important; }
		.ui-tabs #fragment-1, .ui-tabs #fragment-2 { clear: both; padding: 7px; color: #333; }
		#photos #middle #content #left .ui-tabs #fragment-1 h5, #photos #middle #content #left .ui-tabs #fragment-2 h5 { margin-bottom: 1em; margin-top: 1.5em; color: #333; }
	</style>
	<xsl:choose>
		<xsl:when test="$gallery != ''">
			<xsl:call-template name="gallery" />
		</xsl:when>
		<xsl:otherwise>
		<div id="left">
		<div id="tabs">
			<ul>
				<li><h2><a href="#fragment-1">Photos</a></h2></li>
				<li><h2><a href="#fragment-2">Videos</a></h2></li>
			</ul>
			<div id="fragment-1">
			<h5>Click on a gallery to view it's contents!</h5>
			<xsl:call-template name="gallery-list"/>
			</div>
			<div id="fragment-2">
				<h5>Clicking on a video will take you to the video! (externally)</h5>
				<xsl:call-template name="video-list"/>
			</div>
		</div>
		</div>
		<div id="right">
			<h4>On the web</h4>
        <ul class="quicklinks">
          <li class="twitter"><a href="http://twitter.com/keepflippin"><img src="{$workspace}/images/icons/twitterbird.jpg" alt="follow us on twitter" title="follow us on twitter" /></a></li>
    			<li><a href="http://www.facebook.com/pages/Jupiter-FL/Keep-Flippin/208723055787?ref=nf"><img src="{$workspace}/images/icons/facebook_32.png" alt="view us on facebook" title="view us on facebook" /></a></li>
    			<li><a href="{$root}/rss"><img src="{$workspace}/images/icons/rss-32x32.png" alt="rss" title="rss" /></a></li>
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
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>




</xsl:stylesheet>