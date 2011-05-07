<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template name="top">
	<div id="birthdays">
		<div id="badge-home"></div>
		<div class="introduction">
			<h2 class="header"><a href="{$root}/showteam/show-report">Fitness Reports</a></h2>
        <xsl:if test="$fitness-report-id!= ''">
			<p>
                        This occured on <strong>
			<xsl:call-template name="format-date">
                        <xsl:with-param name="date" select="/data/fitness-reports/entry/date"/>
                        <xsl:with-param name="format" select="'M d, Y'"/>
                        </xsl:call-template></strong> and we added the following comments:</p><p>
                        <em><xsl:value-of select="/data/fitness-reports/entry/comments" /></em>
                        <br/><br />Click on a name for a detailed graph of overall progress. Or go <a href="{$root}/showteam/show-report">back to the list of reports</a>
			</p></xsl:if>
		</div>
	</div>
</xsl:template>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$fitness-report-id!= ''">
<div id="calendar">
<table summary="calendar">
<tbody>
<tr class="days"><th></th>
<xsl:for-each select="/data/fitness-test-participants/entry[fitness-participant='Yes' and current-member='Yes']">
  <th><a href="{$root}/showteam/fitness-report-graph/{name}"><xsl:value-of select="name" /></a></th>
</xsl:for-each>
</tr>
<xsl:for-each select="/data/activities/entry">
<xsl:variable name="activity-id" select="@id" />
<tr class="hour-row">
<th class="hour" style="font-size: 0.9em"> <xsl:if test="metric != 'none'">(in <xsl:value-of select="metric" />)</xsl:if><h3><xsl:value-of select="name" /></h3></th>
<xsl:for-each select="/data/fitness-test-participants/entry[fitness-participant='Yes' and current-member='Yes']">
  <xsl:variable name="person-id" select="@id" />
  <td>
    <a href="{$root}/showteam/fitness-report-graph/{name}/{$activity-id}">
    <xsl:value-of select="/data/fitness-reports-report/entry[(activity/item/@id = $activity-id) and (member/item/@id = $person-id) and (fitness-report/item/@id = $ds-fitness-reports)]/data" />
     </a>
  </td>
</xsl:for-each>
</tr>
</xsl:for-each>
</tbody>
</table>
</div>
		</xsl:when>
		<xsl:otherwise>
          <xsl:if test="/data/events/login-info/@logged-in = 'true'">
            <h2><a href="{$root}/showteam/add-report/">Add a new report</a></h2> 
          </xsl:if>
                  <xsl:for-each select="/data/fitness-reports/entry">
                    <h3><a href="{$root}/showteam/show-report/{@id}">    
                      <xsl:call-template name="format-date">
                        <xsl:with-param name="date" select="date"/>
                        <xsl:with-param name="format" select="'M d, Y'"/>
                      </xsl:call-template></a>
                    </h3>
                    <p><xsl:value-of select="comments" /></p>
                  </xsl:for-each>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

</xsl:stylesheet>