<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-performances.xsl"/>
<xsl:import href="../utilities/get-comments.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>

<xsl:template name="top">
	<div>
		<div id="badge-home"></div>
		<div class="introduction">
			<h2 class="header">End of the Year Show 2011</h2>
			<p>
				At the end of every gymnastic year, Keep Flippin' Gymnastics has a fantastic performance revue at the Palm Beach Eissey Theatre; that time is quickly approaching! This year's theme is, <em>"All the Sounds of Music".</em> It will be Saturday, April 30th at 6:00pm, and Sunday, May 1st, at 2:00pm. 
			</p>
		</div>
		<div>
			<a href="{$root}/showteam" title="about the showteam"><img style="width: 400px; height: auto" src="{$workspace}/gallery-images/DSC_0487.jpg" alt="eotys picture" /></a>
		</div>
	</div>
</xsl:template>

<xsl:template match="data">
	<div id="left">
        <h4><strong>Rehearsal Information</strong></h4>
        <p>Dress Rehearsals will be held at the Eissey Auditorium. The <a href="http://www.palmbeachstate.edu/x1795.xml">Palm Beach Eissey theatre</a> is located off of PGA Blvd. across the street from the Palm Beach Gardens county Library.</p>
        <p>
<iframe width="400" height="315" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?q=eissey+theatre,+fl&amp;hl=en&amp;cd=1&amp;ei=z0HIS7yXCZX4zATcpfjhCg&amp;sll=26.838326,-80.082891&amp;sspn=1.818303,3.152298&amp;ie=UTF8&amp;view=map&amp;f=d&amp;daddr=11051+Campus+Drive,+Palm+Beach+Gdns,+FL+33410&amp;geocode=Ce0jLfGMaRSBFTaFmQEdNQg6-yHFVNVK_z4uEw&amp;ved=0CBwQ_wY&amp;ll=26.838326,-80.082891&amp;spn=0.006701,0.00912&amp;z=14&amp;output=embed"></iframe>
        </p>
	</div>
	<div id="right">
	<h4><strong>Show Times</strong></h4><ul>
	<li><strong>Saturday, April 30th</strong>, starting at <strong>6:00pm</strong></li>
	<li><strong>Sunday, May 1st</strong>, starting at <strong>2:00pm</strong></li>
	</ul>
	<h4><strong>Rehearsal Times</strong></h4>
<p><strong>To find your scheduled time, <a href="{$root}/contact/End of the Year Show Question [rehearsal times]">please contact us</a>, <a href="{$workspace}/files/show-rehearsal-times-2011.pdf">view the attached PDF by clicking here</a>, come into the gym and ask us, or <a href="{$root}/contact/End of the Year Show Question [rehearsal times]">contact us by phone or by email</a>. YOUR PERFORMER DOESN'T HAVE TO BE AT THE THEATRE FOR THE FULL FOUR HOURS!</strong> It is very important all performers show up to their schedule rehearsal!</p>

        <ul>
	<li>Thursday, April 28th, from 3:00-7:00pm [For Saturday Night Performers]</li>
	<li>Friday, April 29th, from 3:00-7:00pm [For Sunday Night Performers]</li>
	</ul>
<p>
For exact times, please see <a href="{$workspace}/files/show-rehearsal-times-2011.pdf">the attached PDF by clicking here</a>.
</p>
        <h4><strong>Conduct</strong></h4>
        <p>
          <strong>You may take pictures and video at the dress rehearsal <em>ONLY</em>. This no-camera and no-video rule will be <em>strictly</em> enforced at the Saturday and Sunday shows.</strong> Snacks and food may NOT be eaten in the auditorium &#8212; please do not bring snacks with peanuts or peanut oil, as we have several severely allergic gymnastics. The groups will have performance counselors with them at rehearsal and backstage at your students' show. Parents and students may watch all of the rehearsal, but performers <em>must</em> stay backstage at the shows until the end of the show in order to receive their trophies. When the show ends, we will bring performers outside on the East side; they will not be released from the stage. All of our performers must be on their best theatre behavior!
        </p>

	</div>
 
</xsl:template>

</xsl:stylesheet>