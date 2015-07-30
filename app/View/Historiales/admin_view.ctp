
<div id="page-container" class="row">

<!-- 	<div id="sidebar" class="col-sm-3">
		
		<div class="actions">
			
			<ul class="list-group">			
								
			</ul><!-- /.list-group -->
			
<!-- 		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .span3 -->
				
		<div id="page-content" class="col-sm-12">
<!-- 	<div id="page-content" class="col-sm-9"> -->
		
		<div class="historiales view">

			<h2><?php  echo __('Historiale'); ?></h2>
			<hr />
			<div class="table-responsive">
				<table class="table table-striped table-bordered">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($historiale['Historiale']['id']); ?>
			&nbsp;
		</td>
		<td><strong><?php echo __('Usuario'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($historiale['Usuario']['nombre_completo'], array('controller' => 'usuarios', 'action' => 'view', $historiale['Usuario']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Url'); ?></strong></td>
		<td>
			<?php echo h($historiale['Historiale']['url']); ?>
			&nbsp;
		</td>
		<td><strong><?php echo __('Parametros'); ?></strong></td>
		<td>
			<?php echo h($historiale['Historiale']['parametros']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Navegador'); ?></strong></td>
		<td>
			<?php echo h($historiale['Historiale']['navegador']); ?>
			&nbsp;
		</td>
		<td><strong><?php echo __('Ip'); ?></strong></td>
		<td>
			<?php echo h($historiale['Historiale']['ip']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Fecha'); ?></strong></td>
		<td>
			<?php echo h($historiale['Historiale']['fecha']); ?>
			&nbsp;
		</td>
					</tbody>
				</table><!-- /.table table-striped table-bordered -->
			</div><!-- /.table-responsive -->
			
		</div><!-- /.view -->

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->
