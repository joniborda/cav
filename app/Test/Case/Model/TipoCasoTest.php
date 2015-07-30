<?php
App::uses('TipoCaso', 'Model');

/**
 * TipoCaso Test Case
 *
 */
class TipoCasoTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.tipo_caso',
		'app.caso',
		'app.carpeta_administrativa',
		'app.competencia',
		'app.autoridad',
		'app.tipo_vinculo',
		'app.carpetas_administrativas_relacionada',
		'app.carpeta',
		'app.carpeta_relacionada',
		'app.casos_datos_paralizacione',
		'app.referencia_informacion_recepcionada',
		'app.provincia',
		'app.region',
		'app.localidade',
		'app.nna',
		'app.tipo_documento',
		'app.pais',
		'app.localidad',
		'app.pais_residencia',
		'app.provincia_residencia',
		'app.localidad_residencia',
		'app.sexo',
		'app.contextrura',
		'app.color_piel',
		'app.color_cabello',
		'app.tipo_cabello',
		'app.color_ojo',
		'app.carpetas_administrativa',
		'app.ubicaciones_interna',
		'app.carpetas_administrativas_ubicaciones_interna',
		'app.enfermedade',
		'app.nna_enfermedade',
		'app.casos_datos_extravio',
		'app.autoridade',
		'app.estado',
		'app.casos_estado',
		'app.casos_autoridade',
		'app.referencia_informacion_recepcionada_valore'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->TipoCaso = ClassRegistry::init('TipoCaso');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->TipoCaso);

		parent::tearDown();
	}

}
