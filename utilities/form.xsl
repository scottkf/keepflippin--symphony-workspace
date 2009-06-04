<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:exsl="http://exslt.org/common"
    xmlns:form="http://nick-dunn.co.uk/xslt/form-controls"
		xmlns:dyn="http://exslt.org/dynamic" 
	  xmlns:str="http://exslt.org/strings"
		extension-element-prefixes="exsl form str dyn">
		
<xsl:import href="../utilities/form-controls.xsl"/>


<xsl:template match="section-schema">
	<xsl:param name="parent_name" />
	<xsl:param name="parent_id" />
	<xsl:param name="multiple" />
	<xsl:param name="values" />
	<xsl:param name="event" />
	<xsl:param name="post" />
	<xsl:param name="errors"/>
	<xsl:param name="inputs"/>
	<xsl:param name="submit" select="'Submit'"/>
	<xsl:param name="required" select="''"/>
	<xsl:variable name="handle" select="@handle" />
	<form action="" method="post">
	<xsl:choose>
		<xsl:when test="$multiple = 1">
				<xsl:for-each select="dyn:evaluate($values)">
				<xsl:apply-templates select="/data/section-schema[@handle=$handle]" mode="form">
					<xsl:with-param name="id">
						<xsl:choose>
							<xsl:when test="$values != ''">
								<xsl:value-of select="@id"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>0</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
					<xsl:with-param name="multiple" select="position() - 1" />
					<xsl:with-param name="parent_name" select="$parent_name" />
					<xsl:with-param name="parent_id" select="$parent_id"/>
					<xsl:with-param name="values" select="$values" />
					<xsl:with-param name="event" select="$event" />
					<xsl:with-param name="post" select="$post" />	
					<xsl:with-param name="errors" select="$errors" />	
					<xsl:with-param name="required" select="$required" />	
				</xsl:apply-templates>	
			</xsl:for-each>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="/data/section-schema[@handle=$handle]" mode="form">
				<xsl:with-param name="multiple" select="$multiple" />
				<xsl:with-param name="parent_name" select="$parent_name" />
				<xsl:with-param name="parent_id" select="$parent_id"/>
				<xsl:with-param name="id">
					<xsl:choose>
						<xsl:when test="$values != ''">
							<xsl:value-of select="dyn:evaluate(concat($values,'/','@id'))"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>0</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="values" select="$values" />
				<xsl:with-param name="event" select="$event" />
				<xsl:with-param name="post" select="$post" />
				<xsl:with-param name="errors" select="$errors" />	
				<xsl:with-param name="required" select="$required" />	
			</xsl:apply-templates>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:copy-of select="$inputs"/>
	<input type="submit" name="action[{$post}]" value="{$submit}" class="submit-button" />
	</form>
</xsl:template>

<xsl:template match="section-schema" mode="form">
	<xsl:param name="errors" />
	<xsl:param name="event"/>
	<xsl:param name="parent_name" />
	<xsl:param name="parent_id" />
	<xsl:param name="values" />
	<xsl:param name="id" />
	<xsl:param name="post" />
	<xsl:param name="multiple" />
	<xsl:param name="required" />
		<xsl:call-template name="form:validation-summary">
				<xsl:with-param name="event" select="$event" />
		    <xsl:with-param name="success-message" select="'The form was saved.'"/>
		    <xsl:with-param name="error-message" select="'The form was not saved because of the following errors:'"/>
		    <xsl:with-param name="errors">
					<xsl:if test="$errors != ''">
						<xsl:copy-of select="$errors"/>
					</xsl:if>
				</xsl:with-param>
		</xsl:call-template>
		
		<xsl:if test="*[@location='main']">
			<div id="main">			
				<xsl:apply-templates select="*[@location='main']" mode="control">
					<xsl:sort select="@sortorder" data-type="number" order="ascending"/>
					<xsl:with-param name="multiple" select="$multiple" />
					<xsl:with-param name="parent_name" select="$parent_name" />
					<xsl:with-param name="parent_id" select="$parent_id"/>
					<xsl:with-param name="values" select="$values" />
					<xsl:with-param name="event" select="$event" />
					<xsl:with-param name="id" select="$id" />
					<xsl:with-param name="required" select="$required" />	
				</xsl:apply-templates>
			</div>
		</xsl:if>
		
		<xsl:if test="*[@location='sidebar']">
			<div id="sidebar">			
				<xsl:apply-templates select="*[@location='sidebar']" mode="control">
					<xsl:sort select="@sortorder" data-type="number" order="ascending"/>
					<xsl:with-param name="multiple" select="$multiple" />
					<xsl:with-param name="parent_name" select="$parent_name" />
					<xsl:with-param name="parent_id" select="$parent_id"/>
					<xsl:with-param name="values" select="$values" />
					<xsl:with-param name="event" select="$event" />
					<xsl:with-param name="required" select="$required" />	
					<xsl:with-param name="id" select="$id" />
				</xsl:apply-templates>
			</div>
		</xsl:if>

	
</xsl:template>

<xsl:template match="*" mode="control">
	<xsl:param name="parent_name" />
	<xsl:param name="parent_id" />
	<xsl:param name="multiple" />
	<xsl:param name="values" />
	<xsl:param name="event" />
	<xsl:param name="id" />
	<xsl:param name="required" />
	<xsl:variable name="value" select="concat($values,'[@id=',$id,']/',name())"/>
	<!-- <xsl:value-of select="$value"/> -->
	<xsl:choose>
		<xsl:when test="@type='input' or @type='order_entries' or @type='number'">
			<xsl:call-template name="form:label">
				<xsl:with-param name="event" select="$event" />
				<xsl:with-param name="for" select="name()"/>
				<xsl:with-param name="class">
					<xsl:if test="@required = 'yes'">
						<xsl:value-of select="'required'"/>
					</xsl:if>
				</xsl:with-param>
				<xsl:with-param name="text">
					<xsl:value-of select="@label"/>
					<xsl:if test="@required = 'yes'">
						<span><xsl:value-of select="$required" /></span>
					</xsl:if>
				</xsl:with-param>
				<xsl:with-param name="child">
					<xsl:call-template name="form:input">
						<xsl:with-param name="value">
							<xsl:choose>
								<xsl:when test="$id = 0">
								</xsl:when>
								<xsl:when test="$parent_name != '' and $parent_id != '' and $parent_name = name()">
									<xsl:value-of select="$parent_id"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="dyn:evaluate($value)"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="handle">
							<xsl:choose>
								<xsl:when test="$multiple &gt;= 0">
										<xsl:value-of select="$multiple"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="name()"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name()"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="event" select="$event" />
					</xsl:call-template>
				</xsl:with-param>
			</xsl:call-template>	
		</xsl:when>
		
		<xsl:when test="@type='repeatingdate'">
			<xsl:call-template name="form:label">
				<xsl:with-param name="event" select="$event" />
				<xsl:with-param name="for" select="name()"/>
				<xsl:with-param name="text">
					<xsl:value-of select="'Start Date'"/>
					<xsl:if test="@required = 'yes'">
						<span><xsl:value-of select="$required" /></span>
					</xsl:if>
				</xsl:with-param>
				<xsl:with-param name="child">
					<!-- start date -->
					<xsl:call-template name="form:input">
						<xsl:with-param name="size" select="'5'" />
						<xsl:with-param name="value">
							<xsl:choose>
								<xsl:when test="$id = 0">
								</xsl:when>
								<xsl:when test="$parent_name != '' and $parent_id != '' and $parent_name = name()">
									<xsl:value-of select="$parent_id"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="dyn:evaluate(concat($value,'/start'))"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="handle">
							<xsl:choose>
								<xsl:when test="$multiple &gt;= 0">
										<xsl:value-of select="$multiple"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="name()"/>
										<xsl:text> start</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name()"/>
									<xsl:text> start</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="event" select="$event" />
					</xsl:call-template>
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="form:label">
					<xsl:with-param name="event" select="$event" />
					<xsl:with-param name="for" select="name()"/>
					<xsl:with-param name="text">
						<xsl:value-of select="'End Date'"/>
						<xsl:if test="@required = 'yes'">
							<span><xsl:value-of select="$required" /></span>
						</xsl:if>
					</xsl:with-param>
					<xsl:with-param name="child">					<!-- end date -->
					<xsl:call-template name="form:input">
						<xsl:with-param name="value">
							<xsl:choose>
								<xsl:when test="$id = 0">
								</xsl:when>
								<xsl:when test="$parent_name != '' and $parent_id != '' and $parent_name = name()">
									<xsl:value-of select="$parent_id"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="dyn:evaluate(concat($value,'/end'))"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="handle">
							<xsl:choose>
								<xsl:when test="$multiple &gt;= 0">
										<xsl:value-of select="$multiple"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="name()"/>
										<xsl:text> end</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name()"/>
									<xsl:text> end</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="event" select="$event" />
					</xsl:call-template>
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="form:label">
					<xsl:with-param name="event" select="$event" />
					<xsl:with-param name="for" select="name()"/>
					<xsl:with-param name="text">
						<xsl:value-of select="'Repeat Every'"/>
						<xsl:if test="@required = 'yes'">
							<span><xsl:value-of select="$required" /></span>
						</xsl:if>
					</xsl:with-param>
					<xsl:with-param name="child">
					<!-- units -->
					<xsl:call-template name="form:input">
						<xsl:with-param name="value">
							<xsl:choose>
								<xsl:when test="$id = 0">
								</xsl:when>
								<xsl:when test="$parent_name != '' and $parent_id != '' and $parent_name = name()">
									<xsl:value-of select="$parent_id"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="dyn:evaluate(concat($value,'/@units'))"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="handle">
							<xsl:choose>
								<xsl:when test="$multiple &gt;= 0">
										<xsl:value-of select="$multiple"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="name()"/>
										<xsl:text> units</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name()"/>
									<xsl:text> units</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="event" select="$event" />
					</xsl:call-template>
					<!-- mode -->
					<xsl:call-template name="form:select">
						<xsl:with-param name="value">
							<xsl:choose>
								<xsl:when test="$id = 0">
								</xsl:when>
								<xsl:when test="$parent_name != '' and $parent_id != '' and $parent_name = name()">
											<xsl:value-of select="$parent_id"/>
										</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="dyn:evaluate(concat($value,'/@mode'))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="allow-multiple" select="allow-multiple-selection"/>
						<xsl:with-param name="event" select="$event" />
						<xsl:with-param name="handle">
							<xsl:choose>
								<xsl:when test="$multiple &gt;= 0">
										<xsl:value-of select="$multiple"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="name()"/>
										<xsl:text> mode</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name()"/>
									<xsl:text> mode</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
            <xsl:with-param name="options" select="options/*" />
					</xsl:call-template>			
				</xsl:with-param>
			</xsl:call-template>	
		</xsl:when>
		
		<xsl:when test="@type='upload' or @type='hashupload'">
			<xsl:call-template name="form:label">
				<xsl:with-param name="event" select="$event" />			
				<xsl:with-param name="for" select="name()"/>
				<xsl:with-param name="text">
					<xsl:value-of select="@label"/>
					<xsl:if test="@required = 'yes'">
						<span><xsl:value-of select="$required" /></span>
					</xsl:if>
				</xsl:with-param>
				<xsl:with-param name="child">
					<xsl:call-template name="form:input">
						<xsl:with-param name="value">
							<xsl:choose>
								<xsl:when test="$id = 0">
								</xsl:when>
								<xsl:when test="$parent_name != '' and $parent_id != '' and $parent_name = name()">
									<xsl:value-of select="$parent_id"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="dyn:evaluate($value)"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="handle">
							<xsl:choose>
								<xsl:when test="$multiple &gt;= 0">
										<xsl:value-of select="$multiple"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="name()"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name()"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="type" select="'file'"/>
						<xsl:with-param name="event" select="$event" />
					</xsl:call-template>
				</xsl:with-param>
			</xsl:call-template>	
		</xsl:when>
		
		<xsl:when test="@type='textarea'">
			<xsl:call-template name="form:label">
				<xsl:with-param name="event" select="$event" />			
				<xsl:with-param name="for" select="name()"/>
				<xsl:with-param name="text">
					<xsl:value-of select="@label"/>
					<xsl:if test="@required = 'yes'">
						<span><xsl:value-of select="$required" /></span>
					</xsl:if>
				</xsl:with-param>
				<xsl:with-param name="child">
					<xsl:call-template name="form:textarea">
						<xsl:with-param name="value">
							<xsl:choose>
								<xsl:when test="$id = 0">
								</xsl:when>
								<xsl:when test="$parent_name != '' and $parent_id != '' and $parent_name = name()">
									<xsl:value-of select="$parent_id"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="dyn:evaluate($value)"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="event" select="$event" />
						<xsl:with-param name="handle">
							<xsl:choose>
								<xsl:when test="$multiple &gt;= 0">
										<xsl:value-of select="$multiple"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="name()"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name()"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="rows" select="size"/>
					</xsl:call-template>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:when>
		
		<xsl:when test="@type='select' or @type='selectbox_link' or @type='pages' or @type='author'">
			<xsl:call-template name="form:label">
				<xsl:with-param name="event" select="$event" />			
				<xsl:with-param name="for" select="name()"/>
				<xsl:with-param name="text">
					<xsl:value-of select="@label"/>
					<xsl:if test="@required = 'yes'">
						<span><xsl:value-of select="$required" /></span>
					</xsl:if>
				</xsl:with-param>
				<xsl:with-param name="child">
					<xsl:call-template name="form:select">
						<xsl:with-param name="value">
							<xsl:choose>
								<xsl:when test="$id = 0 or dyn:evaluate(concat($value,'/item/@id')) &lt;= 0">
								</xsl:when>
								<xsl:when test="$parent_name != '' and $parent_id != '' and $parent_name = name()">
											<xsl:value-of select="$parent_id"/>
										</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="dyn:evaluate(concat($value,'/item'))">
										<xsl:value-of select="@id"/><xsl:text> </xsl:text>
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="allow-multiple" select="allow-multiple-selection"/>
						<xsl:with-param name="event" select="$event" />
						<xsl:with-param name="handle">
							<xsl:choose>
								<xsl:when test="$multiple &gt;= 0">
										<xsl:value-of select="$multiple"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="name()"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name()"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
            <xsl:with-param name="options" select="options/*" />
					</xsl:call-template>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:when>
		
		<xsl:when test="@type='taglist'">
			<xsl:call-template name="form:label">
				<xsl:with-param name="event" select="$event" />			
				<xsl:with-param name="for" select="name()"/>
				<xsl:with-param name="text">
					<xsl:value-of select="@label"/>
					<xsl:if test="@required = 'yes'">
						<span><xsl:value-of select="$required" /></span>
					</xsl:if>
				</xsl:with-param>
				<xsl:with-param name="child">
					<xsl:call-template name="form:input">
						<xsl:with-param name="event" select="$event" />
						<xsl:with-param name="value">
							<xsl:choose>
								<xsl:when test="$id = 0">
								</xsl:when>
								<xsl:when test="$parent_name != '' and $parent_id != '' and $parent_name = name()">
									<xsl:value-of select="$parent_id"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="dyn:evaluate($value)"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="handle">
							<xsl:choose>
								<xsl:when test="$multiple &gt;= 0">
										<xsl:value-of select="$multiple"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="name()"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name()"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
					</xsl:call-template>					
					<xsl:for-each select="options/option">
						<span><xsl:value-of select="."/></span>
						<xsl:text> </xsl:text>
					</xsl:for-each>					
				</xsl:with-param>
			</xsl:call-template>	
		</xsl:when>
		
		<xsl:when test="@type='checkbox'">
			<xsl:call-template name="form:label">
				<xsl:with-param name="event" select="$event" />			
				<xsl:with-param name="for" select="name()"/>
				<xsl:with-param name="class" select="'checkbox'"/>
				<xsl:with-param name="text">
					<xsl:choose>
						<xsl:when test="description">
							<xsl:value-of select="description"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@label"/>
							<xsl:if test="@required = 'yes'">
								<span><xsl:value-of select="$required" /></span>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="child">
					<xsl:call-template name="form:checkbox">
						<xsl:with-param name="event" select="$event" />
						<xsl:with-param name="value">
							<xsl:choose>
								<xsl:when test="$id = 0">
								</xsl:when>
								<xsl:when test="$parent_name != '' and $parent_id != '' and $parent_name = name()">
									<xsl:value-of select="$parent_id"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="dyn:evaluate($value)"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="event" select="$event" />		
						<xsl:with-param name="handle">
							<xsl:choose>
								<xsl:when test="$multiple &gt;= 0">
										<xsl:value-of select="$multiple"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="name()"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name()"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="checked-by-default">
							<xsl:if test="default_state='on'">
								<xsl:text>yes</xsl:text>
							</xsl:if>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:with-param>
				<xsl:with-param name="child-position" select="'before'"/>
			</xsl:call-template>
		</xsl:when>

	</xsl:choose>
	
</xsl:template>
	
</xsl:stylesheet>