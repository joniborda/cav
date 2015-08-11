<div class="personas" style="display:none;">
	<div class="form p_form">
		<?php echo $this->Form->create('persona_add', array('inputDefaults' => array('label' => false), 'role' => 'form')); ?>
		<fieldset>
			<h2><?php echo __('Agregar Persona'); ?></h2>
			<hr />
			<?php echo $this->Form->label('numero_documento_mostrar', 'Numero Documento'); ?>
			<?php echo $this->Form->input('numero_documento_mostrar', array('div' => false, "class" => 'form-control', 'disabled' => 'disabled'));?>
			<?php echo $this->Form->input('numero_documento', array('type' => 'hidden'));?>

			<?php echo $this->Form->label('nombre', 'Nombre'); ?>
			<?php echo $this->Form->input('nombre', array('div' => false, "class" => 'form-control'));?>

			<?php echo $this->Form->label('apellido', 'Apellido'); ?>
			<?php echo $this->Form->input('apellido', array('div' => false, "class" => 'form-control'));?>

			<?php echo $this->Form->label('telefono', 'Telefono'); ?>
			<?php echo $this->Form->input('telefono', array('div' => false, "class" => 'form-control'));?>

		</fieldset>
		<?php echo $this->Form->submit('Agregar', array('class' => 'btn btn-large btn-primary')); ?>
		<?php echo $this->Form->end(); ?>
	</div>
</div>