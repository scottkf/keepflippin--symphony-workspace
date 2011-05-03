<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template name="top">
	<div id="birthdays">
		<div id="badge-home"></div>
		<div class="introduction">
			<h2 class="header"><a href="{$root}/showteam/show-report">Fitness Reports</a></h2>
        <xsl:if test="$person != ''">
			<p>
                        This is a graph displaying <strong><xsl:value-of select="$person" />'s</strong> progress.
                        <br />Go <a href="{$root}/showteam/show-report">back to the list of reports</a>
			</p>
        </xsl:if>
		</div>
                <div>
<xsl:if test="$person != ''">View detailed individual activities: <ul><xsl:for-each select="/data/activities/entry"><li><a href="{$root}/showteam/fitness-report-graph/{$person}/{@id}"><xsl:value-of select="name" /> </a></li></xsl:for-each></ul></xsl:if>
		</div>
	</div>
</xsl:template>

<xsl:template match="/data">

<xsl:if test="/data/fitness-test-participants/entry[name = $person] != ''">
<xsl:for-each select="/data/activities/entry">
  <iframe style="overflow: hidden; width: 470px; height: 300px" src="{$root}/showteam/fitness-report-graph/{$person}/{@id}?short=1"></iframe>
</xsl:for-each>
</xsl:if>

 
</xsl:template>
</xsl:stylesheet>