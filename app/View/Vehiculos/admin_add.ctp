<div id="page-container" class="row">
	<div id="page-content" class="col-sm-12">
		<div class="vehiculos form p_form">		
			<?php echo $this->Form->create('Vehiculo', array('inputDefaults' => array('label' => false), 'role' => 'form')); ?>
			<fieldset>
				<h2><?php echo __('Cargar Vehículo'); ?></h2>
				<hr />
				<?php echo $this->Form->label('patente', 'Patente'); ?>
				<?php echo $this->Form->input('patente', array('div' => false, "class" => 'form-control'));?>

				<?php echo $this->Form->label('color', 'Color'); ?>
				<?php echo $this->Form->input('color', array('div' => false, "class" => 'form-control'));?>

				<?php echo $this->Form->label('descripcion', 'Descripcion'); ?>
				<?php echo $this->Form->input('descripcion', array('div' => false, "class" => 'form-control'));?>

				<?php echo $this->Form->label('tipo_autorizacion', 'Tipo Autorizacion'); ?>
				<?php echo $this->Form->input('tipo_autorizacion', array('div' => false, "class" => 'form-control'));?>
			</fieldset>
			<?php echo $this->Form->submit('Agregar', array('class' => 'btn btn-large btn-primary')); ?>
			<?php echo $this->Form->end(); ?>
		</div><!-- /.form -->
	</div><!-- /#page-content .col-sm-9 -->
</div><!-- /#page-container .row-fluid -->