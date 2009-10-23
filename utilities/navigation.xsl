<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="navigation">
  <ul>
    <li id="welcome">
      <xsl:if test="'home' = $root-page">
        <xsl:attribute name="class">selected</xsl:attribute>
      </xsl:if>
      <a href="{$root}">Welcome</a>
    </li>
    <xsl:apply-templates select="page[not(types/type = 'hidden') and not(types/type = 'admin')]"/>

    <xsl:if test="/data/events/login-info/@logged-in = 'true'">
      <li><a href="{$root}/symphony/">Admin</a></li>
      <li><a href="?debug">Debug</a></li>
    </xsl:if>

  </ul>
</xsl:template>

<xsl:template match="page">
  <li>
		<xsl:attribute name="id">
			<xsl:value-of select="@handle"/>
		</xsl:attribute>
    <xsl:if test="(@handle = $current-page and ../../page != '') or @handle = $root-page">
      <xsl:attribute name="class">selected</xsl:attribute>
    </xsl:if>
		<xsl:variable name="handle">
			<xsl:choose>
				<xsl:when test="../../page != ''">
					<xsl:value-of select="../@handle"/>
					<xsl:value-of select="'/'"/>
					<xsl:value-of select="@handle"/>
				</xsl:when>
				<xsl:when test="@handle = 'schedule'">
					<xsl:value-of select="@handle"/>
					<xsl:value-of select="'/'"/>
					<xsl:value-of select="$this-session"/>
					<xsl:value-of select="'/'"/>
					<xsl:value-of select="$this-place"/>
					<xsl:value-of select="'/'"/>
					<xsl:value-of select="$this-year"/>
					<xsl:value-of select="'/'"/>
					<xsl:value-of select="'09'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@handle"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
    <a href="{$root}/{$handle}/">
      <xsl:value-of select="(name)"/>
    </a>
  </li>
</xsl:template>

</xsl:stylesheet>