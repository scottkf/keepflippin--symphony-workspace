<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcenavigation extends Datasource{
		
		public $dsParamROOTELEMENT = 'navigation';
		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Navigation',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://imac.local/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-06-07T15:47:09+00:00');	
		}
		
		public function getSource(){
			return 'static_xml';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				$xml = <<<XML
	<navigation>
	    <page handle="home">
	        <name>Home</name>
	        <types>
	            <type>hidden</type>
	            <type>index</type>
	        </types>
	    </page>
	    <page handle="news">
	        <name>News</name>
	        <types>
	            <type>hidden</type>
	        </types>
	    </page>
	    <page handle="drafts">
	        <name>Drafts</name>
	        <types>
	            <type>admin</type>
	        </types>
	    </page>
	  <page handle="classes">
	      <name>Classes</name>
	  </page>
	    <page handle="schedule">
	        <name>Schedule</name>
	        <page handle="places">
	            <name>By place</name>
	        </page>
	        <page handle="classes">
	            <name>By class</name>
	        </page>
	        <page handle="duplicate">
	            <name>Duplicate</name>
	            <types>
	                <type>admin</type>
	                <type>hidden</type>
	            </types>
	        </page>
	        <page handle="calendar">
	            <name>Calendar</name>
	            <types>
	                <type>hidden</type>
	            </types>
	        </page>
	    </page>
	    <page handle="locations">
	        <name>Places</name>
	        <types>
	            <type>hidden</type>
	        </types>
	    </page>
	    <page handle="franchising">
	        <name>Franchising</name>
	        <page handle="faq">
	            <name>Frequently Asked Questions</name>
	        </page>
	        <page handle="contact">
	            <name>Request Franchise Info</name>
	            <page handle="success">
	                <name>Success!</name>
	            </page>
	        </page>
	    </page>
	  <page handle="photos">
	      <name>Media</name>
	      <page handle="tags">
	          <name>Photos by tag</name>
	      </page>
	      <page handle="photo">
	          <name>Photo &amp; Comments</name>
	      </page>
	  </page>
	  <page handle="contact">
	      <name>Contact</name>
	      <page handle="directions">
	          <name>Directions</name>
	          <types>
	              <type>hidden</type>
	          </types>
	      </page>
	  </page>
	    <page handle="404-page-not-found">
	        <name>404: Page Not Found</name>
	        <types>
	            <type>404</type>
	            <type>hidden</type>
	        </types>
	    </page>
	    <page handle="rss">
	        <name>RSS</name>
	        <types>
	            <type>hidden</type>
	            <type>XML</type>
	        </types>
	    </page>
	    <page handle="maintenance">
	        <name>Maintenance</name>
	        <types>
	            <type>hidden</type>
	            <type>maintenance</type>
	        </types>
	    </page>
	    <page handle="about">
	        <name>About kf</name>
	        <types>
	            <type>hidden</type>
	        </types>
	    </page>
	</navigation>
XML;
			$result = self::CRLF . '	' . trim($xml) . self::CRLF;
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

