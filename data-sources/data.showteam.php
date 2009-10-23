<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceshowteam extends Datasource{
		
		public $dsParamROOTELEMENT = 'showteam';
		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Showteam',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://www.keepflippin.com',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-10-14T21:12:07+00:00');	
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
				$result = "<showteam>
				<person handle=\"team\">Alicia</person>
				<person handle=\"team\">Brittany</person>
				<person handle=\"team\">Lyara</person>
				<person handle=\"team\">Haley</person>
				<person handle=\"team\">Collin</person>
				<person handle=\"team\">Amber</person>
				<person handle=\"team\">Morgane</person>
				<person handle=\"team\">BJ</person>
				<person handle=\"team\">Alexis</person>
				<person handle=\"team\">Ryan</person>
				<person handle=\"team\">Julia</person>
				<person handle=\"preteam\">Lexi</person>
				<person handle=\"preteam\">Brooke</person>
				<person handle=\"preteam\">Rachel</person>
				<person handle=\"preteam\">Hannah</person>
				<person handle=\"preteam\">Ryan</person>
				</showteam>";
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

