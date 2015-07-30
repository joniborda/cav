


<div id="page-container" class="row">
	<div class="form" id="search-form" <?php echo ($this->view === 'admin_index')? 'style="display:none;"' : ''?>>	<?php echo $this->Form->create('Persona', array(
		    'url' => array('controller' => 'Personas', 'action' => 'find'),
			'inputDefaults' => array('label' => false), 'role' => 'form'
		));?>						<div class="row">
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="PersonaNombreCheck" onclick="buscar_nombre(this);" <?php echo (isset($this->passedArgs['nombre']) && $this->passedArgs['nombre'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_nombre() {
							if ($('#PersonaNombre').attr('disabled')) {
								$('#nombre_input').show('slow');
								$('#PersonaNombre').removeAttr('disabled');
								$('#PersonaNombre_').removeAttr('disabled');
								
							} else {
								$('#nombre_input').hide('slow');
								$('#PersonaNombre').val('');
								$('#PersonaNombre').attr('disabled', 'disabled');
								$('#PersonaNombre_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('nombre_check','Nombre');?></div>
				<div id="nombre_input"  <?php echo (isset($this->passedArgs['nombre'])  && $this->passedArgs['nombre'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('nombre', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["nombre"])  && $this->passedArgs["nombre"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="PersonaApellidoCheck" onclick="buscar_apellido(this);" <?php echo (isset($this->passedArgs['apellido']) && $this->passedArgs['apellido'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_apellido() {
							if ($('#PersonaApellido').attr('disabled')) {
								$('#apellido_input').show('slow');
								$('#PersonaApellido').removeAttr('disabled');
								$('#PersonaApellido_').removeAttr('disabled');
								
							} else {
								$('#apellido_input').hide('slow');
								$('#PersonaApellido').val('');
								$('#PersonaApellido').attr('disabled', 'disabled');
								$('#PersonaApellido_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('apellido_check','Apellido');?></div>
				<div id="apellido_input"  <?php echo (isset($this->passedArgs['apellido'])  && $this->passedArgs['apellido'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('apellido', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["apellido"])  && $this->passedArgs["apellido"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="PersonaNumeroDocumentoCheck" onclick="buscar_numero_documento(this);" <?php echo (isset($this->passedArgs['numero_documento']) && $this->passedArgs['numero_documento'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_numero_documento() {
							if ($('#PersonaNumeroDocumento').attr('disabled')) {
								$('#numero_documento_input').show('slow');
								$('#PersonaNumeroDocumento').removeAttr('disabled');
								$('#PersonaNumeroDocumento_').removeAttr('disabled');
								
							} else {
								$('#numero_documento_input').hide('slow');
								$('#PersonaNumeroDocumento').val('');
								$('#PersonaNumeroDocumento').attr('disabled', 'disabled');
								$('#PersonaNumeroDocumento_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('numero_documento_check','Numero Documento');?></div>
				<div id="numero_documento_input"  <?php echo (isset($this->passedArgs['numero_documento'])  && $this->passedArgs['numero_documento'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('numero_documento', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["numero_documento"])  && $this->passedArgs["numero_documento"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="PersonaTelefonoCheck" onclick="buscar_telefono(this);" <?php echo (isset($this->passedArgs['telefono']) && $this->passedArgs['telefono'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_telefono() {
							if ($('#PersonaTelefono').attr('disabled')) {
								$('#telefono_input').show('slow');
								$('#PersonaTelefono').removeAttr('disabled');
								$('#PersonaTelefono_').removeAttr('disabled');
								
							} else {
								$('#telefono_input').hide('slow');
								$('#PersonaTelefono').val('');
								$('#PersonaTelefono').attr('disabled', 'disabled');
								$('#PersonaTelefono_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('telefono_check','Telefono');?></div>
				<div id="telefono_input"  <?php echo (isset($this->passedArgs['telefono'])  && $this->passedArgs['telefono'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('telefono', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["telefono"])  && $this->passedArgs["telefono"] != null )? false : "disabled"));?>				</div>
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
				<li class="list-group-item"><?php echo $this->Html->link(__('New Persona'), array('action' => 'add'), array('class' => '')); ?></li>						<li class="list-group-item"><?php echo $this->Html->link(__('List Movimientos'), array('controller' => 'movimientos', 'action' => 'index'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('New Movimiento'), array('controller' => 'movimientos', 'action' => 'add'), array('class' => '')); ?></li> 
			</ul><!-- /.list-group -->
			
<!--  		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .col-sm-3 -->
				
	<div id="page-content" class="col-sm-12">
<!-- 	<div id="page-content" class="col-sm-9"> -->

		<div class="personas index">
		
			<h2 style='display:inline;'><?php echo __('Personas'); ?></h2> <a href="<?php echo Router::url(array('controller' => 'personas', 'action' => 'add'));?>" class='btn btn-large btn-primary' style='float:right'>Agregar nuevo</a>
			<hr />
			<div class="table-responsive">
				<table cellpadding="0" cellspacing="0" class="table table-striped table-bordered">
					<thead>
						<tr>
																						<th><?php echo $this->Paginator->sort('id'); ?></th>
																						<th><?php echo $this->Paginator->sort('nombre'); ?></th>
																						<th><?php echo $this->Paginator->sort('apellido'); ?></th>
																						<th><?php echo $this->Paginator->sort('numero_documento'); ?></th>
																						<th><?php echo $this->Paginator->sort('telefono'); ?></th>
															<th class="actions"><?php echo __('Opciones'); ?></th>
						</tr>
					</thead>
					<tbody>
						<?php
						foreach ($personas as $persona): ?>
	<tr>
		<td><?php echo h($persona['Persona']['id']); ?><?php if ($persona['Persona']['sdh'])
										echo $this->Html->link('',
												array('controller' => 'l24321Certificados', 'action' => 'menu', $persona['Persona']['id']),
												array('class' => 'glyphicon glyphicon-book')
										); ?>&nbsp;&nbsp;</td>
		<td><?php echo h($persona['Persona']['nombre']); ?>&nbsp;</td>
		<td><?php echo h($persona['Persona']['apellido']); ?>&nbsp;</td>
		<td><?php echo h($persona['Persona']['numero_documento']); ?>&nbsp;</td>
		<td><?php echo h($persona['Persona']['telefono']); ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link('<span class="glyphicon glyphicon-list-alt" title="Ver"></span>', array('action' => 'view', $persona['Persona']['id']), array('escape'=>false)); ?>
			<?php echo $this->Html->link('<span class="glyphicon glyphicon-wrench" title="Editar"></span>', array('action' => 'edit', $persona['Persona']['id']), array('escape'=>false)); ?>
			<?php echo $this->Form->postLink('<span class="glyphicon glyphicon-trash" title="Borrar"></span>', array('action' => 'delete', $persona['Persona']['id']), array('escape'=>false), __('¿Estas seguro que desea borrar # %s?', $persona['Persona']['id'])); ?>
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
