<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceduplicate_event extends Datasource{
		
		public $dsParamROOTELEMENT = 'duplicate-event';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'118' => '{$ds-duplicate-session}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'description',
				'session',
				'class',
				'place',
				'date'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-duplicate-session');
		}
		
		public function about(){
			return array(
					 'name' => 'Duplicate Event',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://imac.local/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-26T15:09:45+00:00');	
		}
		
		public function getSource(){
			return '20';
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

