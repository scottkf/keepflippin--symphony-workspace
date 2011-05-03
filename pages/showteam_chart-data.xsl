<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="../utilities/date-time.xsl"/>

<xsl:output method="xml" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />



<xsl:template match="/">

<chart>

  <chart_label position='left' size='11' color='FF4400' alpha='100' />   
  <chart_data>
    <row>
    <null />
    <xsl:for-each select="/data/fitness-reports/entry">
      <string>
  <xsl:call-template name="format-date">
    <xsl:with-param name="date" select="date"/>
    <xsl:with-param name="format" select="'M x, Y'"/>
  </xsl:call-template>
      </string>
    </xsl:for-each>
    </row>
<xsl:for-each select="/data/activities/entry">
<xsl:variable name="activity-id" select="@id" />
  <xsl:if test="count(/data/fitness-reports-report/entry/activity[item/@id = $activity-id]) > 0">
<xsl:for-each select="/data/fitness-test-participants-by-name/entry">
  <xsl:variable name="person-id" select="@id" />
  <row>
  <string><xsl:value-of select="name" /> - <xsl:value-of select="/data/activities/entry[@id = $activity-id]/name" /> <xsl:if test="/data/activities/entry[@id = $activity-id]/metric/item != 'none'"> (in <xsl:value-of select="/data/activities/entry[@id = $activity-id]/metric/item" />)</xsl:if></string>
  <xsl:for-each select="/data/fitness-reports/entry">
    <xsl:variable name="report-id" select="@id" />
    <number>
        <xsl:variable name="value" select="/data/fitness-reports-report/entry[(activity/item/@id = $activity-id) and (member/item/@id = $person-id) and (fitness-report/item/@id = $report-id)]/data" />
        <xsl:attribute name="tooltip"><xsl:value-of select="$value"/></xsl:attribute>
        <xsl:attribute name="label"><xsl:value-of select="$value"/></xsl:attribute>
        <xsl:value-of select="$value" />
         <xsl:if test="count($value) &lt;= 0">0</xsl:if>
    </number>
  </xsl:for-each>
  </row>
</xsl:for-each>
  </xsl:if>
</xsl:for-each>
  </chart_data>
  <chart_type>
    line
  </chart_type>
  <tooltip
     color='000000' 
     />
   <legend layout='horizontal' 
           bullet='circle'
           font='arial'
           bold='true'
           alpha='90'
           >
     <xsl:attribute name="size">
       <xsl:choose><xsl:when test="$short = 0">12</xsl:when><xsl:otherwise>14</xsl:otherwise></xsl:choose>     
     </xsl:attribute>
   </legend> 
  <axis_category color='000000'>
     <xsl:attribute name="size">
       <xsl:choose><xsl:when test="$short = 0">12</xsl:when><xsl:otherwise>18</xsl:otherwise></xsl:choose>     
     </xsl:attribute>
  </axis_category>
  <axis_value size='16' />
<chart_pref line_thickness='2' point_shape='square' fill_shape='true' />
   <chart_border top_thickness='0'
                 bottom_thickness='3'
                 left_thickness='3'
                 right_thickness='0'
                 color='000000'
                 />
</chart>

</xsl:template>


  
</xsl:stylesheet>