<?php
App::uses('AppController', 'Controller');
/**
 * Historiales Controller
 *
 * @property Historiale $Historiale
 * @property PaginatorComponent $Paginator
 * @property Search.PrgComponent $Search.Prg
 */
class HistorialesController extends AppController {

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
		$this->Historiale->recursive = 0;
		$this->set('historiales', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->Historiale->exists($id)) {
			throw new NotFoundException(__('Invalid historiale'));
		}
		$options = array('conditions' => array('Historiale.' . $this->Historiale->primaryKey => $id));
		$this->set('historiale', $this->Historiale->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$this->Historiale->create();
			if ($this->Historiale->save($this->request->data)) {
				$this->Session->setFlash(__('El registro fue agregado correctamente.'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('No se pudo agregar el registro. Por favor, vuelva a intentarlo.'), 'flash/error');
			}
		}
		$usuarios = $this->Historiale->Usuario->find('list');
		$this->set(compact('usuarios'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->Historiale->id = $id;
		if (!$this->Historiale->exists($id)) {
			throw new NotFoundException(__('Invalid historiale'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Historiale->save($this->request->data)) {
				$this->Session->setFlash(__('El registro fue guardado correctamente.'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('No se pudo editar el registro. Por favor, vuelva a intentarlo.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Historiale.' . $this->Historiale->primaryKey => $id));
			$this->request->data = $this->Historiale->find('first', $options);
		}
		$usuarios = $this->Historiale->Usuario->find('list');
		$this->set(compact('usuarios'));
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
		$this->Historiale->id = $id;
		if (!$this->Historiale->exists()) {
			throw new NotFoundException(__('Invalid historiale'));
		}
		if ($this->Historiale->delete()) {
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
		$this->Paginator->settings['conditions'] = $this->Historiale->parseCriteria($this->Prg->parsedParams());
		$this->set('historiales', $this->Paginator->paginate());
		$this->render('admin_index');
	}
}
