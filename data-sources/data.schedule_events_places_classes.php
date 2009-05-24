<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceschedule_events_places_classes extends Datasource{
		
		public $dsParamROOTELEMENT = 'schedule-events-places-classes';
		public $dsParamORDER = 'asc';
		public $dsParamGROUP = '101';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamREQUIREDPARAM = '$places';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'109' => '{$ds-schedule-places-events}',
				'101' => '{$year:$this-year}-{$month:$this-month}-01 to {$year:$this-year}-{$month:$this-month}-31',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'description',
				'session',
				'class',
				'place'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-schedule-places-events');
		}
		
		public function about(){
			return array(
					 'name' => 'Schedule: Events Places Classes',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://imac.local/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-23T23:55:25+00:00');	
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

