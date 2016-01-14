<div id="page-container" class="row">
<div class="col-sm-4"></div>
	<div id="page-content" class="col-sm-3" align="center">
		<div class="vehiculos form p_form">		
			<?php echo $this->Form->create('Vehiculo', array('inputDefaults' => array('label' => false), 'role' => 'form')); ?>
			<fieldset>
				<h2><?php echo __('Cargar Vehículo'); ?></h2>
				<hr />

				<?php echo $this->Form->label('tipo_vehiculo_id', 'Tipo de Vehículo'); ?>
				<?php echo $this->Form->input('tipo_vehiculo_id', array('div' => false, "class" => 'form-control'));?>

				<?php echo $this->Form->label('patente', 'Patente'); ?>
				<?php echo $this->Form->input('patente', array('div' => false, "class" => 'form-control', 'data-toggle'=> "popover", 'data-trigger' => "focus" ));?>

				<?php echo $this->Form->label('color', 'Color'); ?>
				<?php echo $this->Form->input('color', array('div' => false, "class" => 'form-control'));?>

				<?php echo $this->Form->label('descripcion', 'Descripción'); ?>
				<?php echo $this->Form->input('descripcion', array('div' => false, "class" => 'form-control'));?>
				<h4>Datos Persona</h4>
				<?php echo $this->Form->label('nombre', 'Nombre'); ?>
				<?php echo $this->Form->input('nombre', array('type'=>'text','div' => false, "class" => 'form-control'));?>
				
				<?php echo $this->Form->label('apellido', 'Apellido'); ?>
				<?php echo $this->Form->input('apellido', array('type'=>'text','div' => false, "class" => 'form-control'));?>
				
				<?php echo $this->Form->label('dni', 'DNI'); ?>
				<?php echo $this->Form->input('dni', array('type'=>'text','div' => false, "class" => 'form-control'));?>

				<?php echo $this->Form->label('tipo_autorizacion', 'Tipo Autorizacion'); ?>
				<?php echo $this->Form->input('tipo_autorizacion', array('div' => false, "class" => 'form-control'));?>

				<h4>Repetir</h4>
				<div class="row">
					<div>
						<?php echo $this->Form->label('desde', 'Desde:'); ?>
						<?php echo $this->Form->input('desde', array('type'=>'text','div' => false, "class" => 'form-control input_corto datepicker', 'value'=>date("d/m/Y")));?>
					</div>
					<div>
						<?php echo $this->Form->label('hasta', 'Hasta:'); ?>
						<?php echo $this->Form->input('hasta', array('type'=>'text','div' => false, "class" => 'form-control input_corto datepicker', 'value'=>''));?>
					</div>
					<div>
						<?php echo $this->Form->label('dia', 'Los Días:'); ?>
					</div>
					<div>
					<?php echo $this->Form->input('dia', array('type' => 'select','multiple' => 'checkbox','div' => false, "class" => 'form-control'));?>
					</div>
					<div>
						<input type="radio" name="dias_especiales" id="DiasHabiles" value="1">
						<label for="DiasHabiles">Días Habiles</label>

						<input type="radio" name="dias_especiales" id="Finde" value="2">
						<label for="Finde">Fin de Semana</label>

						<input type="radio" name="dias_especiales" id="Todos" value="3">
						<label for="Todos">Todos</label>
					</div>
				</div>

			</fieldset>
			<?php echo $this->Form->submit('AGREGAR', array('class' => 'btn btn-large btn-primary')); ?>
			<?php echo $this->Form->end(); ?>
		</div><!-- /.form -->
	</div><!-- /#page-content .col-sm-9 -->
</div><!-- /#page-container .row-fluid -->
<?php echo $this->Html->script('vehiculos/admin_add.js');?>