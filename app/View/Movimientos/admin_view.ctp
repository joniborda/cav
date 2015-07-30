
<div id="page-container" class="row">

<!-- 	<div id="sidebar" class="col-sm-3">
		
		<div class="actions">
			
			<ul class="list-group">			
								
			</ul><!-- /.list-group -->
			
<!-- 		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .span3 -->
				
		<div id="page-content" class="col-sm-12">
<!-- 	<div id="page-content" class="col-sm-9"> -->
		
		<div class="movimientos view">

			<h2><?php  echo __('Movimiento'); ?></h2>
			<hr />
			<div class="table-responsive">
				<table class="table table-striped table-bordered">
					<tbody>
													<tr>
								<td class="col-sm-2"><strong>Persona</strong></td>
								<td class="col-sm-4">
								<?php echo $this->Html->link(
										$movimiento['Persona']['virtual'], 
										array('controller' => 'personas', 'action' => 'view', $movimiento['Persona']['id']), array('class' => '')); ?>
								&nbsp;
								</td>
							</tr>							<tr>
		<td class="col-sm-2"><strong><?php echo __('Id'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($movimiento['Movimiento']['id']); ?>
			&nbsp;
		</td>
		<td class="col-sm-2"><strong><?php echo __('Vehiculo'); ?></strong></td>
		<td class="col-sm-4">
		<?php if (isset($movimiento['Vehiculo']['descripcion'])):?>
			<?php echo $this->Html->link($movimiento['Vehiculo']['descripcion'], array('controller' => 'vehiculos', 'action' => 'view', $movimiento['Vehiculo']['id']), array('class' => '')); ?>
		<?php endif; ?>
			&nbsp;
		</td>
</tr>
<tr>
		<td class="col-sm-2"><strong><?php echo __('Tipo Movimiento'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($movimiento['Movimiento']['tipo_movimiento']); ?>
			&nbsp;
		</td>
		<td class="col-sm-2"><strong><?php echo __('Sector'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($movimiento['Movimiento']['sector']); ?>
			&nbsp;
		</td>
</tr>
<tr>
		<td class="col-sm-2"><strong><?php echo __('Interno'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($movimiento['Movimiento']['interno']); ?>
			&nbsp;
		</td>
					</tbody>
				</table><!-- /.table table-striped table-bordered -->
			</div><!-- /.table-responsive -->
			
		</div><!-- /.view -->

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->
