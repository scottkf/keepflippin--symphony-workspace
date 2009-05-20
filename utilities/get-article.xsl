<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="get-images.xsl"/>

<xsl:template match="entry" mode="admin">
		<xsl:if test="$is-logged-in = 'true'">
				<xsl:text> &#8212; </xsl:text>
				<a class="edit" href="{$root}/symphony/publish/{section/@handle}/edit/{entry/@id}/">Edit</a>
		</xsl:if>
</xsl:template>

<xsl:template match="frontpage-news-items/entry">
	<xsl:apply-templates select="." mode="short">
		<xsl:with-param name="admin">1</xsl:with-param>
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="frontpage-articles/entry">
	<xsl:apply-templates select="." mode="short">
		<xsl:with-param name="admin">1</xsl:with-param>
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="entry" mode="short">
	<xsl:param name="admin" />
	<xsl:param name="entry-id" select="@id" />
	<div class="article">
		<h3>
			<a href="{$root}/news/{title/@handle}/">
				<xsl:apply-templates select="/data/article-images[entry/article/item/@id=$entry-id]" mode="frontpage"/>
				<xsl:value-of select="title"/>
			</a>
			<xsl:if test="$admin">
				<xsl:apply-templates select="." mode="admin" />
			</xsl:if>
		</h3>
			<xsl:copy-of select="body/*" />
	</div>
</xsl:template>





<xsl:template match="entry" mode="left">
	<xsl:param name="entry-id" select="@id" />
	<div class="article">
		<h3>
			<a href="{$root}/news/{title/@handle}/">
				<xsl:apply-templates select="/data/article-images[entry/article/item/@id=$entry-id]" mode="frontpage"/>
				<xsl:value-of select="title"/>
			</a>
		</h3>
		<xsl:copy-of select="substring(body/*,1,300)" />
		<xsl:if test="string-length(body) &gt; 300">
			<a href="{$root}/news/{title/@handle}/">
				... Read more.
			</a>
		</xsl:if>
	</div>
</xsl:template>



<xsl:template match="entry" mode="full">
	<h3>
		<a href="{$root}/news/{title/@handle}/"><xsl:value-of select="title"/></a>
		<xsl:apply-templates select="." mode="admin" />
	</h3>
	<ul class="meta">
		<!-- <li class="icon-filed-under">
			<xsl:apply-templates select="categories/item"/>
		</li> -->
		<xsl:if test="comments-allowed='Yes'">
			<li class="icon-comments">
				<a href="{$root}/news/{title/@handle}/#comments">
					<xsl:text>Comments (</xsl:text>
					<xsl:value-of select="@comments"/>
					<xsl:text>)</xsl:text>
				</a>
			</li>
		</xsl:if>
	</ul>
	<xsl:copy-of select="body/*[1]"/>
	<xsl:apply-templates select="/data/article-images[entry]"/>
	<xsl:copy-of select="body/*[position() &gt; 1]"/>
</xsl:template>

<xsl:template match="categories/item">
	<xsl:value-of select="."/>
	<xsl:if test="position() != last()">
		<xsl:text>, </xsl:text>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>