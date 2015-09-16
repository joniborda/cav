<?php
/**
 * Application level Controller
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Controller
 * @since         CakePHP(tm) v 0.2.9
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */
App::uses('Controller', 'Controller');

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @package		app.Controller
 * @link		http://book.cakephp.org/2.0/en/controllers.html#the-app-controller
 */
class AppController extends Controller {
	
	public $components = array(
		'DebugKit.Toolbar',
		'Session',
		'RequestHandler',
		'Auth' => array(
			'authenticate' => array(
				'Form' => array(
					'userModel' => 'Usuario',
					'fields' => array(
						'username' => 'usuario_login',
						'password' => 'password'
					),
				)
			),
			'loginAction' => array('controller' => 'usuarios', 'action' => 'login', 'admin' => true),
			'loginRedirect' => array('controller' => 'movimientos', 'action' => 'add', 'admin' => true),
			'logoutRedirect' => array('controller' => 'usuarios', 'action' => 'login', 'admin' => true),
			'authorize' => array('Controller'),
			'authError' => 'No tiene permisos para ingresar a esta sección'
		)
	);
	
	public $theme = "Cakestrap";
	public $layout = 'private';
	
	public $url_permitidas = array(
		'admin/pages/display',
		'admin/usuarios/logout',
	);
	const ADMIN_GROUP = 'administrador';
	const SEGURIDAD = 'seguridad';


	public function beforeFilter() {
		$this->request->params['admin'] = 'admin';
		$this->historial();
		$this->set('current_user', $this->Auth->user());
		$this->set('current_url', $this->getUrl(true));
		$this->set('current_controller', Inflector::underscore($this->request->controller));
		$this->set('current_action', $this->request->action);

		$this->loadModel('VVehiculosAdentro');
		$this->set('count_inside', $this->VVehiculosAdentro->find('count'));

		$this->loadModel('VVehiculosExcedido');
		$this->set('count_inside2', $this->VVehiculosExcedido->find('count'));
		
		setlocale(LC_TIME, 'Spanish');
		setlocale(LC_TIME, 'es_AR.utf8');
		
 		//$this->_cargar_todas_url();
	}
	
	public function getLayout() {
		$this->layout = 'private';
	}
	
	/**
	 * Checks if authorized, It's called automatic
	 * @return boolean
	 */
	public function isAuthorized() { 
		$this->set('is_admin', false);
		$allowed = false;
		$url_string = Inflector::underscore($this->getUrl());
		
		$this->loadModel('UsuariosGrupo');
		
		if ($usuario = $this->Auth->user()) {
				
			$usuario = $this->getModel('Usuario')->find(
					'first',
					array(
							'conditions' => array(
									'id' => $usuario['id']
							),
							'recursive' => '2'
					)
			);
	
			if ($this->isPerfil()) {
				return true;
			}
				
			foreach ($usuario['Grupo'] as $grupo) {
				switch ($grupo['descripcion']) {
					case self::ADMIN_GROUP:
						$this->set('is_admin', true);
						return true;
						break;
					case self::SEGURIDAD:
						$this->set('seguridad', true);
						return true;
						break;
				}
	
				foreach ($grupo['Url'] as $url) {
					if (Inflector::underscore(trim($url['descripcion'])) == $url_string) {
						$allowed = true;
						break;
					}
				}
			}
				
			if ($allowed) {
				return true;
			}
				
			if (array_search($url_string, $this->url_permitidas) !== false) {
				return true;
			}
				
			if (!$this->request->is('ajax')) {
				//$this->Session->setFlash($this->getUrl(), 'flash/error');
			}
		}
	}
	
	/**
	 * Get URL prefix/controller/action
	 *
	 * @return string
	 */
	public function getUrl($without_prefix = false) {
	
		if ($without_prefix) {
			return '/' . $this->request->controller . '/' .
					str_replace($this->params['prefix'].'_', '', $this->request->action);
		}
	
		return $this->params['prefix'] . '/' . $this->request->controller . '/' .
				str_replace($this->params['prefix'].'_', '', $this->request->action);
	
	}
	
	/**
	 * Return load model once
	 *
	 * @param String $model
	 *
	 * @return AppModel
	 */
	public function getModel($model) {
		if (!isset($this->{$model}) && $this->{$model} == null) {
			$this->loadModel($model);
		}
		return $this->{$model};
	}
	
	/**
	 * Save Historial
	 *
	 */
	private function historial() {
		
		$extension = substr($_SERVER['REQUEST_URI'],-4);
		
		if ($extension == '.png' || $extension == '.jpg' || $extension == 'jpeg' || $extension == '.doc' || $extension == '.pdf') {
			return;
		}

		if (!empty($this->data) && $this->request->action != 'admin_login') {
			$historial['Historiale']['parametros'] = serialize($this->data);
		}
		$this->loadModel('Historiale');
	
		$historial['Historiale']['usuario_id'] = $this->Auth->user('id');
		$historial['Historiale']['url'] = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
		$historial['Historiale']['navegador'] =  $_SERVER['HTTP_USER_AGENT'];
		$historial['Historiale']['ip'] = $this->get_client_ip();
	
		if(!$this->Historiale->save($historial)) {
			//hacer algo
		}
	}
	
	public function get_client_ip() {
		$ipaddress = '';
		if (getenv('HTTP_CLIENT_IP'))
			$ipaddress = getenv('HTTP_CLIENT_IP');
		else if(getenv('HTTP_X_FORWARDED_FOR'))
			$ipaddress = getenv('HTTP_X_FORWARDED_FOR');
		else if(getenv('HTTP_X_FORWARDED'))
			$ipaddress = getenv('HTTP_X_FORWARDED');
		else if(getenv('HTTP_FORWARDED_FOR'))
			$ipaddress = getenv('HTTP_FORWARDED_FOR');
		else if(getenv('HTTP_FORWARDED'))
			$ipaddress = getenv('HTTP_FORWARDED');
		else if(getenv('REMOTE_ADDR'))
			$ipaddress = getenv('REMOTE_ADDR');
		else
			$ipaddress = 'UNKNOWN';
	
		return $ipaddress;
	}
	
	/**
	 * Retorna true si es el perfil del usuario de session
	 *
	 * @return boolean
	 */
	private function isPerfil() {
		$url_string = Inflector::underscore($this->getUrl());
		if (
		$url_string === 'admin/usuarios/perfil'
				&& is_array($this->passedArgs)
				&& $this->Auth->user('id') == $this->passedArgs[0]
		) {
			// es el perfil del usuario
			return true;
		}
	}
	
	private function _cargar_todas_url() {
		$controllpull = App::objects('Controller');
		
		foreach($controllpull as $controller) {
		
			if($controller != 'AppController') {
					
		
				include_once $controller . '.php';
					
				$class = new ReflectionClass($controller);
				$actions = $class->getMethods(ReflectionMethod::IS_PUBLIC);
					
				$parentMethods = get_class_methods(get_parent_class($controller));
		
				$new_action = array();
				foreach($actions as $a) {
					$new_action[] = $a->name;
				}
					
				$actions = array_diff($new_action, $parentMethods);
				$na = array();
				foreach($actions as $a) {
					$na[] = str_replace('admin_', '', $a);
				}
					
					
				foreach($na as $url) {
					$urls[] = 'admin/' . str_replace('_controller', '', Inflector::underscore($controller) ) . '/' .$url;
				}
					
			}
		}
		
		$this->loadModel('Url');
		
		foreach($urls as $url) {
			$this->Url->create();
			try {
				$this->Url->save(array('descripcion' => $url));
			} catch (PDOException $e) {
				echo "No se puedo guarar " . $url;
			}
		}
		die();
	}
	
	/**
	 * Guardar archivo
	 *
	 * @param string $id			La clave primaria
	 * @param string $input_file	El input file
	 * @param string $input_name	El nombre del input
	 * @param string $folder		La carpeta en donde se va a guardar
	 *
	 * @return boolean
	 */
	protected function saveFile($id = null, $input_file = null, $input_name = null, $folder = 'FemicidioArchivos') {
	
		if ($input_file == null || $input_name == null) {
			return false;
		}

		
		if($input_file['name'] != '') {
			$file = true;
			//ERRORES
			$error[0] = "El archivo debe ser menor a 50mb.";
	
			//variables
			$filename = trim($input_file['name']);
			$tamano_archivo = $input_file['size'];
			$tmp_name = $input_file['tmp_name'];

			// COMPRUEBA QUE EL JPG SEA MENOR DE 50 MB...
			if ($tamano_archivo > 51200000) {
				$this->Session->setFlash($error[0], 'flash/error');
				return false;
			}
			//$file_name = $id . '_' . $input_file['name'];
			$file_name = $input_file['name'];
			
			$uploadfile =
			// si no anda la subida de archivo, borrar la linea siguiente, solo una.
			
			realpath('.') .DS .FILE_PATH . DS .$input_name . DS .$id . DS .$file_name;
			
			 
			$path_parcial = realpath('.') .DS .FILE_PATH;
			
			if(!is_dir($path_parcial)){
					
				mkdir($path_parcial);
				echo 'se creo' . FILE_PATH;
			}	

			$path_parcial .= DS . $input_name;
				
			if(!is_dir( $path_parcial)){
					
				mkdir( $path_parcial);
			}
			
			$path_parcial .= DS . $id;
			if(!is_dir($path_parcial)){
					
				mkdir($path_parcial);
			}
				
			$status = move_uploaded_file($tmp_name, $path_parcial . DS. $file_name);
	
			if ($status == false) {
				$this->Session->setFlash('No se puedo cargar el archivo', 'flash/error');
				return false;
			}
	
			//$this->redirect(array('action' => 'index'));
			$this->redirect(array('controller' => 'movimientos' ,'action' => 'admin_add'));
			//$this->deleteFileById($id, $input_name, array($file_name),  $folder);
			return true;
		}
	}
	

	/**
	 * Borrar los archivos de una carpeta dejando algunos
	 *
	 * @param string $id 			El id del registro
	 * @param string $input_name 	El nombre del campo
	 * @param Array $dejar 			Un array con los archivos que no quiero que borre
	 * @param string $folder		El nombre de la carpeta que esta en webroot
	 */


	
	
}