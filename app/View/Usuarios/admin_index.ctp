
<div id="page-container" class="row">
	<div class="form" id="search-form" <?php echo ($this->view === 'admin_index')? 'style="display:none;"' : ''?>>	<?php echo $this->Form->create('Usuario', array(
		    'url' => array('controller' => 'Usuarios', 'action' => 'find'),
			'inputDefaults' => array('label' => false), 'role' => 'form'
		));?>						<div class="row">
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" onclick="buscar_nombre_completo(this);" <?php echo (isset($this->passedArgs['nombre_completo']) && $this->passedArgs['nombre_completo'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_nombre_completo() {
							if ($('#UsuarioNombreCompleto').attr('disabled')) {
								$('#nombre_completo_input').show('slow');
								$('#UsuarioNombreCompleto').removeAttr('disabled');
								$('#UsuarioNombreCompleto_').removeAttr('disabled');
								
							} else {
								$('#nombre_completo_input').hide('slow');
								$('#UsuarioNombreCompleto').val('');
								$('#UsuarioNombreCompleto').attr('disabled', 'disabled');
								$('#UsuarioNombreCompleto_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('nombre_completo','Nombre Completo');?></div>
				<div id="nombre_completo_input"  <?php echo (isset($this->passedArgs['nombre_completo'])  && $this->passedArgs['nombre_completo'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('nombre_completo', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["nombre_completo"])  && $this->passedArgs["nombre_completo"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" onclick="buscar_password(this);" <?php echo (isset($this->passedArgs['password']) && $this->passedArgs['password'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_password() {
							if ($('#UsuarioPassword').attr('disabled')) {
								$('#password_input').show('slow');
								$('#UsuarioPassword').removeAttr('disabled');
								$('#UsuarioPassword_').removeAttr('disabled');
								
							} else {
								$('#password_input').hide('slow');
								$('#UsuarioPassword').val('');
								$('#UsuarioPassword').attr('disabled', 'disabled');
								$('#UsuarioPassword_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('password','Password');?></div>
				<div id="password_input"  <?php echo (isset($this->passedArgs['password'])  && $this->passedArgs['password'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('password', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["password"])  && $this->passedArgs["password"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" onclick="buscar_usuario_login(this);" <?php echo (isset($this->passedArgs['usuario_login']) && $this->passedArgs['usuario_login'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_usuario_login() {
							if ($('#UsuarioUsuarioLogin').attr('disabled')) {
								$('#usuario_login_input').show('slow');
								$('#UsuarioUsuarioLogin').removeAttr('disabled');
								$('#UsuarioUsuarioLogin_').removeAttr('disabled');
								
							} else {
								$('#usuario_login_input').hide('slow');
								$('#UsuarioUsuarioLogin').val('');
								$('#UsuarioUsuarioLogin').attr('disabled', 'disabled');
								$('#UsuarioUsuarioLogin_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('usuario_login','Usuario Login');?></div>
				<div id="usuario_login_input"  <?php echo (isset($this->passedArgs['usuario_login'])  && $this->passedArgs['usuario_login'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('usuario_login', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["usuario_login"])  && $this->passedArgs["usuario_login"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" onclick="buscar_borrado(this);" <?php echo (isset($this->passedArgs['borrado']) && $this->passedArgs['borrado'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_borrado() {
							if ($('#UsuarioBorrado').attr('disabled')) {
								$('#borrado_input').show('slow');
								$('#UsuarioBorrado').removeAttr('disabled');
								$('#UsuarioBorrado_').removeAttr('disabled');
								
							} else {
								$('#borrado_input').hide('slow');
								$('#UsuarioBorrado').val('');
								$('#UsuarioBorrado').attr('disabled', 'disabled');
								$('#UsuarioBorrado_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('borrado','Borrado');?></div>
				<div id="borrado_input"  <?php echo (isset($this->passedArgs['borrado'])  && $this->passedArgs['borrado'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('borrado', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["borrado"])  && $this->passedArgs["borrado"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
					</div>
				<div class="row">
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" onclick="buscar_id_anterior(this);" <?php echo (isset($this->passedArgs['id_anterior']) && $this->passedArgs['id_anterior'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_id_anterior() {
							if ($('#UsuarioIdAnterior').attr('disabled')) {
								$('#id_anterior_input').show('slow');
								$('#UsuarioIdAnterior').removeAttr('disabled');
								$('#UsuarioIdAnterior_').removeAttr('disabled');
								
							} else {
								$('#id_anterior_input').hide('slow');
								$('#UsuarioIdAnterior').val('');
								$('#UsuarioIdAnterior').attr('disabled', 'disabled');
								$('#UsuarioIdAnterior_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('id_anterior','Id Anterior');?></div>
				<div id="id_anterior_input"  <?php echo (isset($this->passedArgs['id_anterior'])  && $this->passedArgs['id_anterior'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('id_anterior', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["id_anterior"])  && $this->passedArgs["id_anterior"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" onclick="buscar_modified(this);" <?php echo (isset($this->passedArgs['modified']) && $this->passedArgs['modified'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_modified() {
							if ($('#UsuarioModified').attr('disabled')) {
								$('#modified_input').show('slow');
								$('#UsuarioModified').removeAttr('disabled');
								$('#UsuarioModified_').removeAttr('disabled');
								
							} else {
								$('#modified_input').hide('slow');
								$('#UsuarioModified').val('');
								$('#UsuarioModified').attr('disabled', 'disabled');
								$('#UsuarioModified_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('modified','Modified');?></div>
				<div id="modified_input"  <?php echo (isset($this->passedArgs['modified'])  && $this->passedArgs['modified'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('modified', array('type'=>'text','div' => false, "class" => "form-control datepicker", "disabled" => (isset($this->passedArgs["modified"])  && $this->passedArgs["modified"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" onclick="buscar_created(this);" <?php echo (isset($this->passedArgs['created']) && $this->passedArgs['created'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_created() {
							if ($('#UsuarioCreated').attr('disabled')) {
								$('#created_input').show('slow');
								$('#UsuarioCreated').removeAttr('disabled');
								$('#UsuarioCreated_').removeAttr('disabled');
								
							} else {
								$('#created_input').hide('slow');
								$('#UsuarioCreated').val('');
								$('#UsuarioCreated').attr('disabled', 'disabled');
								$('#UsuarioCreated_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('created','Created');?></div>
				<div id="created_input"  <?php echo (isset($this->passedArgs['created'])  && $this->passedArgs['created'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('created', array('type'=>'text','div' => false, "class" => "form-control datepicker", "disabled" => (isset($this->passedArgs["created"])  && $this->passedArgs["created"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" onclick="buscar_apellido(this);" <?php echo (isset($this->passedArgs['apellido']) && $this->passedArgs['apellido'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_apellido() {
							if ($('#UsuarioApellido').attr('disabled')) {
								$('#apellido_input').show('slow');
								$('#UsuarioApellido').removeAttr('disabled');
								$('#UsuarioApellido_').removeAttr('disabled');
								
							} else {
								$('#apellido_input').hide('slow');
								$('#UsuarioApellido').val('');
								$('#UsuarioApellido').attr('disabled', 'disabled');
								$('#UsuarioApellido_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('apellido','Apellido');?></div>
				<div id="apellido_input"  <?php echo (isset($this->passedArgs['apellido'])  && $this->passedArgs['apellido'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('apellido', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["apellido"])  && $this->passedArgs["apellido"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
					</div>
				<div class="row">
								</div>
				<div style="clear:both;">			<?php echo $this->Form->submit(__('Buscar'), array('class' => 'btn btn-large btn-primary'));
 echo $this->Form->end();?>		</div>			
	</div><!-- form -->
	<div class="show_search text-center">
	<a href="#" onclick="showSearch(this);return false;">
		<?php echo ($this->view === 'admin_index')? '<span class="glyphicon glyphicon-chevron-down"></span>' : '<span class="glyphicon glyphicon-chevron-up"></span>';?>  
		<span>Búsqueda</span>
	</a>
	<script type="text/javascript">
		function showSearch(element) {
				if ($('#search-form').is(':visible')) {
					$(element).find('.glyphicon').removeClass('glyphicon-chevron-up');
					$(element).find('.glyphicon').addClass('glyphicon-chevron-down');
					$('#search-form').hide('slow');
				} else {
					$(element).find('.glyphicon').removeClass('glyphicon-chevron-down');
					$(element).find('.glyphicon').addClass('glyphicon-chevron-up');
					$('#search-form').show('slow');
				}
			}
	</script>
	</div>
<!-- 	<div id="sidebar" class="col-sm-3">
		
		<div class="actions">
		
			<ul class="list-group">
				<li class="list-group-item"><?php echo $this->Html->link(__('New Usuario'), array('action' => 'add'), array('class' => '')); ?></li>						<li class="list-group-item"><?php echo $this->Html->link(__('List Grupos'), array('controller' => 'grupos', 'action' => 'index'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('New Grupo'), array('controller' => 'grupos', 'action' => 'add'), array('class' => '')); ?></li> 
			</ul><!-- /.list-group -->
			
<!--  		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .col-sm-3 -->
				
	<div id="page-content" class="col-sm-12">
<!-- 	<div id="page-content" class="col-sm-9"> -->

		<div class="usuarios index">
		
			<h2><?php echo __('Usuarios'); ?></h2>
			<hr />
			<div class="table-responsive">
				<table cellpadding="0" cellspacing="0" class="table table-striped table-bordered">
					<thead>
						<tr>
															
															<th><?php echo $this->Paginator->sort('id'); ?></th>
															<th><?php echo $this->Paginator->sort('nombre_completo'); ?></th>
															<th><?php echo $this->Paginator->sort('password'); ?></th>
															<th><?php echo $this->Paginator->sort('usuario_login'); ?></th>
															<th><?php echo $this->Paginator->sort('borrado'); ?></th>
															<th><?php echo $this->Paginator->sort('id_anterior'); ?></th>
															<th><?php echo $this->Paginator->sort('modified'); ?></th>
															<th><?php echo $this->Paginator->sort('created'); ?></th>
															<!-- <th><?php echo $this->Paginator->sort('apellido'); ?></th>  -->
															<th class="actions"><?php echo __('Opciones'); ?></th>
						</tr>
					</thead>
					<tbody>
						<?php
						foreach ($usuarios as $usuario): ?>
	<tr>
		
		<td><?php echo h($usuario['Usuario']['id']); ?>&nbsp;</td>
		<td><?php echo h($usuario['Usuario']['nombre_completo']); ?>&nbsp;</td>
		<td><?php echo h($usuario['Usuario']['password']); ?>&nbsp;</td>
		<td><?php echo h($usuario['Usuario']['usuario_login']); ?>&nbsp;</td>
		<td><?php echo h($usuario['Usuario']['borrado']); ?>&nbsp;</td>
		<td><?php echo h($usuario['Usuario']['id_anterior']); ?>&nbsp;</td>
		<td><?php echo h($usuario['Usuario']['modified']); ?>&nbsp;</td>
		<td><?php echo h($usuario['Usuario']['created']); ?>&nbsp;</td>
	<!--	<td><?php echo h($usuario['Usuario']['apellido']); ?>&nbsp;</td> -->
		
		<td class="actions">
			<?php echo $this->Html->link('<span class="glyphicon glyphicon-list-alt" title="Ver"></span>', array('action' => 'view', $usuario['Usuario']['id']), array('escape'=>false)); ?>
			<?php echo $this->Html->link('<span class="glyphicon glyphicon-wrench" title="Ver"></span>', array('action' => 'edit', $usuario['Usuario']['id']), array('escape'=>false)); ?>
			<?php echo $this->Form->postLink('<span class="glyphicon glyphicon-trash" title="Borrar"></span>', array('action' => 'delete', $usuario['Usuario']['id']), array('escape'=>false), __('¿Estas seguro que desea borrar # %s?', $usuario['Usuario']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
					</tbody>
				</table>
			</div><!-- /.table-responsive -->
			<center>
				<p><small>
					<?php
					echo $this->Paginator->counter(array(
					'format' => __('Página {:page} de {:pages}, mostrando {:current} registros de {:count} total, comenzando por el {:start}, y terminando en el {:end}')
					));
					?>				</small></p>
	
				<ul class="pagination">
					<?php
		echo $this->Paginator->prev('< ' . __('Anterior'), array('tag' => 'li'), null, array('class' => 'disabled', 'tag' => 'li', 'disabledTag' => 'a'));
		echo $this->Paginator->numbers(array('separator' => '', 'currentTag' => 'a', 'tag' => 'li', 'currentClass' => 'disabled'));
		echo $this->Paginator->next(__('Siguiente') . ' >', array('tag' => 'li'), null, array('class' => 'disabled', 'tag' => 'li', 'disabledTag' => 'a'));
	?>
				</ul><!-- /.pagination -->
			
			</center>
		</div><!-- /.index -->
	
	</div><!-- /#page-content .col-sm-9 -->

</div><!-- /#page-container .row-fluid -->
