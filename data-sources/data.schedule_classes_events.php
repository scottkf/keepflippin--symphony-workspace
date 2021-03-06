<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceschedule_classes_events extends Datasource{
		
		public $dsParamROOTELEMENT = 'schedule-classes-events';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '99';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$classes';
		public $dsParamPARAMOUTPUT = 'system:id';
		public $dsParamSORT = 'class-name';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'90' => '{$classes}',
		);
		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Schedule: Classes Events',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://imac.local/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-06-17T14:39:26+00:00');	
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

