<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-element-prefixes="date">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/calendar.xsl" />

<xsl:template name="top">
	<xsl:variable name="current-session">
		<xsl:choose>
			<xsl:when test="$session = $this-session">
				<xsl:value-of select="$next-session"/>
			</xsl:when>
			<xsl:when test="$session = $next-session">
				<xsl:value-of select="$this-session"/>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="session-start">
		<xsl:if test="$session = $this-session">
			<xsl:call-template name="session-starts">
				<xsl:with-param name="session" select="$next-session"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="current-session-start">
		<xsl:call-template name="session-starts">
			<xsl:with-param name="session" select="$session"/>
		</xsl:call-template>
	</xsl:variable>
	<div class="schedule">
  	<div class="introduction">
  		<h2>
  			<xsl:if test="$session != '+' and $session != ''">
  				<xsl:value-of select="substring-before($session, '-')"/>&#160;<xsl:value-of select="substring-after($session,'-')"/>
  			</xsl:if>
  			Schedule
  		</h2>
  		<p>
  		  All gymnasts will be evaluated before signing up for a class. Any Red, White or Blue class that does not specify a gender is a girls class. 
  	  </p>
  	  <h3>You can also view</h3>
  		<ul>
  			<li><a href="{$root}/schedule/calendar/{$session}/{$current-session-start}">The monthly calendar</a></li>
  			<li>
  				<a href="{$root}/schedule/{$current-session}/{$this-place}/{$session-start}">
  					The schedule for <xsl:value-of select="substring-before($current-session, '-')"/>&#160;<xsl:value-of select="substring-after($current-session, '-')"/>
  				</a>
  			</li>
  		</ul>
  	</div>
    <div>
      <img src="{$workspace}/images/schedule-right.jpg" alt="schedule picture" />
    </div>
  </div>
</xsl:template>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$session != ''">
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<div id="badge-home"></div>
	<div id="calendar">
		<xsl:call-template name="calendar-by-week" />
	</div>
</xsl:template>


  
</xsl:stylesheet>