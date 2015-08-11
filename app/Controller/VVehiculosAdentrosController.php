<?php
App::uses('AppController', 'Controller');
/**
 * VVehiculosAdentros Controller
 *
 * @property VVehiculosAdentro $VVehiculosAdentro
 * @property PaginatorComponent $Paginator
 * @property Search.PrgComponent $Search.Prg
 */
class VVehiculosAdentrosController extends AppController {

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
		$this->VVehiculosAdentro->recursive = 0;
		$this->set('vVehiculosAdentros', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->VVehiculosAdentro->exists($id)) {
			throw new NotFoundException(__('Invalid v vehiculos adentro'));
		}
		$options = array('conditions' => array('VVehiculosAdentro.' . $this->VVehiculosAdentro->primaryKey => $id));
		$this->set('vVehiculosAdentro', $this->VVehiculosAdentro->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
 
public function admin_add($persona_id) {
		if ($this->request->is('post')) {
			$this->VVehiculosAdentro->create();
			$this->request->data['VVehiculosAdentro']['usuario_id'] = $this->Auth->user('id');
			if ($this->VVehiculosAdentro->save($this->request->data)) {
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
	 	
	 	$exists = $this->VVehiculosAdentro->find('first', array(
	 			'conditions' => array(
	 					$this->modelClass . '.persona_id' => $persona_id
	 			),
	 			'recursive' => -1,
	 			'callbacks' => false,
	 			'fields' => $this->VVehiculosAdentro->primaryKey
	 	));
	 	
	 	if ($exists) {
	 		$this->redirect(array('action' => 'edit',$exists['VVehiculosAdentro'][$this->VVehiculosAdentro->primaryKey]));
	 	}
		if (!empty($this->request->query)) {
			foreach ($this->request->query as $key => $value) {
				$this->request->data['VVehiculosAdentro'][$key] = $value;
			}
		}
				$persona = $this->VVehiculosAdentro->Persona->find('first', 
			array(
					'conditions' => array('Persona.id' => $persona_id),
					'recursive' => -1,
					'fields' => array($this->VVehiculosAdentro->Persona->displayField,'id')
			)
		);
		$this->set(compact('persona'));
				
		$vehiculos = $this->VVehiculosAdentro->Vehiculo->find('list');
		$movimientos = $this->VVehiculosAdentro->Movimiento->find('list');
		$personas = $this->VVehiculosAdentro->Persona->find('list');
		$usuarios = $this->VVehiculosAdentro->Usuario->find('list');
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
        $this->VVehiculosAdentro->id = $id;
		if (!$this->VVehiculosAdentro->exists($id)) {
			throw new NotFoundException(__('Invalid v vehiculos adentro'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->VVehiculosAdentro->save($this->request->data)) {
				$this->Session->setFlash(__('El registro fue guardado correctamente.'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('No se pudo editar el registro. Por favor, vuelva a intentarlo.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('VVehiculosAdentro.' . $this->VVehiculosAdentro->primaryKey => $id));
			$this->request->data = $this->VVehiculosAdentro->find('first', $options);
		}
		$vehiculos = $this->VVehiculosAdentro->Vehiculo->find('list');
		$movimientos = $this->VVehiculosAdentro->Movimiento->find('list');
		$personas = $this->VVehiculosAdentro->Persona->find('list');
		$usuarios = $this->VVehiculosAdentro->Usuario->find('list');
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
		$this->VVehiculosAdentro->id = $id;
		if (!$this->VVehiculosAdentro->exists()) {
			throw new NotFoundException(__('Invalid v vehiculos adentro'));
		}
		if ($this->VVehiculosAdentro->delete()) {
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
		$this->Paginator->settings['conditions'] = $this->VVehiculosAdentro->parseCriteria($this->Prg->parsedParams());
		$this->set('vVehiculosAdentros', $this->Paginator->paginate());
		$this->render('admin_index');
	}
}
