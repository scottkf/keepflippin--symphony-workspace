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
<xsl:if test="/data/events/login-info/@logged-in = 'true'">
  <xsl:choose>
    <xsl:when test="/data/events/save-fitness-report[@type = 'created' and @result = 'success'] or /data/events/save-report/entry[@result = 'error']">

<xsl:if test="count(/data/events/save-report/entry[@result = 'error']) > 0">
<h2><xsl:value-of select="count(/data/events/save-report/entry[@result = 'error'])" />  error(s)! See below.</h2>
</xsl:if>
<xsl:variable name="total" select="count(/data/fitness-test-participants/entry)" />
<form method="post" action="" enctype="multipart/form-data">
<table>
<tbody>
<tr><th></th>
<xsl:for-each select="/data/fitness-test-participants/entry">
  <td><xsl:value-of select="name" /></td>
</xsl:for-each>
</tr>
<xsl:for-each select="/data/activities/entry">
<tr>
<th> <xsl:if test="metric != 'none'">(in <xsl:value-of select="metric" />)</xsl:if><h3><xsl:value-of select="name" /></h3></th>
<xsl:variable name="index" select="@id" />
<xsl:variable name="position" select="position() - 1" />
<xsl:variable name="fitness-report-id">
  <xsl:choose>
    <xsl:when test="/data/events/save-fitness-report/@id != ''">
      <xsl:value-of select="/data/events/save-fitness-report/@id" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="/data/events/save-report/entry/post-values/fitness-report" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>
<xsl:for-each select="/data/fitness-test-participants/entry">
  <td>
  <xsl:variable name="pos" select="((position() - 1)) + ($total * $position)" />
  <label><!--Data (time/count/measurement/etc)-->
    <xsl:attribute name="class">
      <xsl:if test="/data/events/save-report/entry[@position = $pos]/@result = 'error'">
        <xsl:text>error</xsl:text>
      </xsl:if>
    </xsl:attribute>
    <input name="fields[{$pos}][data]" type="text" style="width: 15px">
    </input>
  </label>
  <input name="fields[{$pos}][activity-date]" type="hidden" value="{$activity-date}" />
  <input name="fields[{$pos}][member]" type="hidden" value="{@id}" />
  <input name="fields[{$pos}][activity]" type="hidden" value="{$index}" />
  <input name="fields[{$pos}][fitness-report]" type="hidden" value="{$fitness-report-id}" />
  </td>
</xsl:for-each>
</tr>
</xsl:for-each>
  <tr><td><input name="action[save-report]" type="submit" value="Submit" /></td></tr>
</tbody>
</table>
</form>
</xsl:when>
<xsl:otherwise>
				<h3>Type in the date the event occurred, like: October 23, 1969</h3>
<form method="post" action="" enctype="multipart/form-data">
<xsl:if test="count(/data/events/save-fitness-report/entry[@result = 'error']) > 0">
<h2><xsl:value-of select="count(/data/events/save-fitness-report/entry[@result = 'error'])" />  error(s)! See below.</h2>
</xsl:if>
  <label>Date occurred (required)
    <input name="fields[date]" type="text" value="{$today}" />
  </label>
  <label>Comments (required)
    <input name="fields[comments]" type="text" />
  </label>
  <input name="action[save-fitness-report]" type="submit" value="Submit" />
</form>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
</xsl:template>


  
</xsl:stylesheet>