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
                        This is a graph displaying <strong><xsl:value-of select="$person" />'s</strong><xsl:if test="$activity = ''"><xsl:text> </xsl:text><em>overall</em> </xsl:if> progress.
                        <xsl:if test="$activity != ''"> in the activity named, "<em><xsl:value-of select="/data/activities/entry[@id = $activity]/name" />.</em>"</xsl:if>
                        <br />Go <a href="{$root}/showteam/show-report">back to the list of reports</a>
			</p>
        </xsl:if>
		</div>
                <div>
<xsl:if test="$person != ''">View detailed individual activities: <ul><xsl:for-each select="/data/activities/entry"><li><a href="{$root}/showteam/fitness-report-graph/{$person}/{@id}"><xsl:value-of select="name" /> </a></li></xsl:for-each></ul></xsl:if><xsl:if test="$activity != ''"><a href="{$root}/showteam/fitness-report-graph/{$person}">View all activities in a single chart.</a></xsl:if>
		</div>
	</div>
</xsl:template>

<xsl:template match="/data">
<xsl:text disable-output-escaping="yes"><![CDATA[
<script language="JavaScript" type="text/javascript"> 
  AC_FL_RunContent = 0;
  DetectFlashVer = 0;
</script>
]]></xsl:text>
<script src="{$workspace}/graph/AC_RunActiveContent.js" language="javascript"></script> 
<script language="JavaScript" type="text/javascript"> 
<xsl:text disable-output-escaping="yes"><![CDATA[
var requiredMajorVersion = 10;
var requiredMinorVersion = 0;
var requiredRevision = 45;


if (AC_FL_RunContent == 0 || DetectFlashVer == 0) {
	alert("This page requires AC_RunActiveContent.js.");
} else {
	var hasRightVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);
	if(hasRightVersion) { 
		AC_FL_RunContent(
			'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,45,2',
			'width', ']]></xsl:text><xsl:choose><xsl:when test="$short = 1">450</xsl:when><xsl:otherwise>900</xsl:otherwise></xsl:choose><xsl:text disable-output-escaping="yes"><![CDATA[',
			'height', ']]></xsl:text><xsl:choose><xsl:when test="$short = 1">250</xsl:when><xsl:otherwise>600</xsl:otherwise></xsl:choose><xsl:text disable-output-escaping="yes"><![CDATA[',
			'scale', 'noscale',
			'salign', 'TL',
			'bgcolor', 'white',
			'wmode', 'opaque',
			'movie', 'charts',
			'src', '/workspace/graph/charts',
			'FlashVars', ']]></xsl:text>library_path=/workspace/graph/charts_library&amp;xml_source=/showteam/chart-data/<xsl:value-of select="$person" />/<xsl:value-of select="$activity" /><xsl:if test="$short = 0">?short</xsl:if><xsl:text disable-output-escaping="yes"><![CDATA[',
			'id', 'my_chart',
			'name', 'my_chart',
			'menu', 'true',
			'allowFullScreen', 'true',
			'allowScriptAccess','sameDomain',
			'quality', 'high',
			'align', 'middle',
			'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
			'play', 'true',
			'devicefont', 'false'
			); 
	} else { 
		var alternateContent = 'This content requires the Adobe Flash Player. '
		+ '<u><a href=http://www.macromedia.com/go/getflash/>Get Flash</a></u>.';
		document.write(alternateContent); 
	}
}
]]></xsl:text></script>
<noscript> 
	<P>This content requires JavaScript.</P>
</noscript> 
 
</xsl:template>
</xsl:stylesheet>