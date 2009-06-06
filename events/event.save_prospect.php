<?php

	require_once(TOOLKIT . '/class.event.php');
	
	Class eventsave_prospect extends Event{
		
		const ROOTELEMENT = 'save-prospect';
		
		public $eParamFILTERS = array(
			'send-email'
		);
			
		public static function about(){
			return array(
					 'name' => 'Save Prospect',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://imac.local/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-06-04T14:43:55+00:00',
					 'trigger-condition' => 'action[save-prospect]');	
		}

		public static function getSource(){
			return '24';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;save-prospect result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/save-prospect></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;save-prospect result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/save-prospect></code></pre>
        <p>The following is an example of what is returned if any filters fail:</p>
        <pre class="XML"><code>&lt;save-prospect result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient username was invalid&lt;/filter>
  ...
&lt;/save-prospect></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>First name
    &lt;input name="fields[first-name]" type="text" />
  &lt;/label>
  &lt;label>Last name
    &lt;input name="fields[last-name]" type="text" />
  &lt;/label>
  &lt;label>Street Address
    &lt;input name="fields[street-address]" type="text" />
  &lt;/label>
  &lt;label>City
    &lt;input name="fields[city]" type="text" />
  &lt;/label>
  &lt;label>State / Province
    &lt;input name="fields[state-province]" type="text" />
  &lt;/label>
  &lt;label>Postal Code
    &lt;input name="fields[postal-code]" type="text" />
  &lt;/label>
  &lt;label>Country
    &lt;input name="fields[country]" type="text" />
  &lt;/label>
  &lt;label>Phone
    &lt;input name="fields[phone]" type="text" />
  &lt;/label>
  &lt;label>Best Time to Contact
    &lt;input name="fields[best-time-to-contact]" type="text" />
  &lt;/label>
  &lt;label>Email Address
    &lt;input name="fields[email-address]" type="text" />
  &lt;/label>
  &lt;label>Additional Comments
    &lt;textarea name="fields[additional-comments]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;label>Liquid Capital
    &lt;input name="fields[liquid-capital]" type="text" />
  &lt;/label>
  &lt;label>Time Frame
    &lt;input name="fields[time-frame]" type="text" />
  &lt;/label>
  &lt;label>Place where you prefer to open your new business
    &lt;input name="fields[place-where-you-prefer-to-open-your-new-business]" type="text" />
  &lt;/label>
  &lt;input name="action[save-prospect]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://imac.local/kf/success/" /></code></pre>
        <h3>Send Email Filter</h3>
        <p>The send email filter, upon the event successfully saving the entry, takes input from the form and send an email to the desired recipient. <b>This filter currently does not work with the "Allow Multiple" option.</b> The following are the recognised fields:</p>
        <pre class="XML"><code>send-email[from]
send-email[subject] // Optional
send-email[body]
send-email[recipient] // list of comma author usernames.</code></pre>
        <p>All of these fields can be set dynamically using the exact field name of another field in the form as shown below in the example form:</p>
        <pre class="XML"><code>&lt;form action="" method="post">
  &lt;fieldset>
    &lt;label>Name &lt;input type="text" name="fields[author]" value="" />&lt;/label>
    &lt;label>Email &lt;input type="text" name="fields[email]" value="" />&lt;/label>
    &lt;label>Message &lt;textarea name="fields[message]" rows="5" cols="21">&lt;/textarea>&lt;/label>
    &lt;input name="send-email[from]" value="fields[email]" type="hidden" />
    &lt;input name="send-email[subject]" value="You are being contacted" type="hidden" />
    &lt;input name="send-email[body]" value="fields[message]" type="hidden" />
    &lt;input name="send-email[recipient]" value="fred" type="hidden" />
    &lt;input id="submit" type="submit" name="action[save-contact-form]" value="Send" />
  &lt;/fieldset>
&lt;/form></code></pre>';
		}
		
		public function load(){			
			if(isset($_POST['action']['save-prospect'])) return $this->__trigger();
		}
		
		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}		

	}
