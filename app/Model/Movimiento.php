<?php
App::uses('AppModel', 'Model');
/**
 * Movimiento Model
 *
 * @property Vehiculo $Vehiculo
 * @property Persona $Persona
 * @property Usuario $Usuario
 */
class Movimiento extends AppModel {


/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'id';
	

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'Vehiculo' => array(
			'className' => 'Vehiculo',
			'foreignKey' => 'vehiculo_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Persona' => array(
			'className' => 'Persona',
			'foreignKey' => 'persona_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Usuario' => array(
			'className' => 'Usuario',
			'foreignKey' => 'usuario_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);


public $actsAs = array('Search.Searchable');

	/**
	 * Criteria for search
	 *
	 * @var string
	 */
	public $filterArgs = array(
		'id' => array('type' => 'expression', 'method' => 'searchId', 'field' => '"Movimiento"."id"::text ILIKE ?', 'encode' => true),
		'vehiculo_id' => array('type' => 'subquery', 'method' => 'searchVehiculo_id', 'field' => '"Movimiento"."vehiculo_id"', 'encode' => true),
		'persona_id' => array('type' => 'subquery', 'method' => 'searchPersona_id', 'field' => '"Movimiento"."persona_id"', 'encode' => true),
		'tipo_movimiento' => array('type' => 'expression', 'method' => 'searchTipo_movimiento', 'field' => '"Movimiento"."tipo_movimiento"::text ILIKE ?', 'encode' => true),
		'sector' => array('type' => 'expression', 'method' => 'searchSector', 'field' => '"Movimiento"."sector"::text ILIKE ?', 'encode' => true),
		'interno' => array('type' => 'expression', 'method' => 'searchInterno', 'field' => '"Movimiento"."interno"::text ILIKE ?', 'encode' => true),
		'fecha_carga' => array('type' => 'expression', 'method' => 'searchFecha_carga', 'field' => '"Movimiento"."fecha_carga"::text ILIKE ?', 'encode' => true),
		'usuario_id' => array('type' => 'subquery', 'method' => 'searchUsuario_id', 'field' => '"Movimiento"."usuario_id"', 'encode' => true),
	);

	public function searchId($data = array()) {
		return '%' . $data['id'] . '%';
	}
	public function searchVehiculo_id($data = array()) {
		$query = $this->Vehiculo->getQuery('all', array(
			'conditions' => array(
				$this->Vehiculo->name . '.' . $this->Vehiculo->displayField . ' ilike ?' 
					=> '%'.$data['vehiculo_id'] .'%'
			),
			'fields' => array($this->Vehiculo->primaryKey)
		));
		return $query;
				return '%' . $data['vehiculo_id'] . '%';
	}
	public function searchPersona_id($data = array()) {
		$query = $this->Persona->getQuery('all', array(
			'conditions' => array(
				$this->Persona->name . '.' . $this->Persona->displayField . ' ilike ?' 
					=> '%'.$data['persona_id'] .'%'
			),
			'fields' => array($this->Persona->primaryKey)
		));
		return $query;
				return '%' . $data['persona_id'] . '%';
	}
	public function searchTipo_movimiento($data = array()) {
		return '%' . $data['tipo_movimiento'] . '%';
	}
	public function searchSector($data = array()) {
		return '%' . $data['sector'] . '%';
	}
	public function searchInterno($data = array()) {
		return '%' . $data['interno'] . '%';
	}
	public function searchFecha_carga($data = array()) {
$fecha = DateTime::createFromFormat('d/m/Y',$data['fecha_carga']);
		if ($fecha) {
			return $fecha->format('Y-m-d');
		}
		return '%' . $data['fecha_carga'] . '%';
	}
	public function searchUsuario_id($data = array()) {
		$query = $this->Usuario->getQuery('all', array(
			'conditions' => array(
				$this->Usuario->name . '.' . $this->Usuario->displayField . ' ilike ?' 
					=> '%'.$data['usuario_id'] .'%'
			),
			'fields' => array($this->Usuario->primaryKey)
		));
		return $query;
				return '%' . $data['usuario_id'] . '%';
	}
}