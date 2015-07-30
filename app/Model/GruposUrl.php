<?php
App::uses('AppModel', 'Model');
/**
 * GruposUrl Model
 *
 * @property Grupo $Grupo
 * @property Url $Url
 */
class GruposUrl extends AppModel {

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
		'Grupo' => array(
			'className' => 'Grupo',
			'foreignKey' => 'grupo_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Url' => array(
			'className' => 'Url',
			'foreignKey' => 'url_id',
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
		'id' => array('type' => 'expression', 'method' => 'searchId', 'field' => '"GruposUrl"."id"::text ILIKE ?', 'encode' => true),
		'grupo_id' => array('type' => 'subquery', 'method' => 'searchGrupo_id', 'field' => '"GruposUrl"."grupo_id"', 'encode' => true),
		'url_id' => array('type' => 'subquery', 'method' => 'searchUrl_id', 'field' => '"GruposUrl"."url_id"', 'encode' => true),
	);

	public function searchId($data = array()) {
		return '%' . $data['id'] . '%';
	}
	public function searchGrupo_id($data = array()) {
		$query = $this->Grupo->getQuery('all', array(
			'conditions' => array(
				$this->Grupo->name . '.' . $this->Grupo->displayField . ' ilike ?' 
					=> '%'.$data['grupo_id'] .'%'
			),
			'fields' => array($this->Grupo->primaryKey)
		));
		return $query;
				return '%' . $data['grupo_id'] . '%';
	}
	public function searchUrl_id($data = array()) {
		$query = $this->Url->getQuery('all', array(
			'conditions' => array(
				$this->Url->name . '.' . $this->Url->displayField . ' ilike ?' 
					=> '%'.$data['url_id'] .'%'
			),
			'fields' => array($this->Url->primaryKey)
		));
		return $query;
				return '%' . $data['url_id'] . '%';
	}
}