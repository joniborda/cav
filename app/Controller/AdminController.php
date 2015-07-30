<?php
class AdminController extends AppController {
	public function index() {
		$this->redirect(array('controller' => 'movimientos', 'action' => 'admin_add'));
	}
}
?>