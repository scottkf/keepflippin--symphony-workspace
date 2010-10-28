<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />



<xsl:template match="/">

<chart>
  <chart_data>
    <row>
      <null />
<xsl:for-each select="/data/fitness-test-participants/entry">
  <string><xsl:value-of select="name" /></string>
</xsl:for-each>
    </row>
<xsl:for-each select="/data/activities/entry">
<xsl:variable name="activity-id" select="@id" />
    <row>
      <string><xsl:if test="metric/item/@handle != 'none'">(in <xsl:value-of select="metric" />)</xsl:if><xsl:value-of select="name" /></string>
<xsl:for-each select="/data/fitness-test-participants/entry">
  <xsl:variable name="person-id" select="@id" />
      <number>
        <xsl:value-of select="/data/fitness-reports-report/entry[(activity/item/@id = $activity-id) and (member/item/@id = $person-id) and (fitness-report/item/@id = $ds-fitness-reports)]/data" />
      </number>
</xsl:for-each>
    </row>
</xsl:for-each>
  </chart_data>
</chart>

</xsl:template>


  
</xsl:stylesheet>