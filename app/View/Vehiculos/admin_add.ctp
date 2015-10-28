<?php
$dias = array('1' => 'L' ,
			  '2' => 'M' ,
			  '3' => 'X' ,
			  '4' => 'J' ,
			  '5' => 'V' ,
			  '6' => 'S' ,
			  '7' => 'D' ,


 ); 
?>
<div id="page-container" class="row">
<div class="col-sm-4"></div>
	<div id="page-content" class="col-sm-3" align="center">
		<div class="vehiculos form p_form">		
			<?php echo $this->Form->create('Vehiculo', array('inputDefaults' => array('label' => false), 'role' => 'form')); ?>
			<fieldset>
				<h2><?php echo __('Cargar Vehículo'); ?></h2>
				<hr />
				<?php echo $this->Form->label('patente', 'Patente'); ?>
				<br>
				<?php echo $this->Form->input('patente', array('div' => false, "class" => 'form-control'));?>

				<?php echo $this->Form->label('color', 'Color'); ?>
				<br>
				<?php echo $this->Form->input('color', array('div' => false, "class" => 'form-control'));?>

				<?php echo $this->Form->label('descripcion', 'Descripción'); ?>
				<?php echo $this->Form->input('descripcion', array('div' => false, "class" => 'form-control'));?>

				<?php echo $this->Form->label('tipo_autorizacion', 'Tipo Autorizacion'); ?>
				<?php echo $this->Form->input('tipo_autorizacion', array('div' => false, "class" => 'form-control'));?>

				<h4>Repetir</h4>
					<div class="row">
						<div> 
							<?php echo $this->Form->label('desde', 'Desde:'); ?>
							<br>
							<?php echo $this->Form->input('desde', array('type'=>'text','div' => false, "class" => 'form-control input_corto datepicker', 'value'=>date("d/m/Y")));?>
						</div>
						<div>
							<?php echo $this->Form->label('hasta', 'Hasta:'); ?>
							<br>
							<?php echo $this->Form->input('hasta', array('type'=>'text','div' => false, "class" => 'form-control input_corto datepicker', 'value'=>''));?>
						</div>
					<?php echo $this->Form->label('dia', 'Los Días:'); ?>
					<br>
					<?php echo $this->Form->input('dia', array('type' => 'select','multiple' => 'checkbox','options' => $dias,'div' => false, "class" => 'form-control'));?>
				</div>

			</fieldset>
			<?php echo $this->Form->submit('AGREGAR', array('class' => 'btn btn-large btn-primary')); ?>
			<?php echo $this->Form->end(); ?>
		</div><!-- /.form -->
	</div><!-- /#page-content .col-sm-9 -->
</div><!-- /#page-container .row-fluid -->
<?php echo $this->Html->script('vehiculos/admin_add.js');?>