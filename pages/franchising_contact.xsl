<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<div>
	<h3>Personal Information</h3>
	<table style="text-align: left; font-size: 8pt; width: 100%;">
	  <tbody><tr>
	    <th>First Name *</th><th>Last Name *</th>
	  </tr>
	  <tr>
	    <td><label for="zemSubscriberFirstName" class="zemRequired zemSubscriberFirstName">first name</label> <input id="zemSubscriberFirstName" class="zemRequired" name="zemSubscriberFirstName" value="" size="50" maxlength="100" type="text" /></td>
	    <td><label for="zemSubscriberLastName" class="zemRequired zemSubscriberLastName">last name</label> <input id="zemSubscriberLastName" class="zemRequired" name="zemSubscriberLastName" value="" size="21" maxlength="100" type="text" /></td>
	  </tr>

	  <tr>
	    <td colspan="2">Address</td><th>
	  </th></tr>
	  <tr>
	    <td colspan="2"><label for="zemSubscriberAddress" class="zemSubscriberAddress">address</label> <input id="zemSubscriberAddress" class="" name="zemSubscriberAddress" value="" size="75" maxlength="100" type="text" /></td>
	  </tr>

	  <tr>
	    <td colspan="2">City</td><td></td>
	  </tr>
	  <tr>
	    <td colspan="2"><label for="zemSubscriberCity" class="zemSubscriberCity">city</label> <input id="zemSubscriberCity" class="" name="zemSubscriberCity" value="" size="75" maxlength="100" type="text" /></td>
	  </tr>

	  <tr>
	    <td>State</td><td>Zip / Postal code</td>
	  </tr>
	  <tr>
	    <td><label for="zemSubscriberState" class="zemSubscriberState">state</label> <input id="zemSubscriberState" class="" name="zemSubscriberState" value="" size="50" maxlength="100" type="text" /></td>
	    <td><label for="zemSubscriberZip" class="zemSubscriberZip">zipcode</label> <input id="zemSubscriberZip" class="" name="zemSubscriberZip" value="" size="21" maxlength="100" type="text" /></td>
	  </tr>

	  <tr>
	    <td colspan="2">Country</td><td></td>
	  </tr>
	  <tr>
	    <td colspan="2"><label for="zemSubscriberCountry" class="zemSubscriberCountry">country</label> <input id="zemSubscriberCountry" class="" name="zemSubscriberCountry" value="" size="75" maxlength="100" type="text" /></td>
	  </tr>

	  <tr>
	    <th colspan="2">Phone *</th><td></td>
	  </tr>
	  <tr>
	    <td colspan="2"><label for="zemSubscriberPhone" class="zemRequired zemSubscriberPhone">phone</label> <input id="zemSubscriberPhone" class="zemRequired" name="zemSubscriberPhone" value="" size="75" maxlength="100" type="text" /></td>
	  </tr>

	  <tr>
	    <td colspan="2">Best time to contact</td><td></td>
	  </tr>
	  <tr>
	    <td colspan="2"><label for="zemSubscriberContactTime" class="zemSubscriberContactTime">contact time</label> <input id="zemSubscriberContactTime" class="" name="zemSubscriberContactTime" value="" size="75" maxlength="100" type="text" /></td>
	  </tr>

	  <tr>
	    <th colspan="2">Email Address *</th><th></th>
	  </tr>
	  <tr>
	    <td colspan="2"><label for="zemSubscriberCity" class="zemRequired zemSubscriberCity">email address</label> <input id="zemSubscriberCity" class="zemRequired" name="zemSubscriberCity" value="" size="75" maxlength="100" type="text" /></td>
	  </tr>
	  <tr>
	     <td>Additional Comments</td><td></td>
	  </tr>
	  <tr>
	    <td colspan="2"><label for="zemSubscriberComments" class="zemSubscriberComments">Additional Comments</label> <textarea id="zemSubscriberComments" class="" name="zemSubscriberComments" cols="70" rows="8"></textarea></td>
	  </tr>
	  <tr>
	    <td><b>* indicates a required field</b></td>
	  </tr>
	</tbody></table>
	
	<h3>Business Information</h3>
	<table style="text-align: left; font-size: 8pt; width: 100%;">
	  <tbody><tr>

	  </tr><tr>
	    <td colspan="2">Liquid Capital</td><td></td>
	  </tr>
	  <tr>
	    <td colspan="2"><label for="zemSubscriberLiquidCapital" class="zemSubscriberLiquidCapital">liquid capital</label> <input id="zemSubscriberLiquidCapital" class="" name="zemSubscriberLiquidCapital" value="" size="75" maxlength="100" type="text" /></td>
	  </tr>


	  <tr>
	    <td colspan="2">Time Frame</td><td></td>
	  </tr>
	  <tr>
	    <td colspan="2"><label for="zemSubscriberTimeFrame" class="zemSubscriberTimeFrame">time frame</label> <input id="zemSubscriberTimeFrame" class="" name="zemSubscriberTimeFrame" value="" size="75" maxlength="100" type="text" /></td>
	  </tr>

	  <tr>
	    <td colspan="2">Place where you prefer to open your new business (City, State, Country please)</td><td></td>
	  </tr>
	  <tr>
	    <td colspan="2"><label for="zemSubscriberPlace" class="zemSubscriberPlace">place of new business</label> <input id="zemSubscriberPlace" class="" name="zemSubscriberPlace" value="" size="75" maxlength="100" type="text" /></td>
	  </tr>


	    <tr><td><b>* indicates a required field</b></td>
	  </tr>
	  <tr><td><input id="zemSubmit" name="zem_contact_submit" value="Submit Form" type="submit" /></td></tr>
	</tbody></table>

	</div>

</xsl:template>

</xsl:stylesheet>