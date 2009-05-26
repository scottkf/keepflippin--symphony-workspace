<?php

	require_once(TOOLKIT . '/class.event.php');
	
	Class eventduplicate_session extends Event{
		
		const ROOTELEMENT = 'duplicate-session';
		
		public $eParamFILTERS = array(
			'admin-only'
		);
			
		public static function about(){
			return array(
					 'name' => 'Duplicate Session',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://imac.local/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-26T13:36:09+00:00',
					 'trigger-condition' => 'action[duplicate-session]');	
		}

		public static function getSource(){
			return '22';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;duplicate-session result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/duplicate-session></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;duplicate-session result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/duplicate-session></code></pre>
        <p>The following is an example of what is returned if any filters fail:</p>
        <pre class="XML"><code>&lt;duplicate-session result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient username was invalid&lt;/filter>
  ...
&lt;/duplicate-session></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Name
    &lt;input name="fields[name]" type="text" />
  &lt;/label>
  &lt;input name="action[duplicate-session]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://imac.local/kf/success/" /></code></pre>';
		}
		
		public function load(){			
			if(isset($_POST['action']['duplicate-session'])) return $this->__trigger();
		}
		
		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}		

	}

