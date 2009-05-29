<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/master.xsl" />

<xsl:template match="/data">

    <div id="package">
      <h1>404 Error: Page Not Found</h1>
      <p>Head back to <a href="{$root}/">home</a> or <a href="{$root}/about/">contact</a> me.</p>
    </div>

</xsl:template>

</xsl:stylesheet>