<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceschedule extends Datasource{
		
		public $dsParamROOTELEMENT = 'schedule';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '9999';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'118' => '{$ds-session}',
				'98' => '153,157,160,161,162,163,164,165,956,1030,1036,2399',
				'109' => '{$ds-schedule-places-events}',
				'101' => '{$year:$this-year}-{$month:$this-month}-01 to {$year:$this-year}-{$month:$this-month}-31',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'class',
				'date'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-session', '$ds-schedule-places-events');
		}
		
		public function about(){
			return array(
					 'name' => 'Schedule',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://keepflippin.com',
							'email' => 'scott.tesoriere@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2011-01-04T23:12:18+00:00');	
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

