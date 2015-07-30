
<?php echo $this->Html->css('tagsinput/jquery.tagit'); ?>

<div id="page-container" class="row">

<!-- 	<div id="sidebar" class="col-sm-3">
		
		<div class="actions">
		
			<ul class="list-group">
										<li class="list-group-item"><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Grupo.id')), null, __('Are you sure you want to delete # %s?', $this->Form->value('Grupo.id'))); ?></li>
										<li class="list-group-item"><?php echo $this->Html->link(__('List Grupos'), array('action' => 'index')); ?></li>
						<li class="list-group-item"><?php echo $this->Html->link(__('List Urls'), array('controller' => 'urls', 'action' => 'index')); ?> </li>
		<li class="list-group-item"><?php echo $this->Html->link(__('New Url'), array('controller' => 'urls', 'action' => 'add')); ?> </li>
		<li class="list-group-item"><?php echo $this->Html->link(__('List Usuarios'), array('controller' => 'usuarios', 'action' => 'index')); ?> </li>
		<li class="list-group-item"><?php echo $this->Html->link(__('New Usuario'), array('controller' => 'usuarios', 'action' => 'add')); ?> </li>
			</ul><!-- /.list-group -->
		
<!-- 		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .col-sm-3 -->
	
<!-- 	<div id="page-content" class="col-sm-9"> -->
	<div id="page-content" class="col-sm-12">

		<div class="grupos form">
		
			<?php echo $this->Form->create('Grupo', array('inputDefaults' => array('label' => false), 'role' => 'form')); ?>
				<fieldset>
					<h2><?php echo __('Admin Edit Grupo'); ?></h2>
			<div class="form-group">
	<?php echo $this->Form->label('id', Inflector::humanize('id'));?>
		<?php echo $this->Form->input('id', array('div' => false, "class" => 'form-control')); ?>
</div><!-- .form-group -->

<div class="form-group">
	<?php echo $this->Form->label('descripcion', Inflector::humanize('descripcion'));?>
		<?php echo $this->Form->input('descripcion', array('div' => false, "class" => 'form-control')); ?>
</div><!-- .form-group -->
		<?php echo $this->Form->label('Url', Inflector::humanize('Url'));?>
		<?php echo $this->Form->input('Url');?>
		<?php echo $this->Form->label('Usuario', Inflector::humanize('Usuario'));?>
		<?php echo $this->Form->input('Usuario');?>
				</fieldset>
			<?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
<?php echo $this->Form->end(); ?>
			
		</div><!-- /.form -->
			
	</div><!-- /#page-content .col-sm-9 -->

</div><!-- /#page-container .row-fluid -->