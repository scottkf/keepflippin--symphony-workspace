<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="entry" mode="admin">
		<xsl:if test="$is-logged-in = 'true'">
				<xsl:text> &#8212; </xsl:text>
				<a class="edit" href="{$root}/symphony/publish/{../section/@handle}/edit/{@id}/">Edit</a>
		</xsl:if>
</xsl:template>

<xsl:template name="important">
	<h3>What do we wear?</h3>
	<p>
		Leotards for girls, Gym clothes for boys. Gymnasts will go barefoot. All hair must be pulled back and out of the face. Long hair must be in a ponytail.
		<b>NO midriffs, jeans, pants or buttons allowed</b>.
	</p>
	<h3>How do we deal with missed classes (make-ups)?</h3>
	<p class="info">Gymnasts are allowed to do one make-up class per month. All make-ups must be done before the start of the next month. No make-ups will be carried over to the following month. All make-ups must be done during our open gym class only. This will keep classes consistent and to a low ratio. </p>	
</xsl:template>

<xsl:template match="classes/entry">
	<xsl:apply-templates select="." mode="short">
		<xsl:with-param name="admin">1</xsl:with-param>
	</xsl:apply-templates>
</xsl:template>

<xsl:template name="classes" mode="short">
	<xsl:param name="admin" />
	<ul id="class">
	<xsl:for-each select="classes/entry">
	<li>
		<xsl:if test="position() mod 2 = 0 or last() = position()">
			<xsl:attribute name="class">
				<xsl:value-of select="'last'"/>
			</xsl:attribute>
		</xsl:if>
		<div class='left'>
				<a href="{$root}/classes/{class-name/@handle}/">
					<img src="{$root}/image/2/145/130/3{image/@path}/{image/filename}" />
	 			</a>
		</div>
		<div class='right'>
			<h3>
				<a href="{$root}/classes/{class-name/@handle}/">
					<xsl:value-of select="class-name"/>
				</a>
				<xsl:if test="$admin">
					<xsl:apply-templates select="." mode="admin" />
				</xsl:if>
			</h3>
			<h5>
				Ages &#8212; <xsl:value-of select="ages/item"/>
			</h5>
			<p>
				<xsl:value-of select="short-description" />
			</p>
		</div>
	</li>
	</xsl:for-each>
	</ul>
</xsl:template>

<!-- if there's a session, use it, otherwise use a space -->
<xsl:template name="build-schedule-link">
	<xsl:param name="classname" />
	<a href="{$root}/schedule/classes/+/{$this-year}/{$this-month}/{$classname}">Find a class time...</a>
</xsl:template>





<xsl:template match="classes/entry" mode="full">
	<div class="class">
		<h3>
			For ages &#8212;<xsl:value-of select="ages" />
		</h3>
		<xsl:call-template name="build-schedule-link">
			<xsl:with-param name="classname" select="class-name/@handle"/>
		</xsl:call-template>
		<xsl:copy-of select="description/*"/>
		<xsl:call-template name="important" />
	</div>
</xsl:template>


</xsl:stylesheet>