<?php
App::uses('AppModel', 'Model');
/**
 * Url Model
 *
 * @property Grupo $Grupo
 */
class Url extends AppModel {

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
		'Grupo' => array(
			'className' => 'Grupo',
			'joinTable' => 'grupos_urls',
			'foreignKey' => 'url_id',
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



public $actsAs = array('Search.Searchable');

	/**
	 * Criteria for search
	 *
	 * @var string
	 */
	public $filterArgs = array(
		'id' => array('type' => 'expression', 'method' => 'searchId', 'field' => '"Url"."id"::text ILIKE ?', 'encode' => true),
		'descripcion' => array('type' => 'expression', 'method' => 'searchDescripcion', 'field' => '"Url"."descripcion"::text ILIKE ?', 'encode' => true),
	);

	public function searchId($data = array()) {
		return '%' . $data['id'] . '%';
	}
	public function searchDescripcion($data = array()) {
		return '%' . $data['descripcion'] . '%';
	}
}