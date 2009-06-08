<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="get-images.xsl"/>

<xsl:template name="single-article">
	<div class="article-wide">
	  <xsl:apply-templates select="news/entry" mode="full"/>
	</div>
  <xsl:if test="news/entry/comments-allowed='Yes'">
	  <hr/>
		<xsl:apply-templates select="comments"/>
	  <hr/>
	  <h2>Make a comment</h2>
	  <div id="guideline">
	    <h4>Rules</h4>
	    <ul>
	      <li>Please keep the language PG-13, my mum reads this blog. Hi mum!</li>
	      <li>Text is formatted with <a href="http://daringfireball.net/projects/markdown/syntax">Markdown</a>.</li>
	    </ul>
	  </div>
	  <form action="" method="post">
	    <xsl:for-each select="events/save-comment">
	      <p class="{@result}">
	        <xsl:choose>
	          <xsl:when test="@result = 'success'">Your comment has been saved successfully.</xsl:when>
	          <xsl:otherwise>The system encountered errors when saving your comment. Please check if all the required fields have been filled.</xsl:otherwise>
	        </xsl:choose>
	      </p>
	    </xsl:for-each>
	    <fieldset>
	      <label>
	        <xsl:text>Name </xsl:text>
	        <input type="text" name="fields[author]" value="{events/save-comment/post-values/author}" />
	      </label>
	      <label>
	        <xsl:text>Email </xsl:text>
	        <input type="text" name="fields[email]" value="{events/save-comment/post-values/email}" />
	      </label>
	      <label>
	        <xsl:text>Website </xsl:text><small>http://</small>
	        <input type="text" name="fields[website]" value="{events/save-comment/post-values/website}" />
	      </label>
	      <label>
	        <xsl:text>Comment </xsl:text>
	        <textarea name="fields[comment]" rows="5" cols="21"><xsl:value-of select="events/save-comment/post-values/comment" /></textarea>
	      </label>

	      <input name="fields[article]" value="{articles/entry/@id}" type="hidden" />

	<input name="akismet[author]" value="author" type="hidden" />
	<input name="akismet[email]" value="email" type="hidden" />
	<input name="akismet[url]" value="website" type="hidden" />

	      <input id="submit" type="submit" name="action[save-comment]" value="Post Comment" />
	    </fieldset>
	  </form>
	</xsl:if>
</xsl:template>



<xsl:template match="entry" mode="admin">
		<xsl:if test="$is-logged-in = 'true'">
				<xsl:text> &#8212; </xsl:text>
				<a class="edit" href="{$root}/symphony/publish/{../section/@handle}/edit/{@id}/">Edit</a>
		</xsl:if>
</xsl:template>

<xsl:template match="frontpage-news-items/entry">
	<div class="article">
		<xsl:apply-templates select="." mode="short">
			<xsl:with-param name="admin">1</xsl:with-param>
		</xsl:apply-templates>
	</div>
</xsl:template>

<xsl:template match="frontpage-articles/entry">
	<div class="article">
		<xsl:apply-templates select="." mode="short">
			<xsl:with-param name="admin">1</xsl:with-param>
		</xsl:apply-templates>
	</div>
</xsl:template>


<xsl:template match="frontpage-articles/entry | frontpage-news-items/entry | articles/entry" mode="short">
	<xsl:param name="admin" />
	<xsl:param name="entry-id" select="@id" />
	<h3>
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="$root"/>
				<xsl:choose>
					<xsl:when test="alternate-link != ''">
						<xsl:value-of select="alternate-link"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'/news/'"/>
						<xsl:value-of select="substring(publish-this-article-on, 1, 4)"/>
						<xsl:value-of select="'/'"/>
						<xsl:value-of select="title/@handle"/>
						<xsl:value-of select="'/'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:value-of select="title"/>
		</a>
		<xsl:if test="$admin">
			<xsl:apply-templates select="." mode="admin" />
		</xsl:if>
	</h3>
		<xsl:copy-of select="body/*" />
</xsl:template>

<xsl:template match="news/entry" mode="short">
	<xsl:param name="admin" />
	<xsl:param name="entry-id" select="@id" />
	<h3>
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="$root"/>
				<xsl:choose>
					<xsl:when test="alternate-link != ''">
						<xsl:value-of select="alternate-link"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'/news/'"/>
						<xsl:value-of select="substring(publish-this-article-on, 1, 4)"/>
						<xsl:value-of select="'/'"/>
						<xsl:value-of select="title/@handle"/>
						<xsl:value-of select="'/'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:value-of select="title"/>
		</a>
		<xsl:if test="$admin">
			<xsl:apply-templates select="." mode="admin" />
		</xsl:if>
	</h3>
	<ul class="meta">
	</ul>
	<p>
	<xsl:copy-of select="body/p[1]/node()" />
	<xsl:if test="string-length(body) &gt; 200">
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="$root"/>
				<xsl:choose>
					<xsl:when test="alternate-link != ''">
						<xsl:value-of select="alternate-link"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'/news/'"/>
						<xsl:value-of select="substring(publish-this-article-on, 1, 4)"/>
						<xsl:value-of select="'/'"/>
						<xsl:value-of select="title/@handle"/>
						<xsl:value-of select="'/'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			... Read More
		</a>
	</xsl:if>
</p>
</xsl:template>




<xsl:template match="frontpage-articles/entry" mode="left">
	<xsl:param name="entry-id" select="@id" />
	<div class="article">
		<h3>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="$root"/>
					<xsl:choose>
						<xsl:when test="alternate-link != ''">
							<xsl:value-of select="alternate-link"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'/news/'"/>
							<xsl:value-of select="substring(publish-this-article-on, 1, 4)"/>
							<xsl:value-of select="'/'"/>
							<xsl:value-of select="title/@handle"/>
							<xsl:value-of select="'/'"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:apply-templates select="/data/article-images/entry[article/item/@id=$entry-id]" mode="frontpage"/>
				<xsl:value-of select="title"/>
			</a>
		</h3>
		<xsl:copy-of select="substring(body/*,1,300)" />
		<xsl:if test="string-length(body) &gt; 300">
			<a href="{$root}/news/{substring(publish-this-article-on, 1, 4)}/{title/@handle}/">
				... Read more.
			</a>
		</xsl:if>
	</div>
</xsl:template>



<xsl:template match="frontpage-articles/entry | frontpage-news-items/entry | news/*/*/entry | news/entry" mode="full">
	<xsl:param name="entry-id" select="@id" />
	<xsl:if test="../news != ''">
		
	<h3>
		<a href="{$root}/news/{substring(publish-this-article-on, 1, 4)}/{title/@handle}/">
			<xsl:value-of select="title"/>
		</a>
		<xsl:apply-templates select="." mode="admin" />
	</h3>
	</xsl:if>
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
	<xsl:apply-templates select="/data/article-images/entry[article/item/@id = $entry-id]" mode="frontpage"/>
	<xsl:copy-of select="body/*[1]"/>
	<xsl:copy-of select="body/*[position() &gt; 1]"/>
</xsl:template>

<xsl:template match="categories/item">
	<xsl:value-of select="."/>
	<xsl:if test="position() != last()">
		<xsl:text>, </xsl:text>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>