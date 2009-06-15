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
							'website' => 'http://imac.local/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-06-10T01:26:49+00:00');	
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
			<showteam>
			<person handle="team">Alicia</person>
			<person handle="team">Brittany</person>
			<person handle="team">Haley</person>
			<person handle="team">Collin</person>
			<person handle="team">Megan</person>
			<person handle="team">Amber</person>
			<person handle="team">Morgane</person>
			<person handle="team">BJ</person>
			<person handle="team">Alexis</person>
			<person handle="team">Julia</person>
			<person handle="preteam">Lexi</person>
			<person handle="preteam">Brooke</person>
			<person handle="preteam">Rachel</person>
			<person handle="preteam">Hannah</person>
			<person handle="preteam">Ryan</person>
			</showteam>
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

