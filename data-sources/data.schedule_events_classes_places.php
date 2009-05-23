<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceschedule_events_classes_places extends Datasource{
		
		public $dsParamROOTELEMENT = 'schedule-events-classes-places';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '99';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamREQUIREDPARAM = '$classes';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'109' => '{$ds-schedule-places-events}',
				'101' => '{$year:2009}-{$month:$this-month}-01 to {$year:2009}-{$month:$this-month}-31',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'description',
				'class',
				'place',
				'date'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-schedule-places-events');
		}
		
		public function about(){
			return array(
					 'name' => 'Schedule: Events Classes Places',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://imac.local/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-23T00:43:21+00:00');	
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

