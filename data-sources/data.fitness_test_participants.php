<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcefitness_test_participants extends Datasource{

		public $dsParamROOTELEMENT = 'fitness-test-participants';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1000';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'name';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

		public $dsParamFILTERS = array(
				'185' => 'yes',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'type',
				'fitness-participant',
				'current-member'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Fitness test participants',
				'author' => array(
					'name' => 'scott tesoriere',
					'website' => 'http://keepflippin.com',
					'email' => 'scott.tesoriere@gmail.com'),
				'version' => '1.0',
				'release-date' => '2011-05-07T13:01:59+00:00'
			);
		}

		public function getSource(){
			return '29';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
