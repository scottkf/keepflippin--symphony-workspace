<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcearticle_images extends Datasource{
		
		public $dsParamROOTELEMENT = 'article-images';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '4';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'45' => '{$ds-frontpage-articles:$ds-news:$ds-drafts}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'image',
				'article',
				'description: formatted'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-frontpage-articles', '$ds-news', '$ds-drafts');
		}
		
		public function about(){
			return array(
					 'name' => 'Article Images',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://keepflippin.com',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2010-02-19T19:43:22+00:00');	
		}
		
		public function getSource(){
			return '10';
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

