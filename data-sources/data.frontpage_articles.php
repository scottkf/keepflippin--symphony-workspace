<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcefrontpage_articles extends Datasource{
		
		public $dsParamROOTELEMENT = 'frontpage-articles';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '99';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'system:id';
		public $dsParamSORT = 'important';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'30' => 'yes',
				'29' => '2007-01-21 to {$today}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'body',
				'publish-this-article-on',
				'important',
				'alternate-link'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Frontpage Articles',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://imac.local/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-06-07T23:39:48+00:00');	
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

