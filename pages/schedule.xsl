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
			<xsl:otherwise>
			  <xsl:value-of select="$this-session"/>
		  </xsl:otherwise>
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
	<xsl:variable name="current-place">
    <xsl:choose>
      <xsl:when test="$places != ''">
        <xsl:value-of select="$places"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$this-place"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
	<div class="schedule">
  	<div class="introduction">
  		<h2>
  			<xsl:if test="$session != '+' and $session != ''">
  				<xsl:value-of select="substring-before($session, '-')"/>&#160;<xsl:value-of select="substring-after($session,'-')"/>
  			</xsl:if>
  			Schedule
  		</h2>
  		<xsl:if test="$places != ''">
    		<p>
    			Showing only classes at <b>&#8220;<xsl:value-of select="translate($places, '-', ' ')"/>&#8221;</b>.
  		  </p>  		  
  		</xsl:if>
  		<p>
  		  All gymnasts will be evaluated before signing up for a class. Any Red, White or Blue class that does not specify a gender is a girls class. NP (non-performance) classes do not participate in the end of the year show.
  	  </p>
  	  <h3>You can also view</h3>
  		<ul>
  			<li><a href="{$root}/schedule/calendar/{$session}/{$this-year}/{$this-month}/{$current-place}">The monthly calendar</a></li>
  			<!--<xsl:if test="$current-session = $next-session"><li>
  				<a href="{$root}/schedule/{$next-session}/{$current-place}/{$session-start}">
  					The schedule for <span style="text-transform: capitalize"><xsl:value-of select="substring-before($next-session, '-')"/></span>&#160;<xsl:value-of select="substring-after($next-session, '-')"/>
  				</a>
  			</li></xsl:if>-->
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