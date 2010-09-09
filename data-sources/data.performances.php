<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceperformances extends Datasource{
		
		public $dsParamROOTELEMENT = 'performances';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '5';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'start-date';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'51' => 'later than {$today}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'start-date',
				'end-date',
				'location',
				'url',
				'description: formatted'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Performances',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://keepflippin.com',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-12-02T22:50:24+00:00');	
		}
		
		public function getSource(){
			return '8';
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

