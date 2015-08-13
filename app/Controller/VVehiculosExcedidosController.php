<?php
App::uses('AppController', 'Controller');
/**
 * VVehiculosExcedidos Controller
 *
 * @property VVehiculosExcedido $VVehiculosExcedido
 * @property PaginatorComponent $Paginator
 * @property Search.PrgComponent $Search.Prg
 */
class VVehiculosExcedidosController extends AppController {

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
		$this->VVehiculosExcedido->recursive = 0;
		$this->set('vVehiculosExcedidos', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->VVehiculosExcedido->exists($id)) {
			throw new NotFoundException(__('Invalid v vehiculos excedido'));
		}
		$options = array('conditions' => array('VVehiculosExcedido.' . $this->VVehiculosExcedido->primaryKey => $id));
		$this->set('vVehiculosExcedido', $this->VVehiculosExcedido->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
 
public function admin_add($persona_id) {
		if ($this->request->is('post')) {
			$this->VVehiculosExcedido->create();
			$this->request->data['VVehiculosExcedido']['usuario_id'] = $this->Auth->user('id');
			if ($this->VVehiculosExcedido->save($this->request->data)) {
				$this->Session->setFlash(__('El registro fue agregado correctamente.'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('No se pudo agregar el registro. Por favor, vuelva a intentarlo.'), 'flash/error');
			}
		}
		
		if ($persona_id == null) {
	 		$this->Session->setFlash(__('Error al agregar.'), 'flash/error');
	 		$this->redirect(array('action' => 'index'));
	 	}
	 	
	 	$exists = $this->VVehiculosExcedido->find('first', array(
	 			'conditions' => array(
	 					$this->modelClass . '.persona_id' => $persona_id
	 			),
	 			'recursive' => -1,
	 			'callbacks' => false,
	 			'fields' => $this->VVehiculosExcedido->primaryKey
	 	));
	 	
	 	if ($exists) {
	 		$this->redirect(array('action' => 'edit',$exists['VVehiculosExcedido'][$this->VVehiculosExcedido->primaryKey]));
	 	}
		if (!empty($this->request->query)) {
			foreach ($this->request->query as $key => $value) {
				$this->request->data['VVehiculosExcedido'][$key] = $value;
			}
		}
				$persona = $this->VVehiculosExcedido->Persona->find('first', 
			array(
					'conditions' => array('Persona.id' => $persona_id),
					'recursive' => -1,
					'fields' => array($this->VVehiculosExcedido->Persona->displayField,'id')
			)
		);
		$this->set(compact('persona'));
				
		$vehiculos = $this->VVehiculosExcedido->Vehiculo->find('list');
		$movimientos = $this->VVehiculosExcedido->Movimiento->find('list');
		$personas = $this->VVehiculosExcedido->Persona->find('list');
		$usuarios = $this->VVehiculosExcedido->Usuario->find('list');
		$this->set(compact('vehiculos', 'movimientos', 'personas', 'usuarios'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->VVehiculosExcedido->id = $id;
		if (!$this->VVehiculosExcedido->exists($id)) {
			throw new NotFoundException(__('Invalid v vehiculos excedido'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->VVehiculosExcedido->save($this->request->data)) {
				$this->Session->setFlash(__('El registro fue guardado correctamente.'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('No se pudo editar el registro. Por favor, vuelva a intentarlo.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('VVehiculosExcedido.' . $this->VVehiculosExcedido->primaryKey => $id));
			$this->request->data = $this->VVehiculosExcedido->find('first', $options);
		}
		$vehiculos = $this->VVehiculosExcedido->Vehiculo->find('list');
		$movimientos = $this->VVehiculosExcedido->Movimiento->find('list');
		$personas = $this->VVehiculosExcedido->Persona->find('list');
		$usuarios = $this->VVehiculosExcedido->Usuario->find('list');
						$this->set(compact('vehiculos', 'movimientos', 'personas', 'usuarios'));
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
		$this->VVehiculosExcedido->id = $id;
		if (!$this->VVehiculosExcedido->exists()) {
			throw new NotFoundException(__('Invalid v vehiculos excedido'));
		}
		if ($this->VVehiculosExcedido->delete()) {
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
		$this->Paginator->settings['conditions'] = $this->VVehiculosExcedido->parseCriteria($this->Prg->parsedParams());
		$this->set('vVehiculosExcedidos', $this->Paginator->paginate());
		$this->render('admin_index');
	}
}
