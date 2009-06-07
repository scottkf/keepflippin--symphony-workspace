<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceclasses extends Datasource{
		
		public $dsParamROOTELEMENT = 'classes';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '99';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamSORT = 'sort-order';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'id' => '{$ds-events-list}',
				'90' => '{$class}',
				'154' => 'no',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'class-name',
				'ages',
				'short-description',
				'description',
				'image',
				'hidden'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-events-list');
		}
		
		public function about(){
			return array(
					 'name' => 'Classes',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://imac.local/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-06-07T17:44:42+00:00');	
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

