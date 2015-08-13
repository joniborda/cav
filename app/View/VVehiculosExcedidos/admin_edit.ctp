
<div id="page-container" class="row">

	<div id="page-content" class="col-sm-12">

		<div class="vVehiculosExcedidos form p_form">
		
			<?php echo $this->Form->create('VVehiculosExcedido', array('inputDefaults' => array('label' => false), 'role' => 'form')); ?>
				<fieldset>
					<h2><?php echo __('Editar V Vehiculos Excedido'); ?>										</h2>
				<hr />
					<div class="row">
						<div class="form-group col-sm-2" style="font-weight: bold;">
							Persona
						</div>
						<div class="form-group col-sm-4" style="font-weight: bold;">
													<?php echo $this->data['Persona']['virtual']?>												</div>
					</div>
						<?php echo $this->Form->label('patente', 'Patente'); ?>
		<?php echo $this->Form->input('patente', array('div' => false, "class" => 'form-control'));?>

		<?php echo $this->Form->label('tipo_autorizacion', 'Tipo Autorizacion'); ?>
		<?php echo $this->Form->input('tipo_autorizacion', array('div' => false, "class" => 'form-control'));?>

		<?php echo $this->Form->label('movimiento_id', 'Movimiento'); ?>
		<?php echo $this->Form->input('movimiento_id', array('div' => false, "class" => 'form-control'));?>

		<?php echo $this->Form->label('sector', 'Sector'); ?>
		<?php echo $this->Form->input('sector', array('div' => false, "class" => 'form-control'));?>

		<?php echo $this->Form->label('interno', 'Interno'); ?>
		<?php echo $this->Form->input('interno', array('div' => false, "class" => 'form-control'));?>

	
				</fieldset>
			<?php echo $this->Form->submit('Editar', array('class' => 'btn btn-large btn-primary')); ?>
<?php echo $this->Form->end(); ?>
			
		</div><!-- /.form -->
			
	</div><!-- /#page-content .col-sm-9 -->

</div><!-- /#page-container .row-fluid -->

