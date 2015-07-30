
<div id="page-container" class="row">

<!-- 	<div id="sidebar" class="col-sm-3">
		
		<div class="actions">
		
			<ul class="list-group">
										<li class="list-group-item"><?php echo $this->Html->link(__('List Urls'), array('action' => 'index')); ?></li>
						<li class="list-group-item"><?php echo $this->Html->link(__('List Grupos'), array('controller' => 'grupos', 'action' => 'index')); ?> </li>
		<li class="list-group-item"><?php echo $this->Html->link(__('New Grupo'), array('controller' => 'grupos', 'action' => 'add')); ?> </li>
			</ul><!-- /.list-group -->
		
<!-- 		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .col-sm-3 -->
	
<!-- 	<div id="page-content" class="col-sm-9"> -->
	<div id="page-content" class="col-sm-12">

		<div class="urls form">
		
			<?php echo $this->Form->create('Url', array('inputDefaults' => array('label' => false), 'role' => 'form')); ?>
				<fieldset>
					<h2><?php echo __('Admin Add Url'); ?></h2>
			<div class="form-group">
	<?php echo $this->Form->label('descripcion', Inflector::humanize('descripcion') . ' (Ejemplo: "admin/l24321_denunciantes/edit" )');?>
		<?php echo $this->Form->input('descripcion', array('div' => false, "class" => 'form-control')); ?>
</div><!-- .form-group -->
	<?php echo $this->Form->label('Grupo', Inflector::humanize('Grupo'));?>
	<?php echo $this->Form->input('Grupo');?>
				</fieldset>
			<?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
<?php echo $this->Form->end(); ?>
			
		</div><!-- /.form -->
			
	</div><!-- /#page-content .col-sm-9 -->

</div><!-- /#page-container .row-fluid -->
