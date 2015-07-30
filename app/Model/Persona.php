<?php
App::uses('AppModel', 'Model');
/**
 * Persona Model
 *
 * @property Movimiento $Movimiento
 */
class Persona extends AppModel {


/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'nombre';
	

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * hasMany associations
 *
 * @var array
 */
	public $hasMany = array(
		'Movimiento' => array(
			'className' => 'Movimiento',
			'foreignKey' => 'persona_id',
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
		'id' => array('type' => 'expression', 'method' => 'searchId', 'field' => '"Persona"."id"::text ILIKE ?', 'encode' => true),
		'nombre' => array('type' => 'expression', 'method' => 'searchNombre', 'field' => '"Persona"."nombre"::text ILIKE ?', 'encode' => true),
		'apellido' => array('type' => 'expression', 'method' => 'searchApellido', 'field' => '"Persona"."apellido"::text ILIKE ?', 'encode' => true),
		'numero_documento' => array('type' => 'expression', 'method' => 'searchNumero_documento', 'field' => '"Persona"."numero_documento"::text ILIKE ?', 'encode' => true),
		'telefono' => array('type' => 'expression', 'method' => 'searchTelefono', 'field' => '"Persona"."telefono"::text ILIKE ?', 'encode' => true),
	);

	public function searchId($data = array()) {
		return '%' . $data['id'] . '%';
	}
	public function searchNombre($data = array()) {
		return '%' . $data['nombre'] . '%';
	}
	public function searchApellido($data = array()) {
		return '%' . $data['apellido'] . '%';
	}
	public function searchNumero_documento($data = array()) {
		return '%' . $data['numero_documento'] . '%';
	}
	public function searchTelefono($data = array()) {
		return '%' . $data['telefono'] . '%';
	}
}