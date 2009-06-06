<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcephotos_tags extends Datasource{
		
		public $dsParamROOTELEMENT = 'photos-tags';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '9';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamREQUIREDPARAM = '$tags';
		public $dsParamPARAMOUTPUT = 'system:id';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '{$page-number}';
		
		public $dsParamFILTERS = array(
				'74' => '{$tags}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'title',
				'short-description',
				'image',
				'tags'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Photos: tags',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://imac.local/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-06-05T20:00:57+00:00');	
		}
		
		public function getSource(){
			return '16';
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

