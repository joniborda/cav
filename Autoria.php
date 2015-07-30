<?php
App::uses('AppModel', 'Model');
/**
 * Autoria
 *
 * @property Hecho $Hecho
 */
class Autoria extends AppModel {

/**
 * Use table
 *
 * @var mixed False or table name
 */
	public $useTable = 'autoria';


/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'descripcion';
	

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * hasMany associations
 *
 * @var array
 */
	public $hasMany = array(
		'Hecho' => array(
			'className' => 'Hecho',
			'foreignKey' => 'autoria_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		)
	);



public $actsAs = array('Search.Searchable');

	/**
	 * Criteria for search
	 *
	 * @var string
	 */
	public $filterArgs = array(
		'id' => array('type' => 'expression', 'method' => 'searchId', 'field' => '"Autoria"."id"::text ILIKE ?', 'encode' => true),
		'descripcion' => array('type' => 'expression', 'method' => 'searchDescripcion', 'field' => '"Autoria"."descripcion"::text ILIKE ?', 'encode' => true),
	);

	public function searchId($data = array()) {
		return '%' . $data['id'] . '%';
	}
	public function searchDescripcion($data = array()) {
		return '%' . $data['descripcion'] . '%';
	}
}