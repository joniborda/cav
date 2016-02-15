<div id="page-container" class="row">
	<div class="form" id="search-form" <?php echo ($this->view === 'admin_index')? 'style="display:none;"' : ''?>>	<?php echo $this->Form->create('VVehiculosAdentro', array(
		    'url' => array('controller' => 'VVehiculosAdentros', 'action' => 'find'),
			'inputDefaults' => array('label' => false), 'role' => 'form'
		));?>						<div class="row">
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VVehiculosAdentroPatenteCheck" onclick="buscar_patente(this);" <?php echo (isset($this->passedArgs['patente']) && $this->passedArgs['patente'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_patente() {
							if ($('#VVehiculosAdentroPatente').attr('disabled')) {
								$('#patente_input').show('slow');
								$('#VVehiculosAdentroPatente').removeAttr('disabled');
								$('#VVehiculosAdentroPatente_').removeAttr('disabled');
								
							} else {
								$('#patente_input').hide('slow');
								$('#VVehiculosAdentroPatente').val('');
								$('#VVehiculosAdentroPatente').attr('disabled', 'disabled');
								$('#VVehiculosAdentroPatente_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('patente_check','Patente');?></div>
				<div id="patente_input"  <?php echo (isset($this->passedArgs['patente'])  && $this->passedArgs['patente'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('patente', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["patente"])  && $this->passedArgs["patente"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VVehiculosAdentroTipoAutorizacionCheck" onclick="buscar_tipo_autorizacion(this);" <?php echo (isset($this->passedArgs['tipo_autorizacion']) && $this->passedArgs['tipo_autorizacion'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_tipo_autorizacion() {
							if ($('#VVehiculosAdentroTipoAutorizacion').attr('disabled')) {
								$('#tipo_autorizacion_input').show('slow');
								$('#VVehiculosAdentroTipoAutorizacion').removeAttr('disabled');
								$('#VVehiculosAdentroTipoAutorizacion_').removeAttr('disabled');
								
							} else {
								$('#tipo_autorizacion_input').hide('slow');
								$('#VVehiculosAdentroTipoAutorizacion').val('');
								$('#VVehiculosAdentroTipoAutorizacion').attr('disabled', 'disabled');
								$('#VVehiculosAdentroTipoAutorizacion_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('tipo_autorizacion_check','Tipo Autorizacion');?></div>
				<div id="tipo_autorizacion_input"  <?php echo (isset($this->passedArgs['tipo_autorizacion'])  && $this->passedArgs['tipo_autorizacion'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('tipo_autorizacion', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["tipo_autorizacion"])  && $this->passedArgs["tipo_autorizacion"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VVehiculosAdentroMovimientoIdCheck" onclick="buscar_movimiento_id(this);" <?php echo (isset($this->passedArgs['movimiento_id']) && $this->passedArgs['movimiento_id'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_movimiento_id() {
							if ($('#VVehiculosAdentroMovimientoId').attr('disabled')) {
								$('#movimiento_id_input').show('slow');
								$('#VVehiculosAdentroMovimientoId').removeAttr('disabled');
								$('#VVehiculosAdentroMovimientoId_').removeAttr('disabled');
								
							} else {
								$('#movimiento_id_input').hide('slow');
								$('#VVehiculosAdentroMovimientoId').val('');
								$('#VVehiculosAdentroMovimientoId').attr('disabled', 'disabled');
								$('#VVehiculosAdentroMovimientoId_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('movimiento_id_check','Movimiento');?></div>
				<div id="movimiento_id_input"  <?php echo (isset($this->passedArgs['movimiento_id'])  && $this->passedArgs['movimiento_id'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('movimiento_id', array('type'=>'text','div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["movimiento_id"])  && $this->passedArgs["movimiento_id"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VVehiculosAdentroPersonaIdCheck" onclick="buscar_persona_id(this);" <?php echo (isset($this->passedArgs['persona_id']) && $this->passedArgs['persona_id'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_persona_id() {
							if ($('#VVehiculosAdentroPersonaId').attr('disabled')) {
								$('#persona_id_input').show('slow');
								$('#VVehiculosAdentroPersonaId').removeAttr('disabled');
								$('#VVehiculosAdentroPersonaId_').removeAttr('disabled');
								
							} else {
								$('#persona_id_input').hide('slow');
								$('#VVehiculosAdentroPersonaId').val('');
								$('#VVehiculosAdentroPersonaId').attr('disabled', 'disabled');
								$('#VVehiculosAdentroPersonaId_').attr('disabled', 'disabled');
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
					<input type="checkbox" id="VVehiculosAdentroSectorCheck" onclick="buscar_sector(this);" <?php echo (isset($this->passedArgs['sector']) && $this->passedArgs['sector'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_sector() {
							if ($('#VVehiculosAdentroSector').attr('disabled')) {
								$('#sector_input').show('slow');
								$('#VVehiculosAdentroSector').removeAttr('disabled');
								$('#VVehiculosAdentroSector_').removeAttr('disabled');
								
							} else {
								$('#sector_input').hide('slow');
								$('#VVehiculosAdentroSector').val('');
								$('#VVehiculosAdentroSector').attr('disabled', 'disabled');
								$('#VVehiculosAdentroSector_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo $this->Form->label('sector_check','Sector');?></div>
				<div id="sector_input"  <?php echo (isset($this->passedArgs['sector'])  && $this->passedArgs['sector'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('sector', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["sector"])  && $this->passedArgs["sector"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
															<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="VVehiculosAdentroInternoCheck" onclick="buscar_interno(this);" <?php echo (isset($this->passedArgs['interno']) && $this->passedArgs['interno'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_interno() {
							if ($('#VVehiculosAdentroInterno').attr('disabled')) {
								$('#interno_input').show('slow');
								$('#VVehiculosAdentroInterno').removeAttr('disabled');
								$('#VVehiculosAdentroInterno_').removeAttr('disabled');
								
							} else {
								$('#interno_input').hide('slow');
								$('#VVehiculosAdentroInterno').val('');
								$('#VVehiculosAdentroInterno').attr('disabled', 'disabled');
								$('#VVehiculosAdentroInterno_').attr('disabled', 'disabled');
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
	<div id="page-content" class="col-sm-12">
		<div class="vVehiculosAdentros index">
			<h2 style='display:inline;'>VEHÍCULOS ADENTRO</h2>
			<hr />
			<div class="table-responsive">
				<table cellpadding="0" cellspacing="0" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th><?php echo $this->Paginator->sort('vehiculo_id'); ?></th>
							<th><?php echo $this->Paginator->sort('patente'); ?></th>
							<th><?php echo $this->Paginator->sort('tipo_autorizacion', 'Tipo de autorización'); ?></th>
							
							<th><?php echo $this->Paginator->sort('sector'); ?></th>
							<th><?php echo $this->Paginator->sort('interno'); ?></th>
							<th class="actions"><?php echo __('Opciones'); ?></th>
						</tr>
					</thead>
					<tbody>
				<?php foreach ($vVehiculosAdentros as $vVehiculosAdentro): ?>
				<tr>
					<td>
						<?php if ($vVehiculosAdentro['Vehiculo']):?>
						<?php echo $this->Html->link($vVehiculosAdentro['Vehiculo']['descripcion'], array('controller' => 'vehiculos', 'action' => 'view', $vVehiculosAdentro['Vehiculo']['id'])); ?>
						<?php endif;?>
					</td>
					<td><?php echo h($vVehiculosAdentro['VVehiculosAdentro']['patente']); ?>&nbsp;</td>
					<td><?php echo h($vVehiculosAdentro['VVehiculosAdentro']['tipo_autorizacion']); ?>&nbsp;</td>
					<td><?php echo h($vVehiculosAdentro['VVehiculosAdentro']['sector']); ?>&nbsp;</td>
					<td><?php echo $vVehiculosAdentro['VVehiculosAdentro']['interno']; ?>&nbsp;</td>
					<td class="actions">
						<?php echo $this->Html->link('<span class="glyphicon glyphicon-list-alt" title="Ver"></span>', array('controller' => 'movimientos', 'action' => 'view', $vVehiculosAdentro['Movimiento']['id']), array('escape'=>false)); ?>
						<?php echo $this->Form->create('Movimiento', array(
		    				'url' => array('controller' => 'movimientos', 'action' => 'add'),
							'inputDefaults' => array('label' => false), 
							'role' => 'form'));?>

							<?php echo $this->Form->input('tipo_movimiento', array('type' => 'hidden', 'value' => 'SALIDA'));?>
							<?php echo $this->Form->input('vehiculo_id', array('type' => 'hidden', 'value' => $vVehiculosAdentro['Vehiculo']['id']));?>
							<a href="#" class="submit_salida" title="Salida">
								<span class="glyphicon glyphicon-download">
								</span>
							</a>
						<?php echo $this->Form->end();?>
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
<script type="text/javascript">
	
	$('.submit_salida').bind('click', function(event) {
		event.preventDefault();

		$(this).closest('form').submit();
	});
</script>