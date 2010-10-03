<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceshowteam_members extends Datasource{
		
		public $dsParamROOTELEMENT = 'showteam-members';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '1000';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'name';
		public $dsParamSTARTPAGE = '1';
		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'type'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Showteam Members',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://keepflippin.com',
							'email' => 'scott.tesoriere@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2010-10-02T00:20:07+00:00');	
		}
		
		public function getSource(){
			return '29';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

