<?php
App::uses('AppModel', 'Model');
/**
 * Usuario Model
 *
 * @property Grupo $Grupo
 */
class Usuario extends AppModel {

	public $useTable = 'usuarios';
	/**
	 * Use database config
	 *
	 * @var string
	 */
	public $useDbConfig = 'usuarios';

	public $primaryKey = 'id';
	
/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'usuario_login';


	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * hasAndBelongsToMany associations
 *
 * @var array
 */
	public $hasAndBelongsToMany = array(
		'Grupo' => array(
			'className' => 'Grupo',
			'joinTable' => 'usuarios_grupos',
			'foreignKey' => 'usuario_id',
			'associationForeignKey' => 'grupo_id',
			'unique' => 'keepExisting',
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'finderQuery' => '',
			'deleteQuery' => '',
			'insertQuery' => ''
		)
	);

	/**
	 * hasMany associations
	 *
	 * @var array
	 */
/**	public $hasMany = array(
			'CarpetasAdministrativasDerivacione' => array(
					'className' => 'CarpetasAdministrativasDerivacione',
					'foreignKey' => 'usuario_id',
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
*/
public $actsAs = array('Search.Searchable', 'Containable');

	/**
	 * Criteria for search
	 *
	 * @var string
	 */
	public $filterArgs = array(
			'id' => array('type' => 'expression', 'method' => 'searchId', 'field' => '"Usuario"."id"::text ILIKE ?', 'encode' => true),
				'nombre_completo' => array('type' => 'expression', 'method' => 'searchNombre_completo', 'field' => '"Usuario"."nombre_completo"::text ILIKE ?', 'encode' => true),
				'password' => array('type' => 'expression', 'method' => 'searchPassword', 'field' => '"Usuario"."password"::text ILIKE ?', 'encode' => true),
				'usuario_login' => array('type' => 'expression', 'method' => 'searchUsuario_login', 'field' => '"Usuario"."usuario_login"::text ILIKE ?', 'encode' => true),
				'borrado' => array('type' => 'value', 'encode' => true),
				'id_anterior' => array('type' => 'expression', 'method' => 'searchId_anterior', 'field' => '"Usuario"."id_anterior"::text ILIKE ?', 'encode' => true),
				'modified' => array('type' => 'expression', 'method' => 'searchModified', 'field' => '"Usuario"."modified"::text ILIKE ?', 'encode' => true),
				'created' => array('type' => 'expression', 'method' => 'searchCreated', 'field' => '"Usuario"."created"::text ILIKE ?', 'encode' => true),
				'apellido' => array('type' => 'expression', 'method' => 'searchApellido', 'field' => '"Usuario"."apellido"::text ILIKE ?', 'encode' => true),
		);

	public function searchId($data = array()) {
			return '%' . $data['id'] . '%';
}
	public function searchNombre_completo($data = array()) {
			return '%' . $data['nombre_completo'] . '%';
}
	public function searchPassword($data = array()) {
			return '%' . $data['password'] . '%';
}
	public function searchUsuario_login($data = array()) {
			return '%' . $data['usuario_login'] . '%';
}
	public function searchBorrado($data = array()) {
			return '%' . $data['borrado'] . '%';
}
	public function searchId_anterior($data = array()) {
			return '%' . $data['id_anterior'] . '%';
}
	public function searchModified($data = array()) {
			$fecha = DateTime::createFromFormat('d/m/Y',$data['modified']);
		if ($fecha) {
			return $fecha->format('Y-m-d');
		}
			return '%' . $data['modified'] . '%';
}
	public function searchCreated($data = array()) {
			$fecha = DateTime::createFromFormat('d/m/Y',$data['created']);
		if ($fecha) {
			return $fecha->format('Y-m-d');
		}
			return '%' . $data['created'] . '%';
}
	public function searchApellido($data = array()) {
			return '%' . $data['apellido'] . '%';
}

public function beforeSave($options = array()) {
	if (isset($this->data[$this->alias]['password'])) {
		$this->data[$this->alias]['password'] = AuthComponent::password($this->data[$this->alias]['password']);
	}
	return true;
}

	public function getUsuarioLoginById($id, $model = 'Usuario') {
		$ret = $this->find(
			'first', 
			array(
				'conditions' => array(
					$model . '.id' => $id
				),
				'recursive' => -1,
				'fields' => 'usuario_login'
			)
		);
		
		if ($ret) {
			return $ret[$model]['usuario_login'];
		}
	}

	public function getNombreCompletoById($id, $model = 'Usuario') {
		
		$ret = $this->find(
			'first',
			array(
				'conditions' => array(
						$model . '.id' => $id
				),
				'recursive' => -1,
				'fields' => 'nombre_completo'
			)
		);
		if ($ret) {
			return $ret[$model]['nombre_completo'];
		}
	}
	
	public function getAllByGroup($grupo = null) {
		if (!is_string($grupo)) {
			return;
		}
		
		return $this->find('list', array(
			'joins' => array(
				array(
					'table' => 'femicidio.usuarios_grupos',
					'alias' => 'UsuarioGrupo',
					'type' => 'INNER',
					'conditions' => array(
						'UsuarioGrupo.usuario_id = Usuario.id'
					)
				),
				array(
					'table' => 'femicidio.grupos',
					'alias' => 'Grupo',
					'type' => 'INNER',
					'conditions' => array(
						'Grupo.id = UsuarioGrupo.grupo_id'
					)
				),
					
			),
			'conditions' => array(
				'Grupo.descripcion' => $grupo
			),
			'fields' => array('Usuario.id', 'Usuario.nombre_completo'),
			'order' => 'Usuario.nombre_completo asc nulls first'
		));
	}
}
