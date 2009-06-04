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
		<h2>Schedule</h2>
		<p>
			duplicate
		</p>
	</div>
</xsl:template>

<xsl:template match="data">
	<xsl:if test="/data/events/login-info/@logged-in = 'true'">
		<xsl:copy-of select="/data/events" />
		<xsl:choose>
			<xsl:when test="/data/events/duplicate-session[@type = 'created' and @result = 'success']">
				<h3>You can change some of the event data now, or do it later.</h3>
				<xsl:apply-templates select="section-schema[@handle='events']">
					<xsl:with-param name="multiple" select="1" />
					<xsl:with-param name="parent_name">
						<xsl:text>session</xsl:text>
					</xsl:with-param>
					<xsl:with-param name="parent_id" select="/data/events/duplicate-session/@id"/>
					<xsl:with-param name="values">
						<xsl:text>/data/duplicate-event/entry</xsl:text>
					</xsl:with-param>
					<xsl:with-param name="event" select="/data/events/duplicate-event" />
					<xsl:with-param name="post">
						<xsl:text>duplicate-event</xsl:text>
					</xsl:with-param>
					<xsl:with-param name="inputs">
						<input name="redirect" value="{$root}/symphony/publish/sessions/" type="hidden" />
					</xsl:with-param>
				</xsl:apply-templates>				
			</xsl:when>


			<xsl:otherwise>
				<h3>Attempting to duplicate <xsl:value-of select="$session"/></h3>
				<h4>The name must be entered like Winter-2009, Summer-2010, etc. You have to use a dash (sorry). Then just click one of the submit buttons.</h4>
				<xsl:apply-templates select="section-schema[@handle='sessions']">
					<xsl:with-param name="event" select="/data/events/duplicate-session" />
					<xsl:with-param name="post">
						<xsl:text>duplicate-session</xsl:text>			
					</xsl:with-param>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	

</xsl:if>
</xsl:template>

</xsl:stylesheet>