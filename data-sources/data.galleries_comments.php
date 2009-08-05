<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcegalleries_comments extends Datasource{
		
		public $dsParamROOTELEMENT = 'galleries-comments';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '9999';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'39' => '{$ds-galleries}, {$ds-photos-tags}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'image',
				'comment: formatted'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-galleries', '$ds-photos-tags');
		}
		
		public function about(){
			return array(
					 'name' => 'Galleries: comments',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://localhost/kf',
							'email' => 'scott@keepflippin.com'),
					 'version' => '1.0',
					 'release-date' => '2009-08-05T14:17:45+00:00');	
		}
		
		public function getSource(){
			return '9';
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

