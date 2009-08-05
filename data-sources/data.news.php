<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcenews extends Datasource{
		
		public $dsParamROOTELEMENT = 'news';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '99';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamPARAMOUTPUT = 'system:id';
		public $dsParamSORT = 'publish-this-article-on';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'26' => '{$entry}',
				'29' => '{$year}',
				'30' => 'yes',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'body: formatted',
				'publish-this-article-on',
				'comments-allowed',
				'alternate-link'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'News',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://localhost/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-08-05T14:17:56+00:00');	
		}
		
		public function getSource(){
			return '6';
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

