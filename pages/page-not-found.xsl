<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/master.xsl" />

<xsl:template name="top">
	<div>
		<h2>Lost?</h2>
	</div>
</xsl:template>

<xsl:template match="/data">
  <div id="left">
    <p>
  		<img src="{$workspace}/images/icons/icon_error.png" />
  		<xsl:text>&#160;</xsl:text>
  		<strong>404 error! Page not found!</strong>
    </p>
		<p>
		  Well that's not at all useful. So, you're a bit lost... Perhaps you're a bit dizzy after <i>fifteen</i> flips. Maybe you need a <b>spot</b>?
		  Or maybe we flipped ourselves silly and misplaced what you're looking for!
		</p>
    <p>
      Either way, <em>someone's</em> dizzy. So here's a list of some stuff you can do. If you can't decide, just click something!
      <ul>
        <li><a href="{$root}/classes">View a list of our classes,</a></li>
        <li><a href="{$root}/schedule/{$this-session}">Peek at the current schedule,</a></li>
        <li><a href="{$root}/franchising">Learn about opening your own Keep Flippin',</a></li>
        <li><a href="{$root}/photos">Have a look at pictures, press clippings, videos, and other various fun media, </a></li>
        <li><a href="{$root}/contact">If all else fails, contact us!</a></li>      
      </ul>
    </p>
  </div>
  <div id="right">
		<img src="{$workspace}/images/error.jpg" />
  </div>

</xsl:template>


</xsl:stylesheet>