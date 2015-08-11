<div id="page-container" class="row">
		<div id="page-content" class="col-sm-12">		
		<div class="movimientos view">
			<h2><?php  echo __('MOVIMIENTO'); ?></h2>
			<hr />
			<div class="table-responsive">
				<table class="table table-striped table-bordered">
					<tbody>
						<tr>
							<td class="col-sm-2"><strong>Persona</strong></td>
							<td class="col-sm-4">
							<?php echo $this->Html->link($movimiento['Persona']['apellido'] . ', ' . $movimiento['Persona']['nombre'], array('controller' => 'personas', 'action' => 'view', $movimiento['Persona']['id']), array('class' => '')); ?>
							</td>
						</tr>
						<tr>
							<td class="col-sm-2"><strong><?php echo __('Vehiculo'); ?></strong></td>
							<td class="col-sm-4">
								<?php if (isset($movimiento['Vehiculo']['descripcion'])):?>
									<?php echo $this->Html->link($movimiento['Vehiculo']['descripcion'], array('controller' => 'vehiculos', 'action' => 'view', $movimiento['Vehiculo']['id']), array('class' => '')); ?>
								<?php endif; ?>
							</td>
						</tr>
						<tr>
							<td class="col-sm-2"><strong><?php echo __('Tipo Movimiento'); ?></strong></td>
							<td class="col-sm-4">
								<?php echo h($movimiento['Movimiento']['tipo_movimiento']); ?>
								&nbsp;
							</td>
						</tr>
						<tr>
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
						</tr>
					</tbody>
				</table><!-- /.table table-striped table-bordered -->
			</div><!-- /.table-responsive -->
		</div><!-- /.view -->
	</div><!-- /#page-content .span9 -->
</div><!-- /#page-container .row-fluid -->