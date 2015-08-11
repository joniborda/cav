
<div id="page-container" class="row">

<!-- 	<div id="sidebar" class="col-sm-3">
		
		<div class="actions">
			
			<ul class="list-group">			
								
			</ul><!-- /.list-group -->
			
<!-- 		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .span3 -->
				
		<div id="page-content" class="col-sm-12">
<!-- 	<div id="page-content" class="col-sm-9"> -->
		
		<div class="personas view">

			<h2><?php  echo __('PERSONA'); ?></h2>
			<hr />
			<div class="table-responsive">
				<table class="table table-striped">
					<tbody>
						<tr>
							<td class="col-sm-2"><strong>
								<?php echo __('Nombre'); ?></strong></td>
							<td class="col-sm-4">
								<?php echo h($persona['Persona']['nombre']); ?>
							</td>
						</tr>
						<tr>
							<td class="col-sm-2">
								<strong><?php echo __('Apellido'); ?></strong></td>
							<td class="col-sm-4">
			<?php echo h($persona['Persona']['apellido']); ?>
			&nbsp;
		</td>
		<td class="col-sm-2"><strong><?php echo __('Numero Documento'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($persona['Persona']['numero_documento']); ?>
			&nbsp;
		</td>
</tr>
<tr>
		<td class="col-sm-2"><strong><?php echo __('Telefono'); ?></strong></td>
		<td class="col-sm-4">
			<?php echo h($persona['Persona']['telefono']); ?>
			&nbsp;
		</td>
					</tbody>
				</table><!-- /.table table-striped table-bordered -->
			</div><!-- /.table-responsive -->
			
		</div><!-- /.view -->

					
			<div class="related">
			
				<h3><?php echo __('MOVIMIENTOS'); ?></h3>
				
				<?php if (!empty($persona['Movimiento'])): ?>
					
					<div class="table-responsive">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
		<th><?php echo __('Vehiculo Id'); ?></th>
		<th><?php echo __('Persona Id'); ?></th>
		<th><?php echo __('Tipo Movimiento'); ?></th>
		<th><?php echo __('Sector'); ?></th>
		<th><?php echo __('Interno'); ?></th>
		<th><?php echo __('Fecha Carga'); ?></th>
		<th><?php echo __('Usuario Id'); ?></th>
									<th class="actions"><?php echo __('OPCIONES'); ?></th>
								</tr>
							</thead>
							<tbody>
									<?php
										$i = 0;
										foreach ($persona['Movimiento'] as $movimiento): ?>
		<tr>
			<td><?php echo $movimiento['vehiculo_id']; ?></td>
			<td><?php echo $movimiento['persona_id']; ?></td>
			<td><?php echo $movimiento['tipo_movimiento']; ?></td>
			<td><?php echo $movimiento['sector']; ?></td>
			<td><?php echo $movimiento['interno']; ?></td>
			<td><?php echo $movimiento['fecha_carga']; ?></td>
			<td><?php echo $movimiento['usuario_id']; ?></td>
		<td class="actions">
			<?php echo $this->Html->link('<span class="glyphicon glyphicon-list-alt" title="Ver"></span>', array('controller' => 'movimientos', 'action' => 'view', $movimiento['id']), array('escape'=>false)); ?>
			<?php echo $this->Html->link('<span class="glyphicon glyphicon-wrench" title="Editar"></span>', array('controller' => 'movimientos', 'action' => 'edit', $movimiento['id']), array('escape'=>false)); ?>
			<?php echo $this->Form->postLink('<span class="glyphicon glyphicon-trash" title="Borrar"></span>', array('controller' => 'movimientos', 'action' => 'delete', $movimiento['id']), array('escape'=>false), __('¿Estas seguro que desea borrar # %s?', $movimiento['id'])); ?>
		</td>
		</tr>
	<?php endforeach; ?>
							</tbody>
						</table><!-- /.table table-striped table-bordered -->
					</div><!-- /.table-responsive -->
					
				<?php endif; ?>

				
				<div class="actions">
					<?php echo $this->Html->link('<i class="icon-plus icon-white"></i> '.__('NUEVO MOVIMIENTO'), array('controller' => 'movimientos', 'action' => 'add',h($persona['Persona']['id'])),array('class' => 'btn btn-primary', 'escape' => false)); ?>				</div><!-- /.actions -->
				
			</div><!-- /.related -->

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->
