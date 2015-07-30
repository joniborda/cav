<?php
App::uses('AppModel', 'Model');
/**
 * Grupo Model
 *
 * @property Url $Url
 */
class Grupo extends AppModel {
	
		public $useDbConfig = 'usuarios';
/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'descripcion';
	

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * hasAndBelongsToMany associations
 *
 * @var array
 */
	public $hasAndBelongsToMany = array(
		'Url' => array(
			'className' => 'Url',
			'joinTable' => 'grupos_urls',
			'foreignKey' => 'grupo_id',
			'associationForeignKey' => 'url_id',
			'unique' => 'keepExisting',
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'finderQuery' => '',
			'deleteQuery' => '',
			'insertQuery' => ''
		),
		'Usuario' => array(
			'className' => 'Usuario',
			'joinTable' => 'usuarios_grupos',
			'foreignKey' => 'grupo_id',
			'associationForeignKey' => 'usuario_id',
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



public $actsAs = array('Search.Searchable', 'Containable');

	/**
	 * Criteria for search
	 *
	 * @var string
	 */
	public $filterArgs = array(
		'id' => array('type' => 'expression', 'method' => 'searchId', 'field' => '"Grupo"."id"::text ILIKE ?', 'encode' => true),
		'descripcion' => array('type' => 'expression', 'method' => 'searchDescripcion', 'field' => '"Grupo"."descripcion"::text ILIKE ?', 'encode' => true),
	);

	public function searchId($data = array()) {
		return '%' . $data['id'] . '%';
	}
	public function searchDescripcion($data = array()) {
		return '%' . $data['descripcion'] . '%';
	}
}