<?php
App::uses('AppController', 'Controller');
/**
 * Personas Controller
 *
 * @property Persona $Persona
 * @property PaginatorComponent $Paginator
 * @property Search.PrgComponent $Search.Prg
 */
class PersonasController extends AppController {

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
		$this->Persona->recursive = 0;
		$this->set('personas', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->Persona->exists($id)) {
			throw new NotFoundException(__('Invalid persona'));
		}
		$options = array('conditions' => array('Persona.' . $this->Persona->primaryKey => $id));
		$this->set('persona', $this->Persona->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
 
public function admin_add() {
		if ($this->request->is('post')) {
			$this->Persona->create();
			$this->request->data['Persona']['usuario_id'] = $this->Auth->user('id');
			if ($this->Persona->save($this->request->data)) {
				$this->Session->setFlash(__('El registro fue agregado correctamente.'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('No se pudo agregar el registro. Por favor, vuelva a intentarlo.'), 'flash/error');
			}
		}
		
		if (!empty($this->request->query)) {
			foreach ($this->request->query as $key => $value) {
				$this->request->data['Persona'][$key] = $value;
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
        $this->Persona->id = $id;
		if (!$this->Persona->exists($id)) {
			throw new NotFoundException(__('Invalid persona'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Persona->save($this->request->data)) {
				$this->Session->setFlash(__('El registro fue guardado correctamente.'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('No se pudo editar el registro. Por favor, vuelva a intentarlo.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Persona.' . $this->Persona->primaryKey => $id));
			$this->request->data = $this->Persona->find('first', $options);
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
		$this->Persona->id = $id;
		if (!$this->Persona->exists()) {
			throw new NotFoundException(__('Invalid persona'));
		}
		if ($this->Persona->delete()) {
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
		$this->Paginator->settings['conditions'] = $this->Persona->parseCriteria($this->Prg->parsedParams());
		$this->set('personas', $this->Paginator->paginate());
		$this->render('admin_index');
	}

	public function admin_busqueda_dni($numero_documento = null) {

		$this->layout = false;

		$ret = array('html' => '');

		if (!$numero_documento) {
			$ret['response'] = false;
		}

		$persona = $this->Persona->find('first', 
			array(
				'conditions' => array(
					'UPPER(TRIM(numero_documento))' => strtoupper(trim($numero_documento))
				),
				'recursive' => -1
			)
		);

		if ($persona) {
			$ret['response'] = true;
			$ret['data'] = $persona['Persona'];
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

			$this->Persona->create();
			
			if ($this->Persona->save($this->request->data['persona_add'])) {
				$ret = array(
					'response' => true,
					'message' => 'El registro fue agregado correctamente.',
					'id' => $this->Persona->getLastInsertID()
				);
			} else {
				$ret = array(
					'response' => false,
					'message' => 'No se pudo agregar el registro. Por favor, vuelva a intentarlo.'
				);
			}

			echo json_encode($ret);
			die();
		}
	}
}
