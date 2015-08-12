<div id="page-container" class="row">
	<div class="form" id="search-form" <?php echo ($this->view === 'admin_index')? 'style="display:none;"' : ''?>>	<?php echo $this->Form->create('Movimiento', array(
		    'url' => array('controller' => 'Movimientos', 'action' => 'find'),
			'inputDefaults' => array('label' => false), 'role' => 'form'
		));?>						<div class="row">
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="MovimientoVehiculoIdCheck" onclick="buscar_vehiculo_id(this);" <?php echo (isset($this->passedArgs['vehiculo_id']) && $this->passedArgs['vehiculo_id'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_vehiculo_id() {
							if ($('#MovimientoVehiculoId').attr('disabled')) {
								$('#vehiculo_id_input').show('slow');
								$('#MovimientoVehiculoId').removeAttr('disabled');
								$('#MovimientoVehiculoId_').removeAttr('disabled');
								
							} else {
								$('#vehiculo_id_input').hide('slow');
								$('#MovimientoVehiculoId').val('');
								$('#MovimientoVehiculoId').attr('disabled', 'disabled');
								$('#MovimientoVehiculoId_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('vehiculo_id_check','Vehiculo');?></div>
				<div id="vehiculo_id_input"  <?php echo (isset($this->passedArgs['vehiculo_id'])  && $this->passedArgs['vehiculo_id'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('vehiculo_id', array('type'=>'text','div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["vehiculo_id"])  && $this->passedArgs["vehiculo_id"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="MovimientoPersonaIdCheck" onclick="buscar_persona_id(this);" <?php echo (isset($this->passedArgs['persona_id']) && $this->passedArgs['persona_id'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_persona_id() {
							if ($('#MovimientoPersonaId').attr('disabled')) {
								$('#persona_id_input').show('slow');
								$('#MovimientoPersonaId').removeAttr('disabled');
								$('#MovimientoPersonaId_').removeAttr('disabled');
								
							} else {
								$('#persona_id_input').hide('slow');
								$('#MovimientoPersonaId').val('');
								$('#MovimientoPersonaId').attr('disabled', 'disabled');
								$('#MovimientoPersonaId_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('persona_id_check','Persona');?></div>
				<div id="persona_id_input"  <?php echo (isset($this->passedArgs['persona_id'])  && $this->passedArgs['persona_id'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('persona_id', array('type'=>'text','div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["persona_id"])  && $this->passedArgs["persona_id"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="MovimientoTipoMovimientoCheck" onclick="buscar_tipo_movimiento(this);" <?php echo (isset($this->passedArgs['tipo_movimiento']) && $this->passedArgs['tipo_movimiento'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_tipo_movimiento() {
							if ($('#MovimientoTipoMovimiento').attr('disabled')) {
								$('#tipo_movimiento_input').show('slow');
								$('#MovimientoTipoMovimiento').removeAttr('disabled');
								$('#MovimientoTipoMovimiento_').removeAttr('disabled');
								
							} else {
								$('#tipo_movimiento_input').hide('slow');
								$('#MovimientoTipoMovimiento').val('');
								$('#MovimientoTipoMovimiento').attr('disabled', 'disabled');
								$('#MovimientoTipoMovimiento_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('tipo_movimiento_check','Tipo Movimiento');?></div>
				<div id="tipo_movimiento_input"  <?php echo (isset($this->passedArgs['tipo_movimiento'])  && $this->passedArgs['tipo_movimiento'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('tipo_movimiento', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["tipo_movimiento"])  && $this->passedArgs["tipo_movimiento"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="MovimientoSectorCheck" onclick="buscar_sector(this);" <?php echo (isset($this->passedArgs['sector']) && $this->passedArgs['sector'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_sector() {
							if ($('#MovimientoSector').attr('disabled')) {
								$('#sector_input').show('slow');
								$('#MovimientoSector').removeAttr('disabled');
								$('#MovimientoSector_').removeAttr('disabled');
								
							} else {
								$('#sector_input').hide('slow');
								$('#MovimientoSector').val('');
								$('#MovimientoSector').attr('disabled', 'disabled');
								$('#MovimientoSector_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('sector_check','Sector');?></div>
				<div id="sector_input"  <?php echo (isset($this->passedArgs['sector'])  && $this->passedArgs['sector'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('sector', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["sector"])  && $this->passedArgs["sector"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
					</div>
				<div class="row">
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="MovimientoInternoCheck" onclick="buscar_interno(this);" <?php echo (isset($this->passedArgs['interno']) && $this->passedArgs['interno'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_interno() {
							if ($('#MovimientoInterno').attr('disabled')) {
								$('#interno_input').show('slow');
								$('#MovimientoInterno').removeAttr('disabled');
								$('#MovimientoInterno_').removeAttr('disabled');
								
							} else {
								$('#interno_input').hide('slow');
								$('#MovimientoInterno').val('');
								$('#MovimientoInterno').attr('disabled', 'disabled');
								$('#MovimientoInterno_').attr('disabled', 'disabled');
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
				<li class="list-group-item"><?php echo $this->Html->link(__('New Movimiento'), array('action' => 'add'), array('class' => '')); ?></li>						<li class="list-group-item"><?php echo $this->Html->link(__('List Vehiculos'), array('controller' => 'vehiculos', 'action' => 'index'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('New Vehiculo'), array('controller' => 'vehiculos', 'action' => 'add'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('List Personas'), array('controller' => 'personas', 'action' => 'index'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('New Persona'), array('controller' => 'personas', 'action' => 'add'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('List Usuarios'), array('controller' => 'usuarios', 'action' => 'index'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('New Usuario'), array('controller' => 'usuarios', 'action' => 'add'), array('class' => '')); ?></li> 
			</ul><!-- /.list-group -->
			
<!--  		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .col-sm-3 -->
				
	<div id="page-content" class="col-sm-12">
<!-- 	<div id="page-content" class="col-sm-9"> -->

		<div class="movimientos index">
		
			<h2 style='display:inline;'><?php echo __('Movimientos'); ?></h2>
			<hr />
			<div class="table-responsive">
				<table cellpadding="0" cellspacing="0" class="table table-striped table-bordered">
					<thead>
						<tr>
																						<th><?php echo $this->Paginator->sort('Patente'); ?></th>
																						<th><?php echo $this->Paginator->sort('persona_id'); ?></th>
																						<th><?php echo $this->Paginator->sort('tipo_movimiento'); ?></th>
																						<th><?php echo $this->Paginator->sort('sector'); ?></th>
																						<th><?php echo $this->Paginator->sort('interno'); ?></th>
																													<th class="actions"><?php echo __('Opciones'); ?></th>
						</tr>
					</thead>
					<tbody>
						<?php
						foreach ($movimientos as $movimiento): ?>
	<tr>
		<td><?php if ($movimiento['Vehiculo']):?>
			<?php echo $this->Html->link($movimiento['Vehiculo']['patente'], array('controller' => 'vehiculos', 'action' => 'view', $movimiento['Vehiculo']['id'])); ?>
		<?php endif;?></td>
		<td><?php if ($movimiento['Persona']):?>
			<?php echo $this->Html->link($movimiento['Persona']['nombre'] . ', ' . $movimiento['Persona']['apellido'], array('controller' => 'personas', 'action' => 'view', $movimiento['Persona']['id'])); ?>
		<?php endif;?></td>
		<td><?php echo h($movimiento['Movimiento']['tipo_movimiento']); ?>&nbsp;</td>
		<td><?php echo h($movimiento['Movimiento']['sector']); ?>&nbsp;</td>
		<td><?php echo $movimiento['Movimiento']['interno']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link('<span class="glyphicon glyphicon-list-alt" title="Ver"></span>', array('action' => 'view', $movimiento['Movimiento']['id']), array('escape'=>false)); ?>
	
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
