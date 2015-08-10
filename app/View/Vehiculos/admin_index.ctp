<div id="page-container" class="row">
	<div class="form" id="search-form" <?php echo ($this->view === 'admin_index')? 'style="display:none;"' : ''?>>	<?php echo $this->Form->create('Vehiculo', array(
		    'url' => array('controller' => 'Vehiculos', 'action' => 'find'),
			'inputDefaults' => array('label' => false), 'role' => 'form'
		));?>						<div class="row">
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VehiculoPatenteCheck" onclick="buscar_patente(this);" <?php echo (isset($this->passedArgs['patente']) && $this->passedArgs['patente'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_patente() {
							if ($('#VehiculoPatente').attr('disabled')) {
								$('#patente_input').show('slow');
								$('#VehiculoPatente').removeAttr('disabled');
								$('#VehiculoPatente_').removeAttr('disabled');
								
							} else {
								$('#patente_input').hide('slow');
								$('#VehiculoPatente').val('');
								$('#VehiculoPatente').attr('disabled', 'disabled');
								$('#VehiculoPatente_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('patente_check','Patente');?></div>
				<div id="patente_input"  <?php echo (isset($this->passedArgs['patente'])  && $this->passedArgs['patente'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('patente', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["patente"])  && $this->passedArgs["patente"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VehiculoColorCheck" onclick="buscar_color(this);" <?php echo (isset($this->passedArgs['color']) && $this->passedArgs['color'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_color() {
							if ($('#VehiculoColor').attr('disabled')) {
								$('#color_input').show('slow');
								$('#VehiculoColor').removeAttr('disabled');
								$('#VehiculoColor_').removeAttr('disabled');
								
							} else {
								$('#color_input').hide('slow');
								$('#VehiculoColor').val('');
								$('#VehiculoColor').attr('disabled', 'disabled');
								$('#VehiculoColor_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('color_check','Color');?></div>
				<div id="color_input"  <?php echo (isset($this->passedArgs['color'])  && $this->passedArgs['color'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('color', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["color"])  && $this->passedArgs["color"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VehiculoDescripcionCheck" onclick="buscar_descripcion(this);" <?php echo (isset($this->passedArgs['descripcion']) && $this->passedArgs['descripcion'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_descripcion() {
							if ($('#VehiculoDescripcion').attr('disabled')) {
								$('#descripcion_input').show('slow');
								$('#VehiculoDescripcion').removeAttr('disabled');
								$('#VehiculoDescripcion_').removeAttr('disabled');
								
							} else {
								$('#descripcion_input').hide('slow');
								$('#VehiculoDescripcion').val('');
								$('#VehiculoDescripcion').attr('disabled', 'disabled');
								$('#VehiculoDescripcion_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('descripcion_check','Descripcion');?></div>
				<div id="descripcion_input"  <?php echo (isset($this->passedArgs['descripcion'])  && $this->passedArgs['descripcion'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('descripcion', array('type' => 'text', 'div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["descripcion"])  && $this->passedArgs["descripcion"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VehiculoTipoAutorizacionCheck" onclick="buscar_tipo_autorizacion(this);" <?php echo (isset($this->passedArgs['tipo_autorizacion']) && $this->passedArgs['tipo_autorizacion'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_tipo_autorizacion() {
							if ($('#VehiculoTipoAutorizacion').attr('disabled')) {
								$('#tipo_autorizacion_input').show('slow');
								$('#VehiculoTipoAutorizacion').removeAttr('disabled');
								$('#VehiculoTipoAutorizacion_').removeAttr('disabled');
								
							} else {
								$('#tipo_autorizacion_input').hide('slow');
								$('#VehiculoTipoAutorizacion').val('');
								$('#VehiculoTipoAutorizacion').attr('disabled', 'disabled');
								$('#VehiculoTipoAutorizacion_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('tipo_autorizacion_check','Tipo Autorizacion');?></div>
				<div id="tipo_autorizacion_input"  <?php echo (isset($this->passedArgs['tipo_autorizacion'])  && $this->passedArgs['tipo_autorizacion'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('tipo_autorizacion', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["tipo_autorizacion"])  && $this->passedArgs["tipo_autorizacion"] != null )? false : "disabled"));?>				</div>
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
				<li class="list-group-item"><?php echo $this->Html->link(__('New Vehiculo'), array('action' => 'add'), array('class' => '')); ?></li>						<li class="list-group-item"><?php echo $this->Html->link(__('List Movimientos'), array('controller' => 'movimientos', 'action' => 'index'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('New Movimiento'), array('controller' => 'movimientos', 'action' => 'add'), array('class' => '')); ?></li> 
			</ul><!-- /.list-group -->
			
<!--  		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .col-sm-3 -->
				
	<div id="page-content" class="col-sm-12">
<!-- 	<div id="page-content" class="col-sm-9"> -->

		<div class="vehiculos index">
		
			<h2 style='display:inline;'><?php echo __('Vehiculos'); ?></h2> <a href="<?php echo Router::url(array('controller' => 'vehiculos', 'action' => 'add'));?>" class='btn btn-large btn-primary' style='float:right'>Agregar nuevo</a>
			<hr />
			<div class="table-responsive">
				<table cellpadding="0" cellspacing="0" class="table table-striped table-bordered">
					<thead>
						<tr>
																						<th><?php echo $this->Paginator->sort('id'); ?></th>
																						<th><?php echo $this->Paginator->sort('patente'); ?></th>
																						<th><?php echo $this->Paginator->sort('color'); ?></th>
																						<th><?php echo $this->Paginator->sort('descripcion'); ?></th>
																						<th><?php echo $this->Paginator->sort('tipo_autorizacion'); ?></th>
															<th class="actions"><?php echo __('Opciones'); ?></th>
						</tr>
					</thead>
					<tbody>
						<?php
						foreach ($vehiculos as $vehiculo): ?>
	<tr>
		<td><?php echo h($vehiculo['Vehiculo']['id']); ?>&nbsp;</td>
		<td><?php echo h($vehiculo['Vehiculo']['patente']); ?>&nbsp;</td>
		<td><?php echo h($vehiculo['Vehiculo']['color']); ?>&nbsp;</td>
		<td><?php echo h($vehiculo['Vehiculo']['descripcion']); ?>&nbsp;</td>
		<td><?php echo h($vehiculo['Vehiculo']['tipo_autorizacion']); ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link('<span class="glyphicon glyphicon-list-alt" title="Ver"></span>', array('action' => 'view', $vehiculo['Vehiculo']['id']), array('escape'=>false)); ?>
			<?php echo $this->Html->link('<span class="glyphicon glyphicon-wrench" title="Editar"></span>', array('action' => 'edit', $vehiculo['Vehiculo']['id']), array('escape'=>false)); ?>
			<?php echo $this->Form->postLink('<span class="glyphicon glyphicon-trash" title="Borrar"></span>', array('action' => 'delete', $vehiculo['Vehiculo']['id']), array('escape'=>false), __('¿Estas seguro que desea borrar # %s?', $vehiculo['Vehiculo']['id'])); ?>
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
