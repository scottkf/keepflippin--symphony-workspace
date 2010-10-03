<?php

	require_once(TOOLKIT . '/class.event.php');
	
	Class eventsave_report extends Event{
		
		const ROOTELEMENT = 'save-report';
		
		public $eParamFILTERS = array(
			'admin-only',
				'expect-multiple'
		);
			
		public static function about(){
			return array(
					 'name' => 'Save Report',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://keepflippin.com',
							'email' => 'scott.tesoriere@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2010-10-02T21:25:07+00:00',
					 'trigger-condition' => 'action[save-report]');	
		}

		public static function getSource(){
			return '30';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;save-report>
  &lt;entry index="0" result="success" type="create | edit">
    &lt;message>Entry [created | edited] successfully.&lt;/message>
  &lt;/entry>
&lt;/save-report></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned (<b>Notice that it is possible to get mixtures of success and failure messages when using the "Allow Multiple" option</b>):</p>
        <pre class="XML"><code>&lt;save-report>
  &lt;entry index="0" result="error">
    &lt;message>Entry encountered errors when saving.&lt;/message>
    &lt;field-name type="invalid | missing" />
  &lt;/entry>
  &lt;entry index="1" result="success" type="create | edit">
    &lt;message>Entry [created | edited] successfully.&lt;/message>
  &lt;/entry>
  ...
&lt;/save-report></code></pre>
        <p>The following is an example of what is returned if any filters fail:</p>
        <pre class="XML"><code>&lt;save-report result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient username was invalid&lt;/filter>
  ...
&lt;/save-report></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Data
    &lt;input name="fields[0][data]" type="text" />
  &lt;/label>
  &lt;input name="fields[0][member]" type="hidden" value="..." />
  &lt;input name="fields[0][activity]" type="hidden" value="..." />
  &lt;input name="fields[0][fitness-report]" type="hidden" value="..." />
  &lt;input name="action[save-report]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id[0]" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://keepflippin.com/success/" /></code></pre>';
		}
		
		public function load(){			
			if(isset($_POST['action']['save-report'])) return $this->__trigger();
		}
		
		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}		

	}

