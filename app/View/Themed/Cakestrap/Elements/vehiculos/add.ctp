<div class="vehiculos" style="display:none;">
	<div class="form p_form">
		<?php echo $this->Form->create('vehiculo_add', array('inputDefaults' => array('label' => false), 'role' => 'form')); ?>
		<fieldset>
			<h2><?php echo __('Agregar Vehiculo'); ?></h2>
			<hr />
			<?php echo $this->Form->label('patente_mostrar', 'Patente'); ?>
			<?php echo $this->Form->input('patente_mostrar', array('div' => false, "class" => 'form-control', 'disabled' => 'disabled'));?>
			<?php echo $this->Form->input('patente', array('type' => 'hidden'));?>

			<?php echo $this->Form->label('color', 'Color'); ?>
			<?php echo $this->Form->input('color', array('div' => false, "class" => 'form-control'));?>

			<?php echo $this->Form->label('descripcion', 'Descripcion'); ?>
			<?php echo $this->Form->input('descripcion', array('div' => false, "class" => 'form-control'));?>

			<?php echo $this->Form->label('tipo_autorizacion', 'Tipo Autorizacion'); ?>
			<?php echo $this->Form->input('tipo_autorizacion', array('type' => 'select', 'div' => false, "class" => 'form-control'));?>
		</fieldset>
		<?php echo $this->Form->submit('Agregar', array('class' => 'btn btn-large btn-primary')); ?>
		<?php echo $this->Form->end(); ?>
	</div>
</div>