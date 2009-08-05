<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcerss_articles extends Datasource{
		
		public $dsParamROOTELEMENT = 'rss-articles';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		public $dsParamHTMLENCODE = 'yes';
		
		public $dsParamFILTERS = array(
				'30' => 'yes',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'body: formatted'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'RSS Articles',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://localhost/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-08-05T14:18:51+00:00');	
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

