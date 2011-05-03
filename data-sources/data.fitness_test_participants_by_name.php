<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcefitness_test_participants_by_name extends Datasource{
		
		public $dsParamROOTELEMENT = 'fitness-test-participants-by-name';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'system:id';
		public $dsParamSORT = 'name';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'179' => '{$fitness-name}',
				'185' => 'yes',
		);
		
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
					 'name' => 'Fitness test participants By name',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://keepflippin.com',
							'email' => 'scott.tesoriere@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2011-02-19T13:56:26+00:00');	
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

