<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	
<xsl:template name="gallery">
	<xsl:apply-templates select="galleries/entry" />
</xsl:template>

<xsl:param name="gallerywidth" select="'160'"/>
<xsl:param name="gallerycols" select="'5'" />
<xsl:param name="picwidth" select="'260'"/>
<xsl:param name="piccols" select="'3'" />

<xsl:template name="gallery-list">
	<ul id="gallery-list">
		<xsl:for-each select="galleries/entry">
			<li>
				<xsl:choose>
					<xsl:when test="position() mod $gallerycols = 0 or position() = last()">						
						<xsl:attribute name="class">
							<xsl:text>last</xsl:text>
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="position() mod $gallerycols = 1">
						<xsl:attribute name="class">
							<xsl:text>first</xsl:text>
						</xsl:attribute>						
					</xsl:when>
				</xsl:choose>
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="$root"/>
						<xsl:text>/photos/</xsl:text>
						<xsl:value-of select="title/@handle"/>
					</xsl:attribute>
					<img src="{$root}/image/2/{$gallerywidth}/120/3{key-photo/@path}/{key-photo/item/filename}" />
					<div class="shade" />
					<div class="description">
						<p>
							<xsl:copy-of select="short-description"/>
						</p>
					</div>
				</a>
				<p class="title"><xsl:value-of select="title"/></p>
				<p class="tags">
					tags: 
					<xsl:for-each select="tags/item">
						<a href="{$root}/photos/tags/{@handle}"><xsl:value-of select="."/></a>
						<xsl:if test="position() != last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</p>
			</li>
		</xsl:for-each>
	</ul>
</xsl:template>


<xsl:template match="galleries/entry">
	<h2><xsl:value-of select="title"/></h2>
	<h4><xsl:value-of select="short-description"/></h4>
	<ul id="gallery">
		<xsl:apply-templates select="images/item" mode="photo" />
	</ul>
	<a href="{$root}/photos">Back to the gallery listing!</a>
</xsl:template>


<xsl:template name="photo">
	<xsl:param name="date" />
	<xsl:param name="filename" />
	<xsl:param name="path" />
	<xsl:param name="desc" />
	<xsl:param name="id" />
	<xsl:choose>
		<xsl:when test="position() mod $piccols = 0 or position() = last()">						
			<xsl:attribute name="class">
				<xsl:text>last</xsl:text>
			</xsl:attribute>
		</xsl:when>
		<xsl:when test="position() mod $piccols = 1">
			<xsl:attribute name="class">
				<xsl:text>first</xsl:text>
			</xsl:attribute>						
		</xsl:when>
	</xsl:choose>
		<a>
			<xsl:attribute name="rel">
				<xsl:text>gallery</xsl:text>
				<!-- <xsl:value-of select="../../title/@handle"/> -->
			</xsl:attribute>
			<xsl:attribute name="href">
				<xsl:value-of select="$workspace"/>
				<xsl:value-of select="$path"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="$filename"/>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="title"/>
			</xsl:attribute>
			<img src="{$root}/image/1/{$picwidth}/0{$path}/{$filename}" />
			<div class="shade" />
			<div class="description">
				<p>
					<xsl:value-of select="$desc"/>
				</p>
			</div>
		</a>
		<p class="date">
			Uploaded on <a href="#">
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="$date"/>
				<xsl:with-param name="format" select="'m d, Y'"/>
			</xsl:call-template>
			</a>
		</p>
		<p class="comments">
			<a href="{$root}/photos/photo/{$id}">
				<xsl:value-of select="count(/data/galleries-comments/entry/image/item[@id = $id])"/> comments
			</a>
		</p>
</xsl:template>

<xsl:template match="item" mode="photo">
	<li>
		<xsl:call-template name="photo">
			<xsl:with-param name="filename" select="filename"/>
			<xsl:with-param name="path" select="../@path" />
			<xsl:with-param name="date" select="meta/@creation" />
			<xsl:with-param name="date" select="meta/@creation" />
			<xsl:with-param name="desc" select="../short-description" />
			<xsl:with-param name="id" select="@related-id" />
		</xsl:call-template>
	</li>	
</xsl:template>

<xsl:template match="photos-tags/entry" mode="photo">
	<li>
		<xsl:call-template name="photo">
			<xsl:with-param name="filename" select="image/filename"/>
			<xsl:with-param name="path" select="image/@path" />
			<xsl:with-param name="date" select="image/meta/@creation" />
			<xsl:with-param name="desc" select="short-description" />
			<xsl:with-param name="id" select="@id" />
		</xsl:call-template>

	</li>	
</xsl:template>


</xsl:stylesheet>