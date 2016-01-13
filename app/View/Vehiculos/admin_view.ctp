<div id="page-container" class="row">
		<div id="page-content" class="col-sm-12">
		
		<div class="vehiculos view">

			<h2><?php  echo __('VEHÍCULO'); ?></h2>
			<hr />
			<div class="table-responsive">
				<table class="table table-striped">
					<tbody>
						<tr>
		<td class="col-sm-2"><strong><?php echo __('Patente'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($vehiculo['Vehiculo']['patente']); ?>
			&nbsp;
		</td>
</tr>
<tr>
		<td class="col-sm-2"><strong><?php echo __('Color'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($vehiculo['Vehiculo']['color']); ?>
			&nbsp;
		</td>
		<td class="col-sm-2"><strong><?php echo __('Descripcion'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($vehiculo['Vehiculo']['descripcion']); ?>
			&nbsp;
		</td>
</tr>
<tr>
		<td class="col-sm-2"><strong><?php echo __('Tipo Autorizacion'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($vehiculo['Vehiculo']['tipo_autorizacion']); ?>
			&nbsp;
		</td>
					</tbody>
				</table><!-- /.table table-striped table-bordered -->
			</div><!-- /.table-responsive -->
			
		</div><!-- /.view -->					
			<div class="related">
			
				<h3><?php echo __('MOVIMIENTOS'); ?></h3>
				
				<?php if (!empty($vehiculo['Movimiento'])): ?>
					
					<div class="table-responsive">
						<table class="table table-striped ">
							<thead>
								<tr>
									<th><?php echo __('Tipo Movimiento'); ?></th>
									<th><?php echo __('Sector'); ?></th>
									<th><?php echo __('Interno'); ?></th>
									<th><?php echo __('Fecha Carga'); ?></th>
									<th><?php echo __('Usuario Id'); ?></th>
								</tr>
							</thead>
							<tbody>
							<?php
								$i = 0;
								foreach ($vehiculo['Movimiento'] as $movimiento): ?>
								<tr>
									<td><?php echo $movimiento['tipo_movimiento']; ?></td>
									<td><?php echo $movimiento['sector']; ?></td>
									<td><?php echo $movimiento['interno']; ?></td>
									<td><?php echo $movimiento['fecha_carga']; ?></td>
									<td><?php echo $movimiento['usuario_id']; ?></td>
								</tr>
							<?php endforeach; ?>
							</tbody>
						</table><!-- /.table table-striped table-bordered -->
					</div><!-- /.table-responsive -->
					
				<?php endif; ?>
			<!-- /.actions -->
			</div><!-- /.related -->
	</div><!-- /#page-content .span9 -->
</div><!-- /#page-container .row-fluid -->