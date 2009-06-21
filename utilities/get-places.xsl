<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="places">
	<ol>
		<xsl:apply-templates select="entry" mode="short" />
	</ol>
</xsl:template>


<xsl:template match="places/entry" mode="short">
	<li>
	<h3>
		<a href="{$root}/locations/{name/@handle}"><xsl:value-of select="name"/></a>
	</h3>
	<p>
	  <xsl:value-of select="short-description"/>
  </p>
  <h5>
	<xsl:value-of select="street-address"/>
	<xsl:if test="suite != ''">
		suite# <xsl:value-of select="suite"/>, 
	</xsl:if><br />
	<xsl:value-of select="city"/>, <xsl:value-of select="state"/> <xsl:value-of select="postal-code"/>
	<xsl:text>, </xsl:text>
	<xsl:value-of select="country"/>
  <br />
	<xsl:value-of select="phone-number"/><br />
  </h5>
  <ul>
  	<li><a href="{$root}/locations/{name/@handle}">View contact information &amp; pictures</a></li>
  	<li><a href="{$root}/schedule/{$this-session}/{name/@handle}/{$this-year}/{$this-month}">View classes on the calendar</a></li>
  </ul>
	</li>
</xsl:template>

<xsl:template match="places/entry">
	<div id='left'>
	<h3><xsl:value-of select="name"/></h3>
	<h4>Address</h4>
	<small><strong>(Click it for a map)</strong></small>
	<p> 
		<a>
			<xsl:attribute name="href">
				<xsl:choose>
					<xsl:when test="$mobile = 'true'">
						<xsl:value-of  select="'http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=6761+W+Indiantown+Rd,+Jupiter,+FL+33458+(Keep+Flippin+Gymnastics)&amp;sll=37.649034,-95.712891&amp;sspn=40.268799,88.066406&amp;ie=UTF8&amp;ll=26.934677,-80.13756&amp;spn=0.011172,0.021501&amp;z=16&amp;iwloc=A'"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$root"/>
						<xsl:value-of select="'/contact/directions/'"/>
						<xsl:value-of select="name/@handle"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:value-of select="street-address"/>
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
		<a href="{$root}/schedule/{$this-session}/{name/@handle}/{$this-year}/{$this-month}">View classes at this location on the calendar</a><br />
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