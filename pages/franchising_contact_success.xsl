<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:exsl="http://exslt.org/common"
    xmlns:form="http://nick-dunn.co.uk/xslt/form-controls"
    extension-element-prefixes="exsl form">

<xsl:import href="../utilities/master.xsl" />
<xsl:import href="../utilities/form.xsl" />

<xsl:template name="top">
	<div>
		<h2><a href="{$root}/franchising">Franchising</a></h2>
			<ul class="nav">
				<xsl:apply-templates select="/data/navigation/page[@handle = 'franchising']/page"/>
			</ul>
	</div>
</xsl:template>


<xsl:template match="data">
	<h4>Successfully submitted!</h4>
	<p>
		 You'll hear from us within a couple of days! In the meantime, you can learn about <a href="{$root}/showteam">our showteam</a>, <a href="{$root}/photos">see some pictures from various events we've done</a>, or <a href="{$root}/contact#phone">contact us by phone if you have any further questions</a>.
	</p>
</xsl:template>

</xsl:stylesheet>