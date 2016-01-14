<?php
App::uses('AppModel', 'Model');
/**
 * TipoVehiculo Model
 *
 * @property Vehiculo $Vehiculo
 */
class TipoVehiculo extends AppModel {


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
		'Vehiculo' => array(
			'className' => 'Vehiculo',
			'foreignKey' => 'tipo_vehiculo_id',
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
		'id' => array('type' => 'expression', 'method' => 'searchId', 'field' => '"TipoVehiculo"."id"::text ILIKE ?', 'encode' => true),
		'descripcion' => array('type' => 'expression', 'method' => 'searchDescripcion', 'field' => '"TipoVehiculo"."descripcion"::text ILIKE ?', 'encode' => true),
	);

	public function searchId($data = array()) {
		return '%' . $data['id'] . '%';
	}
	public function searchDescripcion($data = array()) {
		return '%' . $data['descripcion'] . '%';
	}
}