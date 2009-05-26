<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceschedule extends Datasource{
		
		public $dsParamROOTELEMENT = 'schedule';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '99';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'101' => '{$year:$this-year}-{$month:$this-month}-01 to {$year:$this-year}-{$month:$this-month}-31',
				'118' => '{$ds-session}',
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
			$this->_dependencies = array('$ds-session');
		}
		
		public function about(){
			return array(
					 'name' => 'Schedule',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://imac.local/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-25T15:07:36+00:00');	
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

