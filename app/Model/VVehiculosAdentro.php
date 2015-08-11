<?php
App::uses('AppModel', 'Model');
/**
 * VVehiculosAdentro Model
 *
 * @property Vehiculo $Vehiculo
 * @property Movimiento $Movimiento
 * @property Persona $Persona
 * @property Usuario $Usuario
 */
class VVehiculosAdentro extends AppModel {

/**
 * Use table
 *
 * @var mixed False or table name
 */
	public $useTable = 'v_vehiculos_adentro';

/**
 * Primary key field
 *
 * @var string
 */
	public $primaryKey = 'movimiento_id';


/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'patente';
	

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
		'Movimiento' => array(
			'className' => 'Movimiento',
			'foreignKey' => 'movimiento_id',
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
		'vehiculo_id' => array('type' => 'subquery', 'method' => 'searchVehiculo_id', 'field' => '"VVehiculosAdentro"."vehiculo_id"', 'encode' => true),
		'patente' => array('type' => 'expression', 'method' => 'searchPatente', 'field' => '"VVehiculosAdentro"."patente"::text ILIKE ?', 'encode' => true),
		'tipo_autorizacion' => array('type' => 'expression', 'method' => 'searchTipo_autorizacion', 'field' => '"VVehiculosAdentro"."tipo_autorizacion"::text ILIKE ?', 'encode' => true),
		'movimiento_id' => array('type' => 'subquery', 'method' => 'searchMovimiento_id', 'field' => '"VVehiculosAdentro"."movimiento_id"', 'encode' => true),
		'persona_id' => array('type' => 'subquery', 'method' => 'searchPersona_id', 'field' => '"VVehiculosAdentro"."persona_id"', 'encode' => true),
		'sector' => array('type' => 'expression', 'method' => 'searchSector', 'field' => '"VVehiculosAdentro"."sector"::text ILIKE ?', 'encode' => true),
		'interno' => array('type' => 'expression', 'method' => 'searchInterno', 'field' => '"VVehiculosAdentro"."interno"::text ILIKE ?', 'encode' => true),
		'fecha_carga' => array('type' => 'expression', 'method' => 'searchFecha_carga', 'field' => '"VVehiculosAdentro"."fecha_carga"::text ILIKE ?', 'encode' => true),
		'usuario_id' => array('type' => 'subquery', 'method' => 'searchUsuario_id', 'field' => '"VVehiculosAdentro"."usuario_id"', 'encode' => true),
	);

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
	public function searchPatente($data = array()) {
		return '%' . $data['patente'] . '%';
	}
	public function searchTipo_autorizacion($data = array()) {
		return '%' . $data['tipo_autorizacion'] . '%';
	}
	public function searchMovimiento_id($data = array()) {
		$query = $this->Movimiento->getQuery('all', array(
			'conditions' => array(
				$this->Movimiento->name . '.' . $this->Movimiento->displayField . ' ilike ?' 
					=> '%'.$data['movimiento_id'] .'%'
			),
			'fields' => array($this->Movimiento->primaryKey)
		));
		return $query;
				return '%' . $data['movimiento_id'] . '%';
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