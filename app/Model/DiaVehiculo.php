<?php
App::uses('AppModel', 'Model');
/**
 * TipoInstitucion Model
 *
 * @property DenunciaIntitucion $DenunciaIntitucion
 */
class DiaVehiculo extends AppModel {

	public $useTable = 'dias_vehiculos';
/**
 * Display field
 *
 * @var string
 * hasMany associations
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
		)
	);
}