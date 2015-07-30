
<div id="page-container" class="row">

<!-- 	<div id="sidebar" class="col-sm-3">
		
		<div class="actions">
			
			<ul class="list-group">			
								
			</ul><!-- /.list-group -->
			
<!-- 		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .span3 -->
				
		<div id="page-content" class="col-sm-12">
<!-- 	<div id="page-content" class="col-sm-9"> -->
		
		<div class="usuarios view">

			<h2><?php  echo __('Usuario'); ?></h2>
			<hr />
			<div class="table-responsive">
				<table class="table table-striped table-bordered">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($usuario['Usuario']['id']); ?>
			&nbsp;
		</td>
		<td><strong><?php echo __('Nombre Completo'); ?></strong></td>
		<td>
			<?php echo h($usuario['Usuario']['nombre_completo']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Password'); ?></strong></td>
		<td>
			<?php echo h($usuario['Usuario']['password']); ?>
			&nbsp;
		</td>
		<td><strong><?php echo __('Usuario Login'); ?></strong></td>
		<td>
			<?php echo h($usuario['Usuario']['usuario_login']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Borrado'); ?></strong></td>
		<td>
			<?php echo h($usuario['Usuario']['borrado']); ?>
			&nbsp;
		</td>
		<td><strong><?php echo __('Id Anterior'); ?></strong></td>
		<td>
			<?php echo h($usuario['Usuario']['id_anterior']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Modified'); ?></strong></td>
		<td>
			<?php echo h($usuario['Usuario']['modified']); ?>
			&nbsp;
		</td>
		<td><strong><?php echo __('Created'); ?></strong></td>
		<td>
			<?php echo h($usuario['Usuario']['created']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Apellido'); ?></strong></td>
		<td>
			<?php echo h($usuario['Usuario']['apellido']); ?>
			&nbsp;
		</td>
					</tbody>
				</table><!-- /.table table-striped table-bordered -->
			</div><!-- /.table-responsive -->
			
		</div><!-- /.view -->

					
			<div class="related">

				<h3><?php echo __('Related Grupos'); ?></h3>
				
				<?php if (!empty($usuario['Grupo'])): ?>
					
					<div class="table-responsive">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
											<th><?php echo __('Id'); ?></th>
		<th><?php echo __('Descripcion'); ?></th>
									<th class="actions"><?php echo __('Actions'); ?></th>
								</tr>
							</thead>
							<tbody>
									<?php
										$i = 0;
										foreach ($usuario['Grupo'] as $grupo): ?>
		<tr>
			<td><?php echo $grupo['id']; ?></td>
			<td><?php echo $grupo['descripcion']; ?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View'), array('controller' => 'grupos', 'action' => 'view', $grupo['id']), array('class' => 'btn btn-default btn-xs')); ?>
				<?php echo $this->Html->link(__('Edit'), array('controller' => 'grupos', 'action' => 'edit', $grupo['id']), array('class' => 'btn btn-default btn-xs')); ?>
				<?php echo $this->Form->postLink(__('Delete'), array('controller' => 'grupos', 'action' => 'delete', $grupo['id']), array('class' => 'btn btn-default btn-xs'), __('Are you sure you want to delete # %s?', $grupo['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
							</tbody>
						</table><!-- /.table table-striped table-bordered -->
					</div><!-- /.table-responsive -->
					
				<?php endif; ?>

				
				<div class="actions">
					<?php echo $this->Html->link('<i class="icon-plus icon-white"></i> '.__('New Grupo'), array('controller' => 'grupos', 'action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); ?>				</div><!-- /.actions -->
				
			</div><!-- /.related -->

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->
