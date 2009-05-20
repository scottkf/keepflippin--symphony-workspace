<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="entry" mode="admin">
		<xsl:if test="$is-logged-in = 'true'">
				<xsl:text> &#8212; </xsl:text>
				<a class="edit" href="{$root}/symphony/publish/{section/@handle}/edit/{entry/@id}/">Edit</a>
		</xsl:if>
</xsl:template>

<xsl:template match="classes/entry | classes-list/entry">
	<xsl:apply-templates select="." mode="short">
		<xsl:with-param name="admin">1</xsl:with-param>
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="classes/entry | classes-list/entry" mode="short">
	<xsl:param name="admin" />
	<div class="class">
		<h3>
			<a href="{$root}/classes/class/{class-name/@handle}/">
				<xsl:value-of select="class-name"/>
			</a>
			<xsl:if test="$admin">
				<xsl:apply-templates select="." mode="admin" />
			</xsl:if>
		</h3>
		<xsl:copy-of select="description/*" />
	</div>
</xsl:template>







<xsl:template match="classes/entry | classes-list/entry" mode="full">
	<div class="class">
		<h2>
			<a href="{$root}/{$root-page}/{$current-page}/{class-name/@handle}/"><xsl:value-of select="class-name"/></a>
			<xsl:apply-templates select="." mode="admin" />
		</h2>
		<h3>
			Ages <xsl:copy-of select="ages" />
		</h3>
		<xsl:copy-of select="description/*"/>
	</div>
</xsl:template>


</xsl:stylesheet>