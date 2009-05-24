<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	xmlns:math="http://exslt.org/math"
	extension-element-prefixes="date math">


<xsl:template match="/data/schedule*" mode="events">
	<xsl:param name="day" />
	<xsl:variable name="y">
		<xsl:call-template name="format-date">
	    <xsl:with-param name="date" select="$day"/>
	    <xsl:with-param name="format" select="'Y'"/>
	  </xsl:call-template>
	</xsl:variable>
	<xsl:variable name="m">
		<xsl:call-template name="format-date">
	    <xsl:with-param name="date" select="$day"/>
	    <xsl:with-param name="format" select="'n'"/>
	  </xsl:call-template>
	</xsl:variable>
	<xsl:variable name="d">
		<xsl:call-template name="format-date">
	    <xsl:with-param name="date" select="$day"/>
	    <xsl:with-param name="format" select="'d'"/>
	  </xsl:call-template>
	</xsl:variable>
	
	<xsl:choose>
		<!-- filter by class, since we can't do it through the DS, otherwise we lose all over events -->
		<xsl:when test="year[$y = @value]/month[$m = @value]/day[$d = @value]/*[name/@handle = 'closed']">
			<xsl:apply-templates select="year[$y = @value]/month[$m = @value]/day[$d = @value]/entry[name/@handle = 'closed']" mode="event" />
		</xsl:when>
		<xsl:when test="$classes != ''">
			<xsl:apply-templates select="year[$y = @value]/month[$m = @value]/day[$d = @value]/entry[class/item/@handle = $classes or not(class)]" mode="event" />
		</xsl:when>
		<!-- otherwise give everything -->
		<xsl:otherwise>
			<xsl:apply-templates select="year[$y = @value]/month[$m = @value]/day[$d = @value]/entry" mode="event" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="/data/schedule*/year/month/day/entry" mode="event">
	<xsl:variable name="entry-id" select="class/item/@id" />
	<xsl:choose>
		<!-- if the item has a class attached -->
		<xsl:when test="class != ''">
				<li class="{/data/classes-list/entry[@id = $entry-id]/class-name/@handle}">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$root" />
							<xsl:text>/classes/class/</xsl:text>
							<xsl:value-of select="/data/classes-list/entry[@id = $entry-id]/class-name/@handle" />
						</xsl:attribute>
						<xsl:value-of select="name" />
					</a>
					<!-- <xsl:copy-of select="substring(/data/classes-list/entry[@id = $entry-id]/description/*,1,50)" />
					<xsl:if test="string-length(/data/classes-list/entry[@id = $entry-id]/description) &gt; 50">
						<a href="{$root}/news/{title/@handle}/">
							...
						</a>
					</xsl:if> -->
				</li>
		</xsl:when>
		<!-- otherwise it's a non-class event, like 'tuition due' -->
		<xsl:otherwise>
			<li>
				<a href="#">
					<xsl:value-of select="name" />
				</a>
			</li>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


</xsl:stylesheet>
