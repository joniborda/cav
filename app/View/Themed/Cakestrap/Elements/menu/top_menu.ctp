<nav class="navbar navbar-default" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<!-- /.navbar-toggle -->
	</div>
	<!-- /.navbar-header -->
	<div class="collapse navbar-collapse navbar-ex1-collapse"
		id="top_menu_div">
	
		<ul class="nav navbar-nav col-xs-10">
			<h3 class="title">CONTROL DE ACCESSO VEHICULAR</h3>
	
<?php if (isset($is_admin) && $is_admin):?>
	<li
				class="dropdown margin_button <?php echo (array_search($current_controller, array('','usuarios', 'grupos','urls')) != null) ? 'active': ''?>">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">AREA 
					ADMIN<b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li
						class="dropdown-submenu <?php echo $current_controller == 'usuarios'? 'active': ''?>">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Usuarios</a>
						<ul class="dropdown-menu">
							<li
								class="<?php echo ($current_controller == 'usuarios' && $current_action == 'admin_add') ? 'active': ''?>"><a
								href="<?php echo Router::url(array('controller' => 'usuarios', 'action' => 'add'));?>">Agregar</a></li>
							<li
								class="<?php echo ($current_controller == 'usuarios' && $current_action == 'admin_index') ? 'active': ''?>"><a
								href="<?php echo Router::url(array('controller' => 'usuarios', 'action' => 'index'));?>">Listado</a></li>
						</ul>
					</li>
					<li
						class="dropdown-submenu <?php echo $current_controller == 'grupos'? 'active': ''?>">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Grupos
					</a>
						<ul class="dropdown-menu">
							<li
								class="<?php echo ($current_controller == 'grupos' && $current_action == 'admin_add') ? 'active': ''?>"><a
								href="<?php echo Router::url(array('controller' => 'grupos', 'action' => 'add'));?>">Agregar</a></li>
							<li
								class="<?php echo ($current_controller == 'grupos' && $current_action == 'admin_index') ? 'active': ''?>"><a
								href="<?php echo Router::url(array('controller' => 'grupos', 'action' => 'index'));?>">Listado</a></li>
						</ul>
					</li>
					<li
						class="dropdown-submenu <?php echo $current_controller == 'urls'? 'active': ''?>">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">URLs </a>
						<ul class="dropdown-menu">
							<li
								class="<?php echo ($current_controller == 'urls' && $current_action == 'admin_add') ? 'active': ''?>"><a
								href="<?php echo Router::url(array('controller' => 'urls', 'action' => 'add'));?>">Agregar</a></li>
							<li
								class="<?php echo ($current_controller == 'urls' && $current_action == 'admin_index') ? 'active': ''?>"><a
								href="<?php echo Router::url(array('controller' => 'urls', 'action' => 'index'));?>">Listado</a></li>
						</ul>
					</li>
					<li
						class="dropdown-submenu <?php echo $current_controller == 'historiales'? 'active': ''?>">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Historial
					</a>
						<ul class="dropdown-menu">
							<li
								class="<?php echo ($current_controller == 'historiales' && $current_action == 'admin_add') ? 'active': ''?>"><a
								href="<?php echo Router::url(array('controller' => 'historiales', 'action' => 'add'));?>">Agregar</a></li>
							<li
								class="<?php echo ($current_controller == 'historiales' && $current_action == 'admin_index') ? 'active': ''?>"><a
								href="<?php echo Router::url(array('controller' => 'historiales', 'action' => 'index'));?>">Listado</a></li>
						</ul>
					</li>
				</ul>
			</li>	
<?php endif;?>
			<li class="dropdown margin_button <?php echo ($current_controller == 'movimientos' && $current_action == 'admin_add') ? 'active': ''?>">
				<a href="<?php echo Router::url(array('controller' => 'movimientos', 'action' => 'add'))?>" class="dropdown-toggle">CARGA MOVIMIENTOS</a>
			</li>
			<li class="dropdown margin_button <?php echo ($current_controller == 'movimientos' && $current_action == 'admin_index') ? 'active': ''?>">
				<a href="<?php echo Router::url(array('controller' => 'movimientos', 'action' => 'index'))?>" class="dropdown-toggle">MOVIMIENTOS</a>
			</li>
			<li class="dropdown margin_button <?php echo ($current_controller == 'multas' && $current_action == 'admin_add') ? 'active': ''?>">
				<a href="<?php echo Router::url(array('controller' => 'movimientos', 'action' => 'index'))?>" class="dropdown-toggle">MULTAS</a>
			</li>
			<li class="dropdown margin_button <?php echo ($current_controller == 'vehiculos' && $current_action == 'admin_add') ? 'active': ''?>">
				<a href="<?php echo Router::url(array('controller' => 'vehiculos', 'action' => 'add'))?>" class="dropdown-toggle">CARGAR VEHÍCULOS</a>
			</li>
			<li class="dropdown margin_button <?php echo ($current_controller == 'v_vehiculos_adentros') ? 'active': ''?>">
				<a href="<?php echo Router::url(array('controller' => 'v_vehiculos_adentros', 'action' => 'index'))?>" class="dropdown-toggle">
					VEHÍCULOS ADENTRO
					<span class="badge"><?php echo $count_inside; ?></span>
				</a>
			</li>
		</ul>
		<!-- /.nav navbar-nav -->
		<ul class="nav navbar-nav right col-xs-2">
		<?php
		
if ($current_user) {
			$ruta_logout = Router::url ( array (
					'controller' => 'usuarios',
					'action' => 'admin_logout' 
			) );
			?>
					<li class="nav pull-right">
				<table class='table_salir'>
					<tr>
						<td height='20'>Bienvenido, <br>
							<a href="<?php echo Router::url(array('controller' => 'usuarios', 'action' => 'perfil', $current_user['id']));?>">
								<?php echo ucfirst($current_user['usuario_login']); ?></a></td>
					</tr>
					<tr>
						<td height='50'><a
							href="<?php echo Router::url(array('controller' => 'usuarios', 'action' => 'perfil', $current_user['id']));?>">
						<?php
			$filename = $current_user ['id'] . "_" . md5 ( $current_user ['id'] );
			
			if (file_exists ( WWW_ROOT . '/perfiles/' . $filename . '.jpg' )) {
				echo $this->Html->image ( '/perfiles/' . $filename . '.jpg', array (
						'alt' => 'Foto',
						'title' => 'Foto',
						'width' => '50px',
						'height' => '50px',
						'id' => 'f_perfil' 
				) );
			} else {
				echo $this->Html->image ( 'perfil.png', array (
						'alt' => 'Foto',
						'title' => 'Foto',
						'width' => '50px',
						'height' => '50px',
						'id' => 'f_perfil' 
				) );
			}
			?>
						</a></td>
					</tr>
					<tr height='30'>
						<td><a id='a_logout' href="<?php echo $ruta_logout; ?>"><i
								class="glyphicon glyphicon-off"></i> <?php echo __('Salir'); ?></a></td>
					</tr>
				</table>
			</li>
			<?php } ?>
		</ul>
		<!-- 
		<ul class="nav right">
			<li>
			<span class="zoomout glyphicon glyphicon-zoom-in" style="font-size: 17px;color:white">
	    	</span>
	    	</li>
	    	<li>
	  		<span class="zoomin glyphicon glyphicon-zoom-out" style="font-size: 17px; color:white"> 
	    	</span>
    		</li>
    	</ul>-->
	</div>
	<!-- /.navbar-collapse -->
	<div>
		<span class="glyphicon glyphicon-chevron-up"
			id="boton_ocultar_menu_top" title="Ocultar" style='cursor: pointer;'></span>
	</div>
</nav>
<!-- /.navbar navbar-default -->



<?php if(isset($menu_mock)): ?>
<ol class="breadcrumb">

	<?php foreach($menu_mock as $mmock): ?>
	
		<?php if($mmock[1] == false): ?>
			 <li class="active"><?php echo $mmock[0]; ?></li>
		<?php else: ?>
	 		 <li><a
		href="<?php echo Router::url(array('controller' => $mmock[2], 'action' => $mmock[3]));?>"><?php echo $mmock[0]; ?></a></li>
		<?php endif; ?>
	  
	 <?php endforeach; ?>
</ol>
<?php endif; ?>