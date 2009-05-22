<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="navigation">
  <ul>
    <li id="welcome">
      <xsl:if test="'home' = $root-page">
        <xsl:attribute name="class">selected</xsl:attribute>
      </xsl:if>
      <a href="{$root}/{@handle}">Welcome</a>
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
    <xsl:if test="@handle = $root-page">
      <xsl:attribute name="class">selected</xsl:attribute>
    </xsl:if>
    <a href="{$root}/{@handle}/">
      <xsl:value-of select="(@handle)"/>
    </a>
  </li>
</xsl:template>

</xsl:stylesheet>