<div id="page-container" class="row">
	<div id="page-content" class="col-sm-12">	
		<div class="vehiculos view">
			<h2><?php  echo __('VEHÍCULO'); ?></h2>
			<hr />
			<div class="row">
				<div class="col-sm-2">
					<strong>Patente</strong>
				</div>
				<div class="col-sm-4">
					<?php echo h($vehiculo['Vehiculo']['patente']); ?>&nbsp;
				</div>
				<div class="col-sm-2">
					<strong>Color</strong>
				</div>
				<div class="col-sm-4">
					<?php echo h($vehiculo['Vehiculo']['color']); ?>&nbsp;
				</div>
				<div class="col-sm-2">
					<strong>Descripcion</strong>
				</div>
				<div class="col-sm-4">
					<?php echo h($vehiculo['Vehiculo']['descripcion']); ?>&nbsp;
				</div>
				<div class="col-sm-2">
					<strong>Tipo Autorizacion</strong>
				</div>
				<div class="col-sm-4">
					<?php echo h($vehiculo['Vehiculo']['tipo_autorizacion']); ?>&nbsp;
				</div>
				<div class="col-sm-2">
					<strong>Fecha de Carga</strong>
				</div>
				<div class="col-sm-4">
					<?php echo h($vehiculo['Vehiculo']['fecha_carga']); ?>&nbsp;
				</div>
				<div class="col-sm-2">
					<strong>Usuario</strong>
				</div>
				<div class="col-sm-4">
					<?php if (isset($vehiculo['Usuario']['usuario_login'])): ?>
						<?php echo h($vehiculo['Usuario']['usuario_login']); ?>
					<?php endif; ?>
				</div>
			</div><!-- /.table-responsive -->
			
		</div><!-- /.view -->					
			<div class="related">
				<h3><?php echo __('MOVIMIENTOS'); ?></h3>
				<?php if (!empty($vehiculo['Movimiento'])): ?>

					<div class="table-responsive">
						<table class="table table-striped ">
							<thead>
								<tr>
									<th>Tipo Movimiento</th>
									<th>Sector</th>
									<th>Interno</th>
									<th>Fecha Carga</th>
									<th>Usuario</th>
								</tr>
							</thead>
							<tbody>
							<?php foreach ($vehiculo['Movimiento'] as $movimiento): ?>
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