<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcefrontpage_news_items extends Datasource{
		
		public $dsParamROOTELEMENT = 'frontpage-news-items';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '3';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'publish-this-article-on';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'30' => 'yes',
				'79' => 'no',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'body: formatted',
				'publish-this-article-on'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Frontpage News Items',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://localhost/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-08-05T14:17:12+00:00');	
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

