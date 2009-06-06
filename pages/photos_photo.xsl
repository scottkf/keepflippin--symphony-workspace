<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-gallery.xsl"/>
<xsl:import href="../utilities/get-comments.xsl"/>

<xsl:template name="top">
	<div>
		<h2>Photos</h2>
	</div>
</xsl:template>

<xsl:template match="data">
	<ul id="gallery">
		<li>
			<img src="{$root}/image/1/640/480{photos-single/entry/image/@path}/{photos-single/entry/image/filename}" />
		</li>
	</ul>
  <hr/>
	<xsl:apply-templates select="comments"/>
  <hr/>
  <h2>Make a comment</h2>
  <form action="" method="post">
    <xsl:for-each select="events/save-comment">
      <p class="{@result}">
        <xsl:choose>
          <xsl:when test="@result = 'success'">Your comment has been saved successfully.</xsl:when>
          <xsl:otherwise>The system encountered errors when saving your comment. Please check if all the required fields have been filled.</xsl:otherwise>
        </xsl:choose>
      </p>
    </xsl:for-each>
      <label class="required">
        <xsl:text>Name *</xsl:text>
        <input type="text" name="fields[author]" value="{events/save-comment/post-values/author}" />
      </label>
      <label class="required">
        <xsl:text>Email *</xsl:text>
        <input type="text" name="fields[email]" value="{events/save-comment/post-values/email}" />
      </label>
      <label>
        <xsl:text>Website </xsl:text><small>http://</small>
        <input type="text" name="fields[website]" value="{events/save-comment/post-values/website}" />
      </label>
      <label class="required">
        <xsl:text>Comment *</xsl:text>
        <textarea name="fields[comment]" rows="5" cols="21"><xsl:value-of select="events/save-comment/post-values/comment" /></textarea>
      </label>

      <input name="fields[image]" value="{photos-single/entry/@id}" type="hidden" />
			<input name="akismet[author]" value="author" type="hidden" />
			<input name="akismet[email]" value="email" type="hidden" />
			<input name="akismet[url]" value="website" type="hidden" />
      <input id="submit" type="submit" name="action[save-comment]" value="Post Comment" />
  </form>
</xsl:template>




</xsl:stylesheet>