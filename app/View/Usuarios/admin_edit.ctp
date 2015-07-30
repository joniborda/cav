
<div id="page-container" class="row">

<!-- 	<div id="sidebar" class="col-sm-3">
		
		<div class="actions">
		
			<ul class="list-group">
							</ul><!-- /.list-group -->
		
<!-- 		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .col-sm-3 -->
	
<!-- 	<div id="page-content" class="col-sm-9"> -->
	<div id="page-content" class="col-sm-12">

		<div class="usuarios form p_form">
		
			<?php echo $this->Form->create('Usuario', array('inputDefaults' => array('label' => false), 'role' => 'form')); ?>
				<fieldset>
					<h2><?php echo __('Editar Usuario'); ?></h2>
				<hr />
						<div class="row">
									<div class="form-group col-sm-2">
	<?php echo $this->Form->label('nombre_completo', 'Nombre Completo'); ?>
</div><!-- .form-group -->
<div class="form-group col-sm-4">
		<?php echo $this->Form->input('nombre_completo', array('div' => false, "class" => 'form-control')); ?>
</div><!-- .form-group -->

						<div class="form-group col-sm-2">
	<?php echo $this->Form->label('password', 'Password'); ?>
</div><!-- .form-group -->
<div class="form-group col-sm-4">
		<?php echo $this->Form->input('password', array('div' => false, "class" => 'form-control', 'value' => '')); ?>
</div><!-- .form-group -->

			</div>
							<div class="row">
									<div class="form-group col-sm-2">
	<?php echo $this->Form->label('usuario_login', 'Usuario Login'); ?>
</div><!-- .form-group -->
<div class="form-group col-sm-4">
		<?php echo $this->Form->input('usuario_login', array('div' => false, "class" => 'form-control')); ?>
</div><!-- .form-group -->

						<div class="form-group col-sm-2">
	<?php echo $this->Form->label('borrado', 'Borrado'); ?>
</div><!-- .form-group -->
<div class="form-group col-sm-4">
		<?php echo $this->Form->input('borrado', array('div' => false, "class" => 'form-control f_checkbox')); ?>
</div><!-- .form-group -->

			</div>
							<div class="row">
									<div class="form-group col-sm-2">
	<?php echo $this->Form->label('id_anterior', 'Id Anterior'); ?>
</div><!-- .form-group -->
<div class="form-group col-sm-4">
		<?php echo $this->Form->input('id_anterior', array('div' => false, "class" => 'form-control')); ?>
</div><!-- .form-group -->

									</div>
							<div class="row">
															<div class="form-group col-sm-2">
	<?php echo $this->Form->label('apellido', 'Apellido'); ?>
</div><!-- .form-group -->
<div class="form-group col-sm-4">
		<?php echo $this->Form->input('apellido', array('div' => false, "class" => 'form-control')); ?>
</div><!-- .form-group -->

			</div>
			
			
			
			<div class="row">
															<div class="form-group col-sm-2">
	<?php echo $this->Form->label('nombre', 'Nombre'); ?>
</div><!-- .form-group -->
<div class="form-group col-sm-4">
		<?php echo $this->Form->input('nombre', array('div' => false, "class" => 'form-control')); ?>
</div><!-- .form-group -->

			</div>
			
			<div class="row">
															<div class="form-group col-sm-2">
	<?php echo $this->Form->label('email', 'email'); ?>
</div><!-- .form-group -->
<div class="form-group col-sm-4">
		<?php echo $this->Form->input('email', array('div' => false, "class" => 'form-control')); ?>
</div><!-- .form-group -->

			</div>
							<div class="row">
									</div>
						<?php echo $this->Form->input('Grupo');?>
				</fieldset>
			<?php echo $this->Form->submit('Editar', array('class' => 'btn btn-large btn-primary')); ?>
<?php echo $this->Form->end(); ?>
			
		</div><!-- /.form -->
			
	</div><!-- /#page-content .col-sm-9 -->

</div><!-- /#page-container .row-fluid -->
