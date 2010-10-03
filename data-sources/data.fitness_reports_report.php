<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcefitness_reports_report extends Datasource{
		
		public $dsParamROOTELEMENT = 'fitness-reports-report';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '100000';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'191' => '{$ds-fitness-reports}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'data',
				'member',
				'activity',
				'fitness-report'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-fitness-reports');
		}
		
		public function about(){
			return array(
					 'name' => 'Fitness Reports: Report',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://keepflippin.com',
							'email' => 'scott.tesoriere@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2010-10-02T22:40:15+00:00');	
		}
		
		public function getSource(){
			return '30';
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

