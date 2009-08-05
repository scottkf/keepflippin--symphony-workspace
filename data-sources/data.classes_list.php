<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceclasses_list extends Datasource{
		
		public $dsParamROOTELEMENT = 'classes-list';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'id' => '{$ds-events-list}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'class-name',
				'ages',
				'short-description: formatted',
				'description: formatted'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-events-list');
		}
		
		public function about(){
			return array(
					 'name' => 'Classes list',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://localhost/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-08-05T14:15:31+00:00');	
		}
		
		public function getSource(){
			return '19';
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

