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

<xsl:variable name="event" select="/data/events/save-prospect" />

<xsl:template match="data">
	<p>To find out more about more about Keep Flippin' - or to get the franchise process moving - please fill out the application below to tell us about yourself.</p>
	<h3>Information</h3>
	<h5>Required fields are indicated by an asterisk (*) and are in bold.</h5>
	<xsl:apply-templates select="section-schema[@handle='prospects']">
		<xsl:with-param name="event" select="/data/events/save-prospect" />
		<xsl:with-param name="post">
			<xsl:text>save-prospect</xsl:text>			
		</xsl:with-param>
		<xsl:with-param name="submit">
			<xsl:text>Submit Information</xsl:text>
		</xsl:with-param>
		<xsl:with-param name="required">
			<xsl:text> *</xsl:text>
		</xsl:with-param>
    <xsl:with-param name="errors">
				<error handle="first-name">Please enter your First Name.</error>
				<error handle="last-name">Please enter your Last Name.</error>
				<error handle="street-address">Please enter your Physical Street Address.</error>
				<error handle="city">Please enter your city.</error>
				<error handle="state-province">Please enter your Full State or Province.</error>
				<error handle="postal-code">Please enter your Postal Code.</error>
				<error handle="country">Please enter your Country.</error>
				<error handle="phone" type="missing">Please enter your Phone Number.</error>
				<error handle="phone" type="invalid">Please enter a valid Phone Number: (555)-555-5555</error>
				<error handle="best-time-to-contact">Please enter the time at which we can contact you.</error>
				<error handle="liquid-capital">Please enter the amount of liquid capital you possess.</error>
				<error handle="time-frame">Please enter the time frame in which you would like to open the business.</error>
        <error handle="email-address" type="missing">Please enter your e-mail address.</error>
        <error handle="email-address" type="invalid">Please enter a valid e-mail address.</error>
				<error handle="place-where-you-prefer-to-open-your-new-business">Please enter a location that you wish to open your Keep Flippin' Facility.</error>
    </xsl:with-param>
		<xsl:with-param name="inputs">
	    <input name="send-email[from]" value="fields[email-address]" type="hidden" />
	    <input name="send-email[subject]" value="Franchisee Prospect submitted a form" type="hidden" />
	    <input name="send-email[body]" value="fields[additional-comments]" type="hidden" />
	    <input name="send-email[recipient]" value="scott" type="hidden" />
			<input name="redirect" value="{$root}/franchising/contact/success/" type="hidden" />
		</xsl:with-param>
	</xsl:apply-templates>
</xsl:template>

</xsl:stylesheet>