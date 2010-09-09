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
	<div id="left">
	<h5 class="phone">Call us</h5>
	<p>
		+1 (561) 745-2511
	</p>
	<h5 class="email">Contact us via email</h5>
	<p>
	  Fill out the form on the right, and we'll get back to you straight away.<br /><br />
		Mail us directly at <a href="mailto:darylsue@keepflippin.com">darylsue@keepflippin.com</a>.
	</p>
	<h5 class="life">Stop by in person</h5>
	<p>
	  Our address is below. To open up an interactive map, click the address.<br /><br />
	  <strong>Keep Flippin' Headquarters</strong><br />
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
	<h5 class="franchising">Franchising</h5>
	<p>
		To <a href="{$root}/franchising/contact">contact us</a> regarding franchising, please <a href="{$root}/franchising/contact">use this form.</a>
	</p>
	</div>
	<div id="right">
  <form action="" method="post">
    <xsl:for-each select="events/save-message">
      <label class="{@result}">
        <xsl:choose>
          <xsl:when test="@result = 'success'">Email sent.</xsl:when>
          <xsl:when test="name/@type = 'missing'">You didn't enter your name!</xsl:when>
          <xsl:when test="email/@type = 'missing'">You didn't enter your email address!</xsl:when>
          <xsl:when test="message/@type = 'missing'">You didn't enter a message!</xsl:when>
          <xsl:when test="email/@type = 'invalid'">You entered an invalid email address.</xsl:when>
          <xsl:otherwise>There was a problem below, please make sure all the fields are filled out.</xsl:otherwise>
        </xsl:choose>
      </label>
    </xsl:for-each>
    <fieldset>
      <div>
      	<h3>Fill out the form below to send us an email</h3>
      	<h5>All fields are required.</h5>
        <hr />
        <label class="required">Your name<input type="text" name="fields[name]" value="{events/save-message/post-values/name}" /></label>
        <label class="required">Email Address<input type="text" name="fields[email]" value="{events/save-message/post-values/email}" /></label>
        <label class="required">This is regarding
          <xsl:choose>
            <xsl:when test="events/save-message/post-values/subject">
              <input type="text" name="fields[subject]" value="{events/save-message/post-values/subject}" />
            </xsl:when>
            <xsl:when test="$subject">
              <xsl:variable name="spaces" select="translate($subject, '+', ' ')" /> 
              <input type="text" name="fields[subject]" value="{$spaces}" />
            </xsl:when>
            <xsl:otherwise>
              <input type="text" name="fields[subject]" value="A general question" />
            </xsl:otherwise>
          </xsl:choose>
        </label>
        <label>Message<textarea name="fields[message]" rows="5" cols="21"><xsl:value-of select="events/save-message/post-values/message" /></textarea></label>
        <input name="send-email[sender-email]" value="fields[email]" type="hidden" />
        <input name="send-email[sender-name]" value="fields[name]" type="hidden" />
        <input name="send-email[subject]" value="fields[subject]" type="hidden" />
        <input name="send-email[body]" value="fields[message],fields[subject],fields[email],fields[name]" type="hidden" />
  			<input name="fields[date-contacted]" value="{$today}" type="hidden" />
        <input name="send-email[recipient]" value="darylsue" type="hidden" />
        <input class="send-message" id="submit" type="submit" name="action[save-message]" value="Submit the form" />
      </div>
      <!-- <div>
        <h3>Common questions</h3>
        <h5>Where can I found out about pricing?</h5>
        <p>
          By calling us directly, the phone number can be found on the left.
        </p>
      </div> -->
    </fieldset>
  </form>
	</div>
</xsl:template>

</xsl:stylesheet>
