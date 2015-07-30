<?php
App::uses('AppModel', 'Model');
/**
 * UsuariosGrupo Model
 *
 * @property Usuario $Usuario
 * @property Grupo $Grupo
 */
class UsuariosGrupo extends AppModel {

	public $useDbConfig = 'usuarios';
/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'usuario_id';


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
		),
		'Grupo' => array(
			'className' => 'Grupo',
			'foreignKey' => 'grupo_id',
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
			'id' => array('type' => 'expression', 'method' => 'searchId', 'field' => '"UsuariosGrupo"."id"::text ILIKE ?', 'encode' => true),
			'usuario_id' => array('type' => 'expression', 'method' => 'searchUsuario_id', 'field' => '"UsuariosGrupo"."usuario_id"::text ILIKE ?', 'encode' => true),
			'grupo_id' => array('type' => 'expression', 'method' => 'searchGrupo_id', 'field' => '"UsuariosGrupo"."grupo_id"::text ILIKE ?', 'encode' => true),
		);

	public function searchId($data = array()) {
		return '%' . $data['id'] . '%';
}
	public function searchUsuario_id($data = array()) {
		return '%' . $data['usuario_id'] . '%';
}
	public function searchGrupo_id($data = array()) {
		return '%' . $data['grupo_id'] . '%';
}
}
