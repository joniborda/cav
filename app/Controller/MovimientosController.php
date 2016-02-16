<?php
App::uses('AppController', 'Controller');
/**
 * Movimientos Controller
 *
 * @property Movimiento $Movimiento
 * @property PaginatorComponent $Paginator
 * @property Search.PrgComponent $Search.Prg
 */
class MovimientosController extends AppController {

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
		$this->Movimiento->recursive = 1;
		$this->set('movimientos', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->Movimiento->exists($id)) {
			throw new NotFoundException(__('Invalid movimiento'));
		}
		$options = array('conditions' => array('Movimiento.' . $this->Movimiento->primaryKey => $id));
		$this->set('movimiento', $this->Movimiento->find('first', $options));
	}

	/**
	 * admin_add method
	 *
	 * @return void
	 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$this->Movimiento->create();

			$this->request->data['Movimiento']['usuario_id'] = $this->Auth->user('id');
			$this->request->data['Movimiento']['tipo_movimiento'] = strtoupper($this->request->data['Movimiento']['tipo_movimiento']);

			$hoy = date('Y-m-d');

			if ($this->request->data['Movimiento']['tipo_movimiento'] === 'ENTRADA') {

				$vehiculo_autorizado = $this->Movimiento->Vehiculo->find('first', array(
					'conditions' => array(
						'Vehiculo.id' => $this->data['Movimiento']['vehiculo_id'],
						'desde <= ?' => $hoy,
						array(
							'OR' => array(
								'hasta >= ' => $hoy,
								'hasta is null'
							)
						)
					)
				));

				$vehiculo_dia_autorizado = false;
				if ($vehiculo_autorizado != null) {
					foreach ($vehiculo_autorizado['DiaVehiculo'] as $dato) {
						if ($dato['dia'] == date('N')) {
							$vehiculo_dia_autorizado = true;
							break;
						}
					}
				}

				if (is_numeric($this->request->data['Movimiento']['horario'])) {
					if ($this->request->data['Movimiento']['horario'] == 30) {
						$this->request->data['Movimiento']['horario'] = date("c", strtotime('+30 min'));
					} else {
						$this->request->data['Movimiento']['horario'] = date("c", strtotime('+' . $this->request->data['Movimiento']['horario'] . ' hour'));
					}
				} else {
					$this->request->data['Movimiento']['horario'] = null;
				}

				if ($vehiculo_dia_autorizado === true) {
					if ($this->Movimiento->save($this->request->data)) {

						$this->Session->setFlash(__('Entrada autorizada.'), 'flash/success');
						$this->redirect(array('action' => 'admin_add'));
					} else {

						$this->Session->setFlash(__('Error - El vehiculo no se guardo.'), 'flash/error');
						$this->redirect(array('action' => 'admin_add'));
					}
				} else {
					$this->Session->setFlash(__('El vehiculo no esta autorizado.'), 'flash/error');
					$this->redirect(array('action' => 'admin_add'));
				}
			} else {
				if ($this->Movimiento->save($this->request->data)) {

					$this->Session->setFlash(__('Salida autorizada.'), 'flash/success');
					$this->redirect(array('action' => 'admin_add'));
				} else {

					$this->Session->setFlash(__('Error - El vehiculo no se guardo.'), 'flash/error');
					$this->redirect(array('action' => 'admin_add'));
				}
			}				
		}

		$horarios = array(
			'30' => '30min'
		);

		for ($i=1; $i <= 24; $i++) { 
			$horarios[$i] = $i . ' hs';
		}

		$this->set('horarios', $horarios);
		
		if (!empty($this->request->query)) {
			foreach ($this->request->query as $key => $value) {
				$this->request->data['Movimiento'][$key] = $value;
			}
		}
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->Movimiento->id = $id;
		if (!$this->Movimiento->exists($id)) {
			throw new NotFoundException(__('Invalid movimiento'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Movimiento->save($this->request->data)) {
				$this->Session->setFlash(__('El registro fue guardado correctamente.'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('No se pudo editar el registro. Por favor, vuelva a intentarlo.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Movimiento.' . $this->Movimiento->primaryKey => $id));
			$this->request->data = $this->Movimiento->find('first', $options);
		}
		$vehiculos = $this->Movimiento->Vehiculo->find('list');
		$personas = $this->Movimiento->Persona->find('list');
		$usuarios = $this->Movimiento->Usuario->find('list');
		$this->set(compact('vehiculos', 'personas', 'usuarios'));
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
		$this->Movimiento->id = $id;
		if (!$this->Movimiento->exists()) {
			throw new NotFoundException(__('Invalid movimiento'));
		}
		if ($this->Movimiento->delete()) {
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
		$this->Paginator->settings['conditions'] = $this->Movimiento->parseCriteria($this->Prg->parsedParams());
		$this->set('movimientos', $this->Paginator->paginate());
		$this->render('admin_index');
	}

}
