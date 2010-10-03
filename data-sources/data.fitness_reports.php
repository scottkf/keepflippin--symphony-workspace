<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcefitness_reports extends Datasource{
		
		public $dsParamROOTELEMENT = 'fitness-reports';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '1000';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'system:id';
		public $dsParamSORT = 'system:date';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'id' => '{$fitness-report-id}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'comments',
				'date'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Fitness Reports',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://keepflippin.com',
							'email' => 'scott.tesoriere@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2010-10-02T22:37:55+00:00');	
		}
		
		public function getSource(){
			return '31';
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

