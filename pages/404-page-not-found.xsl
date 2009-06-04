<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/master.xsl" />

<xsl:template name="top">
	<div>
		<h3>error!</h3>
	</div>
</xsl:template>

<xsl:template match="/data">

			<img class="floatr" src="http://keepflippin.com/images/site/error.jpg" />
			<img src="http://keepflippin.com/images/site/icons/icon_error.png" /> 
			<b>404 error! Page not found!</b>

			<p>Well that's not at all useful. So, you're a bit lost... Perhaps you're a bit dizzy after <i>fifteen</i> flips. Maybe you need a <b>spot</b>?</p>

			<p>Or maybe we flipped ourselves silly and misplaced what you're looking for!</p>
      <p>Head back to <a href="{$root}/">home</a> or <a href="{$root}/about/">contact</a> me.</p>

</xsl:template>

</xsl:stylesheet>