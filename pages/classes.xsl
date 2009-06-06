<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>
<xsl:import href="../utilities/get-classes.xsl"/>

<xsl:template name="top">
	<div>
		<xsl:if test="$class = 'birthday-parties'">
			<xsl:attribute name="id">
				<xsl:value-of select="'birthdays'"/>
			</xsl:attribute>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="$class != ''">
				<xsl:choose>
					<xsl:when test="$class = 'birthday-parties'">
						<div id="badge-home"></div>
						<div class="introduction">
							<h2 class="header"><a href="{$root}/about">Birthday Parties</a></h2>
							<p>
								Come and celebrate one of the best birthday parties your child can ever have at a gym! They will play games, do <em><strong>tons</strong></em> of gymnastics, have fun an exciting obstacle course, and rule the gym!
							</p>
							<h3>We provide</h3>
							<ul>
								<li>Setup</li>
								<li>A medal for the birthday child</li>
								<li>Balloons for each child</li>
								<li>Tables and chairs</li>
							</ul>
						</div>
						<div>
							<a href="{$root}/showteam" title="about the showteam"><img src="{$workspace}/images/birthdayparty-banner.jpg" /></a>
						</div>
						
					</xsl:when>
					<xsl:otherwise>
						<h2>
							<xsl:value-of select="/data/classes/entry/class-name"/>
							<xsl:apply-templates select="/data/classes/entry" mode="admin" />
						</h2>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<h2>Classes</h2>
			</xsl:otherwise>
		</xsl:choose>
	</div>
</xsl:template>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$class != ''">
		  <xsl:apply-templates select="classes/entry[hidden != 'yes']" mode="full" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="classes" mode="short" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>