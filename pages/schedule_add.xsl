<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	xmlns:exsl="http://exslt.org/common"
	xmlns:dyn="http://exslt.org/dynamic" 
	extension-element-prefixes="dyn exsl date">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/form.xsl" />

<xsl:template name="top">
</xsl:template>

<xsl:template name="head">
</xsl:template>

<xsl:template match="data">

	<h5>* indicates a required field</h5>
	<xsl:if test="/data/events/login-info/@logged-in = 'true'">
		<xsl:apply-templates select="section-schema[@handle='events']">
			<xsl:with-param name="event" select="/data/events/save-event" />
			<xsl:with-param name="post">
				<xsl:text>save-event</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="required">
				*
			</xsl:with-param>
			<xsl:with-param name="value">
				<value handle="name"></value>
				<value handle="session"><xsl:value-of select="$url-session"/></value>
				<value handle="date" units="{$url-units}" mode="{$url-mode}">
					<start><xsl:value-of select="$url-start"/></start>
					<end><xsl:value-of select="$url-end"/></end>
				</value>
				<value handle="place"><xsl:value-of select="$url-place"/></value>
				<value handle="class"><xsl:value-of select="$url-class"/></value>
			</xsl:with-param>
			<xsl:with-param name="inputs">
				<input name="redirect" value="{$root}/schedule/{$session}" type="hidden" />
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:if>
</xsl:template>


  
</xsl:stylesheet>