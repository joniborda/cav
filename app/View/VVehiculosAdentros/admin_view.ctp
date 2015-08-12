
<div id="page-container" class="row">

<!-- 	<div id="sidebar" class="col-sm-3">
		
		<div class="actions">
			
			<ul class="list-group">			
								
			</ul><!-- /.list-group -->
			
<!-- 		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .span3 -->
				
		<div id="page-content" class="col-sm-12">
<!-- 	<div id="page-content" class="col-sm-9"> -->
		
		<div class="vVehiculosAdentros view">

			<h2><?php  echo __('V Vehiculos Adentro'); ?></h2>
			<hr />
			<div class="table-responsive">
				<table class="table table-striped ">
					<tbody>
													<tr>
								<td class="col-sm-2"><strong>Persona</strong></td>
								<td class="col-sm-4">
								<?php echo $this->Html->link(
										$vVehiculosAdentro['Persona']['virtual'], 
										array('controller' => 'personas', 'action' => 'view', $vVehiculosAdentro['Persona']['id']), array('class' => '')); ?>
								&nbsp;
								</td>
							</tr>							<tr>
		<td class="col-sm-2"><strong><?php echo __('Vehiculo'); ?></strong></td>
		<td class="col-sm-4">
		<?php if (isset($vVehiculosAdentro['Vehiculo']['descripcion'])):?>
			<?php echo $this->Html->link($vVehiculosAdentro['Vehiculo']['descripcion'], array('controller' => 'vehiculos', 'action' => 'view', $vVehiculosAdentro['Vehiculo']['id']), array('class' => '')); ?>
		<?php endif; ?>
			&nbsp;
		</td>
		<td class="col-sm-2"><strong><?php echo __('Patente'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($vVehiculosAdentro['VVehiculosAdentro']['patente']); ?>
			&nbsp;
		</td>
</tr>
<tr>
		<td class="col-sm-2"><strong><?php echo __('Tipo Autorizacion'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($vVehiculosAdentro['VVehiculosAdentro']['tipo_autorizacion']); ?>
			&nbsp;
		</td>
		<td class="col-sm-2"><strong><?php echo __('Movimiento'); ?></strong></td>
		<td class="col-sm-4">
		<?php if (isset($vVehiculosAdentro['Movimiento']['id'])):?>
			<?php echo $this->Html->link($vVehiculosAdentro['Movimiento']['id'], array('controller' => 'movimientos', 'action' => 'view', $vVehiculosAdentro['Movimiento']['id']), array('class' => '')); ?>
		<?php endif; ?>
			&nbsp;
		</td>
</tr>
<tr>
		<td class="col-sm-2"><strong><?php echo __('Sector'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($vVehiculosAdentro['VVehiculosAdentro']['sector']); ?>
			&nbsp;
		</td>
		<td class="col-sm-2"><strong><?php echo __('Interno'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($vVehiculosAdentro['VVehiculosAdentro']['interno']); ?>
			&nbsp;
		</td>
</tr>
					</tbody>
				</table><!-- /.table table-striped table-bordered -->
			</div><!-- /.table-responsive -->
			
		</div><!-- /.view -->

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->
