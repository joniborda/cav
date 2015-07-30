
<div id="page-container" class="row">

	<div id="page-content" class="col-sm-12">

		<div class="vehiculos form p_form">
		
			<?php echo $this->Form->create('Vehiculo', array('inputDefaults' => array('label' => false), 'role' => 'form')); ?>
				<fieldset>
					<h2><?php echo __('Editar Vehiculo'); ?>										</h2>
				<hr />
		<?php echo $this->Form->label('patente', 'Patente'); ?>
		<?php echo $this->Form->input('patente', array('div' => false, "class" => 'form-control'));?>

		<?php echo $this->Form->label('color', 'Color'); ?>
		<?php echo $this->Form->input('color', array('div' => false, "class" => 'form-control'));?>

		<?php echo $this->Form->label('descripcion', 'Descripcion'); ?>
		<?php echo $this->Form->input('descripcion', array('div' => false, "class" => 'form-control'));?>

		<?php echo $this->Form->label('tipo_autorizacion', 'Tipo Autorizacion'); ?>
		<?php echo $this->Form->input('tipo_autorizacion', array('div' => false, "class" => 'form-control'));?>

			
			<div class="related">
				<h3><?php echo __('Movimientos'); ?></h3>
				
				<?php if (!empty($this->data['Movimiento'])): ?>
					
					<div class="table-responsive">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
											<th><?php echo __('Id'); ?></th>
		<th><?php echo __('Vehiculo Id'); ?></th>
		<th><?php echo __('Persona Id'); ?></th>
		<th><?php echo __('Tipo Movimiento'); ?></th>
		<th><?php echo __('Sector'); ?></th>
		<th><?php echo __('Interno'); ?></th>
		<th><?php echo __('Fecha Carga'); ?></th>
		<th><?php echo __('Usuario Id'); ?></th>
									<th class="actions"><?php echo __('Actions'); ?></th>
								</tr>
							</thead>
							<tbody>
									<?php
										$i = 0;
										foreach ($this->data['Movimiento'] as $movimiento): ?>
		<tr>
			<td><?php echo h($movimiento['id']); ?></td>
			<td><?php echo h($movimiento['vehiculo_id']); ?></td>
			<td><?php echo h($movimiento['persona_id']); ?></td>
			<td><?php echo h($movimiento['tipo_movimiento']); ?></td>
			<td><?php echo h($movimiento['sector']); ?></td>
			<td><?php echo h($movimiento['interno']); ?></td>
			<td><?php echo h($movimiento['fecha_carga']); ?></td>
			<td><?php echo h($movimiento['usuario_id']); ?></td>
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
					<?php echo $this->Html->link('<i class="icon-plus icon-white"></i> '.__('Nuevo Movimiento'), array('controller' => 'movimientos', 'action' => 'add',h($this->data['Vehiculo']['id'])),array('class' => 'btn btn-primary', 'escape' => false)); ?>				</div><!-- /.actions -->
				
			</div><!-- /.related -->

			
				</fieldset>
			<?php echo $this->Form->submit('Editar', array('class' => 'btn btn-large btn-primary')); ?>
<?php echo $this->Form->end(); ?>
			
		</div><!-- /.form -->
			
	</div><!-- /#page-content .col-sm-9 -->

</div><!-- /#page-container .row-fluid -->

