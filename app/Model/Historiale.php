<?php
App::uses('AppModel', 'Model');
/**
 * Historiale Model
 *
 * @property Usuario $Usuario
 */
class Historiale extends AppModel {

	public $order = 'id desc';

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
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
			'id' => array('type' => 'expression', 'method' => 'searchId', 'field' => '"Historiale"."id"::text ILIKE ?', 'encode' => true),
			'usuario_id' => array('type' => 'expression', 'method' => 'searchUsuario_id', 'field' => '"Historiale"."usuario_id"::text ILIKE ?', 'encode' => true),
			'url' => array('type' => 'expression', 'method' => 'searchUrl', 'field' => '"Historiale"."url"::text ILIKE ?', 'encode' => true),
			'parametros' => array('type' => 'expression', 'method' => 'searchParametros', 'field' => '"Historiale"."parametros"::text ILIKE ?', 'encode' => true),
			'navegador' => array('type' => 'expression', 'method' => 'searchNavegador', 'field' => '"Historiale"."navegador"::text ILIKE ?', 'encode' => true),
			'ip' => array('type' => 'expression', 'method' => 'searchIp', 'field' => '"Historiale"."ip"::text ILIKE ?', 'encode' => true),
			'fecha' => array('type' => 'expression', 'method' => 'searchFecha', 'field' => '"Historiale"."fecha"::text ILIKE ?', 'encode' => true),
		);

	public function searchId($data = array()) {
			return '%' . $data['id'] . '%';
}
	public function searchUsuario_id($data = array()) {
			return '%' . $data['usuario_id'] . '%';
}
	public function searchUrl($data = array()) {
			return '%' . $data['url'] . '%';
}
	public function searchParametros($data = array()) {
			return '%' . $data['parametros'] . '%';
}
	public function searchNavegador($data = array()) {
			return '%' . $data['navegador'] . '%';
}
	public function searchIp($data = array()) {
			return '%' . $data['ip'] . '%';
}
	public function searchFecha($data = array()) {
			$fecha = DateTime::createFromFormat('d/m/Y',$data['fecha']);
		if ($fecha) {
			return $fecha->format('Y-m-d');
		}
			return '%' . $data['fecha'] . '%';
}
}
