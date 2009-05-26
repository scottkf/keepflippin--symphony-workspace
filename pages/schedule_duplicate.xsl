<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:exsl="http://exslt.org/common"
    xmlns:form="http://nick-dunn.co.uk/xslt/form-controls"
    extension-element-prefixes="exsl form">

<xsl:import href="../utilities/master.xsl" />
<xsl:import href="../utilities/form.xsl" />



<xsl:template match="data">
	<style type="text/css">
		div#main, div#sidebar {
			width: 340px;
			float: left;
		}
		label {
			display: block;
			margin-bottom: 20px;
		}
		input, textarea, select {
			display: block;
			width: 300px;
		}
		label.checkbox input {
			display: inline;
			width: auto;
		}
		input.submit-button {
			clear: left;
			width: auto;
		}
	</style>
	<xsl:copy-of select="/data/events" />
	<h3>Attempting to duplicate <xsl:value-of select="$session"/></h3>
	<xsl:apply-templates select="section-schema[@handle='sessions']">
		<xsl:with-param name="event" select="/data/events/duplicate-session" />
		<xsl:with-param name="post">
			<xsl:text>duplicate-session</xsl:text>			
		</xsl:with-param>
	</xsl:apply-templates>
	
	<!-- <xsl:if test="1"> -->
	<xsl:if test="/data/events/duplicate-session[@type = 'created' and @result = 'success']">
		<xsl:apply-templates select="section-schema[@handle='events']">
			<xsl:with-param name="multiple" select="1" />
			<xsl:with-param name="parent_name">
				<xsl:text>session</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="parent_id" select="/data/events/duplicate-session/@id"/>
			<!-- <xsl:with-param name="parent_id">
				<xsl:text>205</xsl:text>				
			</xsl:with-param> -->
			<xsl:with-param name="values">
				<xsl:text>/data/duplicate-event/entry</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="event" select="/data/events/duplicate-event" />
			<xsl:with-param name="post">
				<xsl:text>duplicate-event</xsl:text>
			</xsl:with-param>
		</xsl:apply-templates>
		<!-- <form method="post" action="" enctype="multipart/form-data">
		  <input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
		  <label>Name
		    <input name="fields[name]" type="text" />
		  </label>
		  <input name="action[duplicate-session]" type="submit" value="Submit" />
		</form> -->

	</xsl:if>
</xsl:template>

</xsl:stylesheet>