<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template name="top">
	<div>
		<h2>Contact</h2>
	</div>
</xsl:template>

<xsl:template match="data">
	<h3>By Phone</h3>
	<p>
		561-745-2511
	</p>
	<h3>By Email</h3>
	<p>
		<a href="mailto:darylsue@keepflippin.com">Daryl Sue</a>
	</p>
	<h3>In person</h3>
	<p>
		<a href="{$root}/contact/directions">Go here for directions</a>
	</p>
	<h3>Or via form below</h3>
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

      <input id="submit" type="submit" name="action[save-message]" value="Send" />
  </form>
</xsl:template>

</xsl:stylesheet>
