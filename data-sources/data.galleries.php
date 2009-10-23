<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcegalleries extends Datasource{
		
		public $dsParamROOTELEMENT = 'galleries';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '99';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamPARAMOUTPUT = 'images';
		public $dsParamSORT = 'system:date';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'128' => '{$gallery}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'short-description',
				'tags',
				'images',
				'key-photo'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Galleries',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://www.keepflippin.com',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-10-14T13:44:46+00:00');	
		}
		
		public function getSource(){
			return '23';
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

