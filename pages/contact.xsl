<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template name="head">
	
</xsl:template>

<xsl:template name="top">
	<div>
		<h2>Contact</h2>
	</div>
</xsl:template>

<xsl:template match="data">
	<h2><a href="{$root}/locations/keep-flippin-headquarters">Keep Flippin' Headquarters</a></h2>
	<p>
		<a>
			<xsl:attribute name="href">
				<xsl:choose>
					<xsl:when test="$mobile = 'true'">
						<xsl:value-of  select="'http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=6761+W+Indiantown+Rd,+Jupiter,+FL+33458+(Keep+Flippin+Gymnastics)&amp;sll=37.649034,-95.712891&amp;sspn=40.268799,88.066406&amp;ie=UTF8&amp;ll=26.934677,-80.13756&amp;spn=0.011172,0.021501&amp;z=16&amp;iwloc=A'"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$root"/>
						<xsl:value-of select="'/contact/directions/keep-flippin-headquarters'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		6761 W. Indiantown Rd.<br />
		Suite #28<br />
		Jupiter, FL. 33458
		</a>
	</p>
	<hr />
	<div id="left">
	<h5>Phone</h5>
	<p>
		(561)-745-2511
	</p>
	<h5>Email</h5>
	<p>
		<a href="mailto:darylsue@keepflippin.com">Daryl Sue</a>
	</p>
	<h5>In person</h5>
	<p>
		<a href="{$root}/contact/directions/keep-flippin-headquarters">Directions via Google</a>
	</p>
	<h5>Franchising</h5>
	<p>
		<a href="{$root}/franchising/contact">Contact</a>
	</p>
	</div>
	<div id="right">
	<h4>Optionally, fill out the form below to send us an email</h4>
	<h5>Required fields are indicated by an asterisk (*) and are in bold.</h5>
  <form action="" method="post">
    <xsl:for-each select="events/save-message">
      <p class="{@result}">
        <xsl:choose>
          <xsl:when test="@result = 'success'">Email sent.</xsl:when>
          <xsl:otherwise>The system encountered errors while sending your email. Please check if all the required fields have been filled.</xsl:otherwise>
        </xsl:choose>
      </p>
    </xsl:for-each>
      <label class="required">Name *<input type="text" name="fields[name]" value="{events/save-message/post-values/name}" /></label>
      <label class="required">Email *<input type="text" name="fields[email]" value="{events/save-message/post-values/email}" /></label>
      <label class="required">Subject *
        <xsl:choose>
          <xsl:when test="events/save-message/post-values/subject">
            <input type="text" name="fields[subject]" value="{events/save-message/post-values/subject}" />
          </xsl:when>
          <xsl:otherwise>
            <input type="text" name="fields[subject]" value="General Enquiry" />
          </xsl:otherwise>
        </xsl:choose>
      </label>
      <label>Message<textarea name="fields[message]" rows="5" cols="21"><xsl:value-of select="events/save-message/post-values/message" /></textarea></label>

      <input name="send-email[recipient]" value="scott" type="hidden" />
      <input name="send-email[sender-email]" value="fields[email]" type="hidden" />
      <input name="send-email[sender-name]" value="fields[name]" type="hidden" />
      <input name="send-email[subject]" value="fields[subject]" type="hidden" />
      <input name="send-email[body]" value="fields[message],fields[subject],fields[email],fields[name]" type="hidden" />
			<input name="fields[date-contacted]" value="{$today}" type="hidden" />
      <input id="submit" type="submit" name="action[save-message]" value="Send" />
  </form>
	</div>
</xsl:template>

</xsl:stylesheet>
