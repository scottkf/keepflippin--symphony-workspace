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
							'email' => 'scott.tesoriere@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2010-07-07T21:13:54+00:00');	
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
				<person handle=\"team\">Kacie</person>
				<person handle=\"team\">Lyara</person>
				<person handle=\"team\">Morgane</person>
				<person handle=\"team\">BJ</person>
				<person handle=\"team\">Ryan</person>
				<person handle=\"team\">Lexie</person>
				<person handle=\"team\">Brooke</person>
				<person handle=\"team\">Rachel</person>
				<person handle=\"team\">Hannah</person>
				<person handle=\"preteam\">Maya</person>
				<person handle=\"preteam\">Danielle</person>
				<person handle=\"preteam\">Macayla</person>
				<person handle=\"preteam\">Hallie</person>
				<person handle=\"preteam\">Gabrielle</person>
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

