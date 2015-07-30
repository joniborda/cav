<?php
App::uses('AppModel', 'Model');
/**
 * Vehiculo Model
 *
 * @property Movimiento $Movimiento
 */
class Vehiculo extends AppModel {


/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'descripcion';
	
/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
	);

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * hasMany associations
 *
 * @var array
 */
	public $hasMany = array(
		'Movimiento' => array(
			'className' => 'Movimiento',
			'foreignKey' => 'vehiculo_id',
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
		'id' => array('type' => 'expression', 'method' => 'searchId', 'field' => '"Vehiculo"."id"::text ILIKE ?', 'encode' => true),
		'patente' => array('type' => 'expression', 'method' => 'searchPatente', 'field' => '"Vehiculo"."patente"::text ILIKE ?', 'encode' => true),
		'color' => array('type' => 'expression', 'method' => 'searchColor', 'field' => '"Vehiculo"."color"::text ILIKE ?', 'encode' => true),
		'descripcion' => array('type' => 'expression', 'method' => 'searchDescripcion', 'field' => '"Vehiculo"."descripcion"::text ILIKE ?', 'encode' => true),
		'tipo_autorizacion' => array('type' => 'expression', 'method' => 'searchTipo_autorizacion', 'field' => '"Vehiculo"."tipo_autorizacion"::text ILIKE ?', 'encode' => true),
	);

	public function searchId($data = array()) {
		return '%' . $data['id'] . '%';
	}
	public function searchPatente($data = array()) {
		return '%' . $data['patente'] . '%';
	}
	public function searchColor($data = array()) {
		return '%' . $data['color'] . '%';
	}
	public function searchDescripcion($data = array()) {
		return '%' . $data['descripcion'] . '%';
	}
	public function searchTipo_autorizacion($data = array()) {
		return '%' . $data['tipo_autorizacion'] . '%';
	}
}