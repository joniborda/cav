<?php
App::uses('AppController', 'Controller');
/**
 * Vehiculos Controller
 *
 * @property Vehiculo $Vehiculo
 * @property PaginatorComponent $Paginator
 * @property Search.PrgComponent $Search.Prg
 */
class VehiculosController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Search.Prg');

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->Vehiculo->recursive = 0;
		$this->set('vehiculos', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->Vehiculo->exists($id)) {
			throw new NotFoundException(__('Invalid vehiculo'));
		}
		$options = array('conditions' => array('Vehiculo.' . $this->Vehiculo->primaryKey => $id));
		$this->set('vehiculo', $this->Vehiculo->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
 
public function admin_add() {
		if ($this->request->is('post')) {
			$this->Vehiculo->create();
			$this->request->data['Vehiculo']['usuario_id'] = $this->Auth->user('id');

			if (empty($this->request->data['Vehiculo']['patente'])) {
				$this->Session->setFlash(__('DEBE INGRESAR UNA PATENTE.'), 'flash/error');
				$this->cargar_modelos();
				return;
			}

			if ($this->Vehiculo->save($this->request->data)) {
				$this->Session->setFlash(__('El registro fue agregado correctamente.'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('No se pudo agregar el registro. Por favor, vuelva a intentarlo.'), 'flash/error');
			}
		}
		
		if (!empty($this->request->query)) {
			foreach ($this->request->query as $key => $value) {

				$this->request->data['Vehiculo'][$key] = $value;
			}
		}
		$this->cargar_modelos();
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->Vehiculo->id = $id;
		if (!$this->Vehiculo->exists($id)) {
			throw new NotFoundException(__('Invalid vehiculo'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Vehiculo->save($this->request->data)) {
				$this->Session->setFlash(__('El registro fue guardado correctamente.'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('No se pudo editar el registro. Por favor, vuelva a intentarlo.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Vehiculo.' . $this->Vehiculo->primaryKey => $id));
			$this->request->data = $this->Vehiculo->find('first', $options);
		}
					}

/**
 * admin_delete method
 *
 * @throws NotFoundException
 * @throws MethodNotAllowedException
 * @param string $id
 * @return void
 */
	public function admin_delete($id = null) {
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		$this->Vehiculo->id = $id;
		if (!$this->Vehiculo->exists()) {
			throw new NotFoundException(__('Invalid vehiculo'));
		}
		if ($this->Vehiculo->delete()) {
			$this->Session->setFlash(__('El registro fue borrado correctamente.'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('No se pudo borrar el registro'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}

	/**
	 * admin_find method
	 *
	 * @return void
	 */
	public function admin_find() {
		$this->Prg->commonProcess();
		$this->Paginator->settings['conditions'] = $this->Vehiculo->parseCriteria($this->Prg->parsedParams());
		$this->set('vehiculos', $this->Paginator->paginate());
		$this->render('admin_index');
	}

	/**
	 * Busca el vehiculo por la patente y tambien si el tipo de movimiento es pasado
	 * verifica sea el correcto para cargar
	 *
	*/
	public function admin_busqueda_patente($patente = null, $tipo_movimiento = null) {

		$this->layout = false;

		$ret = array('html' => '');

		if (!$patente) {
			$ret['response'] = false;
		}

		$vehiculo = $this->Vehiculo->find('first', 
			array(
				'conditions' => array(
					'UPPER(TRIM(patente))' => strtoupper(trim($patente))
				),
				'recursive' => -1
			)
		);

		if ($vehiculo) {
			$ret['response'] = true;
			$ret['data'] = $vehiculo['Vehiculo'];
			
			if ($tipo_movimiento !== null) {
				$ultimo_movimiento = $this->Vehiculo->Movimiento->find(
					'first',
					array(
						'conditions' => array(
							'vehiculo_id' => $vehiculo['Vehiculo']['id']
						),
						'order' => 'Movimiento.id desc',
						'fields' => 'tipo_movimiento',
						'recursive' => -1
					)
				);

				if ($ultimo_movimiento && $ultimo_movimiento['Movimiento']['tipo_movimiento'] == $tipo_movimiento) {
					$ret['response'] = false;
					$ret['message'] = $tipo_movimiento;
				}
			}
		}
		

		$this->set('response', $ret);
	}

	/**
	 * admin_add method
	 *
	 * @return void
	 */
	public function admin_add_ajax() {
		if ($this->request->is('post') && $this->request->is('ajax')) {

			$this->Vehiculo->create();
			
			if ($this->Vehiculo->save($this->request->data['vehiculo_add'])) {
				$ret = array(
					'response' => true,
					'message' => 'El vehículo fue guardado correctamente.',
					'id' => $this->Vehiculo->getLastInsertID()
				);
			} else {
				$ret = array(
					'response' => false,
					'message' => 'No se pudo agregar el vehículo. Por favor, vuelva a intentarlo.'
				);
			}

			echo json_encode($ret);
			die();
		}
	}

	public function cargar_modelos() {
		$this->set('tipoAutorizacions', 
			array(
				'INVITADO' => 'INVITADO',
				'AUTORIZADO' => 'AUTORIZADO',
				'PROVEEDOR' => 'PROVEEDOR'
			)
		);
	}
}
