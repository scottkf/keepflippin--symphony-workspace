<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceschedule_events_classes_places extends Datasource{
		
		public $dsParamROOTELEMENT = 'schedule-events-classes-places';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '9999';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$classes';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'118' => '{$ds-session}',
				'98' => '{$ds-schedule-classes-events}',
				'109' => '{$ds-schedule-places-events}',
				'101' => '{$year:2009}-{$month:$this-month}-01 to {$year:2009}-{$month:$this-month}-31',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'description: formatted',
				'session',
				'class',
				'place',
				'date'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-session', '$ds-schedule-classes-events', '$ds-schedule-places-events');
		}
		
		public function about(){
			return array(
					 'name' => 'Schedule: Events Classes Places',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://localhost/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-08-05T14:19:56+00:00');	
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

