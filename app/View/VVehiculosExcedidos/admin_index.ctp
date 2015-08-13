


<div id="page-container" class="row">
	<div class="form" id="search-form" <?php echo ($this->view === 'admin_index')? 'style="display:none;"' : ''?>>	<?php echo $this->Form->create('VVehiculosExcedido', array(
		    'url' => array('controller' => 'VVehiculosExcedidos', 'action' => 'find'),
			'inputDefaults' => array('label' => false), 'role' => 'form'
		));?>						<div class="row">
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VVehiculosExcedidoPatenteCheck" onclick="buscar_patente(this);" <?php echo (isset($this->passedArgs['patente']) && $this->passedArgs['patente'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_patente() {
							if ($('#VVehiculosExcedidoPatente').attr('disabled')) {
								$('#patente_input').show('slow');
								$('#VVehiculosExcedidoPatente').removeAttr('disabled');
								$('#VVehiculosExcedidoPatente_').removeAttr('disabled');
								
							} else {
								$('#patente_input').hide('slow');
								$('#VVehiculosExcedidoPatente').val('');
								$('#VVehiculosExcedidoPatente').attr('disabled', 'disabled');
								$('#VVehiculosExcedidoPatente_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('patente_check','Patente');?></div>
				<div id="patente_input"  <?php echo (isset($this->passedArgs['patente'])  && $this->passedArgs['patente'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('patente', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["patente"])  && $this->passedArgs["patente"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VVehiculosExcedidoTipoAutorizacionCheck" onclick="buscar_tipo_autorizacion(this);" <?php echo (isset($this->passedArgs['tipo_autorizacion']) && $this->passedArgs['tipo_autorizacion'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_tipo_autorizacion() {
							if ($('#VVehiculosExcedidoTipoAutorizacion').attr('disabled')) {
								$('#tipo_autorizacion_input').show('slow');
								$('#VVehiculosExcedidoTipoAutorizacion').removeAttr('disabled');
								$('#VVehiculosExcedidoTipoAutorizacion_').removeAttr('disabled');
								
							} else {
								$('#tipo_autorizacion_input').hide('slow');
								$('#VVehiculosExcedidoTipoAutorizacion').val('');
								$('#VVehiculosExcedidoTipoAutorizacion').attr('disabled', 'disabled');
								$('#VVehiculosExcedidoTipoAutorizacion_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('tipo_autorizacion_check','Tipo Autorizacion');?></div>
				<div id="tipo_autorizacion_input"  <?php echo (isset($this->passedArgs['tipo_autorizacion'])  && $this->passedArgs['tipo_autorizacion'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('tipo_autorizacion', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["tipo_autorizacion"])  && $this->passedArgs["tipo_autorizacion"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VVehiculosExcedidoMovimientoIdCheck" onclick="buscar_movimiento_id(this);" <?php echo (isset($this->passedArgs['movimiento_id']) && $this->passedArgs['movimiento_id'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_movimiento_id() {
							if ($('#VVehiculosExcedidoMovimientoId').attr('disabled')) {
								$('#movimiento_id_input').show('slow');
								$('#VVehiculosExcedidoMovimientoId').removeAttr('disabled');
								$('#VVehiculosExcedidoMovimientoId_').removeAttr('disabled');
								
							} else {
								$('#movimiento_id_input').hide('slow');
								$('#VVehiculosExcedidoMovimientoId').val('');
								$('#VVehiculosExcedidoMovimientoId').attr('disabled', 'disabled');
								$('#VVehiculosExcedidoMovimientoId_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('movimiento_id_check','Movimiento');?></div>
				<div id="movimiento_id_input"  <?php echo (isset($this->passedArgs['movimiento_id'])  && $this->passedArgs['movimiento_id'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('movimiento_id', array('type'=>'text','div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["movimiento_id"])  && $this->passedArgs["movimiento_id"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VVehiculosExcedidoPersonaIdCheck" onclick="buscar_persona_id(this);" <?php echo (isset($this->passedArgs['persona_id']) && $this->passedArgs['persona_id'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_persona_id() {
							if ($('#VVehiculosExcedidoPersonaId').attr('disabled')) {
								$('#persona_id_input').show('slow');
								$('#VVehiculosExcedidoPersonaId').removeAttr('disabled');
								$('#VVehiculosExcedidoPersonaId_').removeAttr('disabled');
								
							} else {
								$('#persona_id_input').hide('slow');
								$('#VVehiculosExcedidoPersonaId').val('');
								$('#VVehiculosExcedidoPersonaId').attr('disabled', 'disabled');
								$('#VVehiculosExcedidoPersonaId_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('persona_id_check','Persona');?></div>
				<div id="persona_id_input"  <?php echo (isset($this->passedArgs['persona_id'])  && $this->passedArgs['persona_id'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('persona_id', array('type'=>'text','div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["persona_id"])  && $this->passedArgs["persona_id"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
					</div>
				<div class="row">
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VVehiculosExcedidoSectorCheck" onclick="buscar_sector(this);" <?php echo (isset($this->passedArgs['sector']) && $this->passedArgs['sector'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_sector() {
							if ($('#VVehiculosExcedidoSector').attr('disabled')) {
								$('#sector_input').show('slow');
								$('#VVehiculosExcedidoSector').removeAttr('disabled');
								$('#VVehiculosExcedidoSector_').removeAttr('disabled');
								
							} else {
								$('#sector_input').hide('slow');
								$('#VVehiculosExcedidoSector').val('');
								$('#VVehiculosExcedidoSector').attr('disabled', 'disabled');
								$('#VVehiculosExcedidoSector_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('sector_check','Sector');?></div>
				<div id="sector_input"  <?php echo (isset($this->passedArgs['sector'])  && $this->passedArgs['sector'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('sector', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["sector"])  && $this->passedArgs["sector"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VVehiculosExcedidoInternoCheck" onclick="buscar_interno(this);" <?php echo (isset($this->passedArgs['interno']) && $this->passedArgs['interno'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_interno() {
							if ($('#VVehiculosExcedidoInterno').attr('disabled')) {
								$('#interno_input').show('slow');
								$('#VVehiculosExcedidoInterno').removeAttr('disabled');
								$('#VVehiculosExcedidoInterno_').removeAttr('disabled');
								
							} else {
								$('#interno_input').hide('slow');
								$('#VVehiculosExcedidoInterno').val('');
								$('#VVehiculosExcedidoInterno').attr('disabled', 'disabled');
								$('#VVehiculosExcedidoInterno_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('interno_check','Interno');?></div>
				<div id="interno_input"  <?php echo (isset($this->passedArgs['interno'])  && $this->passedArgs['interno'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('interno', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["interno"])  && $this->passedArgs["interno"] != null )? false : "disabled"));?>				</div>
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
				<li class="list-group-item"><?php echo $this->Html->link(__('New V Vehiculos Excedido'), array('action' => 'add'), array('class' => '')); ?></li>						<li class="list-group-item"><?php echo $this->Html->link(__('List Vehiculos'), array('controller' => 'vehiculos', 'action' => 'index'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('New Vehiculo'), array('controller' => 'vehiculos', 'action' => 'add'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('List Movimientos'), array('controller' => 'movimientos', 'action' => 'index'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('New Movimiento'), array('controller' => 'movimientos', 'action' => 'add'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('List Personas'), array('controller' => 'personas', 'action' => 'index'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('New Persona'), array('controller' => 'personas', 'action' => 'add'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('List Usuarios'), array('controller' => 'usuarios', 'action' => 'index'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('New Usuario'), array('controller' => 'usuarios', 'action' => 'add'), array('class' => '')); ?></li> 
			</ul><!-- /.list-group -->
			
<!--  		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .col-sm-3 -->
				
	<div id="page-content" class="col-sm-12">
<!-- 	<div id="page-content" class="col-sm-9"> -->

		<div class="vVehiculosExcedidos index">
		
			<h2 style='display:inline;'><?php echo __('VEHÍCULOS EXCEDIDOS'); ?></h2> 
			<hr />
			<div class="table-responsive">
				<table cellpadding="0" cellspacing="0" class="table table-striped table-bordered">
					<thead>
						<tr>
																						<th><?php echo $this->Paginator->sort('vehiculo_id',"DESCRIPCIÓN VEHÍCULO"); ?></th>
																						<th><?php echo $this->Paginator->sort('patente'); ?></th>
																						<th><?php echo $this->Paginator->sort('tipo_autorizacion'); ?></th>
																						<th><?php echo $this->Paginator->sort('persona_id'); ?></th>
																						<th><?php echo $this->Paginator->sort('sector'); ?></th>
																						<th><?php echo $this->Paginator->sort('interno'); ?></th>
																													<th class="actions"><?php echo __('Opciones'); ?></th>
						</tr>
					</thead>
					<tbody>
						<?php
						foreach ($vVehiculosExcedidos as $vVehiculosExcedido): ?>
	<tr>
		<td><?php if ($vVehiculosExcedido['Vehiculo']):?>
			<?php echo $this->Html->link($vVehiculosExcedido['Vehiculo']['descripcion'], array('controller' => 'vehiculos', 'action' => 'view', $vVehiculosExcedido['Vehiculo']['id'])); ?>
		<?php endif;?></td>
		<td><?php echo h($vVehiculosExcedido['VVehiculosExcedido']['patente']); ?>&nbsp;</td>
		<td><?php echo h($vVehiculosExcedido['VVehiculosExcedido']['tipo_autorizacion']); ?>&nbsp;</td>
		
		<td><?php if ($vVehiculosExcedido['Persona']):?>
			<?php echo $this->Html->link($vVehiculosExcedido['Persona']['nombre'], array('controller' => 'personas', 'action' => 'view', $vVehiculosExcedido['Persona']['id'])); ?>
		<?php endif;?></td>
		<td><?php echo h($vVehiculosExcedido['VVehiculosExcedido']['sector']); ?>&nbsp;</td>
		<td><?php echo $vVehiculosExcedido['VVehiculosExcedido']['interno']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link('<span class="glyphicon glyphicon-list-alt" title="Ver"></span>', array('action' => 'view', $vVehiculosExcedido['VVehiculosExcedido']['movimiento_id']), array('escape'=>false)); ?>
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
