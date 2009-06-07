<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="places">
	<ul>
		<xsl:apply-templates select="entry" mode="short" />
	</ul>
</xsl:template>


<xsl:template match="places/entry" mode="short">
	<li>
	<h3>
		<a href="{$root}/locations/{name/@handle}"><xsl:value-of select="name"/></a>
	</h3>
	<a href="{$root}/schedule/places/{$this-session}/{$this-year}/{$this-month}/{name/@handle}">View classes at this location on the calendar</a><br />
	<xsl:value-of select="city"/>, <xsl:value-of select="state"/> <xsl:value-of select="postal-code"/>
	</li>
</xsl:template>

<xsl:template match="places/entry">
	<div id='left'>
	<h3><xsl:value-of select="name"/></h3>
	<h4>Address:</h4>
	<small><strong>(Click it for a map)</strong></small>
	<p> <a href="{$root}/contact/directions/{name/@handle}"><xsl:value-of select="street-address"/>
	<xsl:if test="suite != ''">
		suite# <xsl:value-of select="suite"/>, 
	</xsl:if><br />
	<xsl:value-of select="city"/>, <xsl:value-of select="state"/>, <xsl:value-of select="postal-code"/>, 
	<xsl:value-of select="country"/><br />
	<xsl:value-of select="phone-number"/>
</a>
</p>
	<h4>Type of Facility</h4>
	<p>
	<xsl:for-each select="type/item">
		<xsl:value-of select="."/>
		<xsl:if test="position() != last()">
		<xsl:text>, </xsl:text> 
		</xsl:if>
	</xsl:for-each>
	</p>
	<h4>Classes</h4>
	<p>
		<a href="{$root}/schedule/places/{$this-session}/{$this-year}/{$this-month}/{name/@handle}">View classes at this location on the calendar</a>
	</p>
	</div>
	<div id='right'>
		<h3>Pictures from the facility</h3>
		<ul>
		<xsl:for-each select="images/item">
			<li>
				<a title="{title}" rel="gallery" href="{$workspace}{../@path}/{filename}"><img src="{$root}/image/1/200/0{../@path}/{filename}" /></a>
			</li>
		</xsl:for-each>
		</ul>
	</div>
</xsl:template>
	
</xsl:stylesheet>