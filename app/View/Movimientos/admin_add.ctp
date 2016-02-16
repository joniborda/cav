<div id="page-container" class="row">
	<div id="page-content" class="col-sm-12" align="center">
		<div class="movimientos form p_form">
<div class="col-sm-2"></div>
<div id="tabs" class="col-sm-6">
  <ul>
    <li><a href="#tab-movimiento">TIPO DE MOVIMIENTO</a></li>
    <li><a href="#tab-vehiculo">VEHÍCULO</a></li>
    <li><a href="#tab-horario">HORARIO</a></li>
  </ul>
  <div id="tab-movimiento">
  	<div class="row">
	    <div class="col-md-6">
	    	<button type="button" class="btn btn-success btn-lg btn-block" id="entrada"><span class="iconos glyphicon glyphicon-upload" aria-hidden="true"></span> <span class="letrota"> ENTRADA </span></button>
	    </div>
	    <div class="col-md-6">
	    	<button type="button" class="btn btn-warning btn-lg btn-block" id="salida"> <span class="iconos glyphicon glyphicon-download" aria-hidden="true"></span> <span class="letrota"> SALIDA </span></button>
	    </div>
	</div>
  </div>
  <div id="tab-vehiculo">
    <?php echo $this->Form->create('Vehiculo', array('inputDefaults' => array('label' => false), 'role' => 'form')); ?>
    	<?php echo $this->Form->label('patente', 'PATENTE DEL VEHÍCULO'); ?>
		<?php echo $this->Form->input('patente', array('type' => 'text', 'div' => false, "class" => 'form-control input_mediano', 'maxlength' => 10));?>
		<div class="row">
			<a class="btn btn-danger col-md-6" id="vehiculo_atras" href="#">ATRÁS</a>
			<button class="btn btn-success col-md-6">SIGUIENTE</button>
		</div>
    <?php echo $this->Form->end(); ?>
  </div>
  
  <div id="tab-horario">
  	<?php echo $this->Form->create('Horario', array('inputDefaults' => array('label' => false), 'role' => 'form')); ?>
    	<?php echo $this->Form->label('horario', '¿Cuántas horas se va a quedar?'); ?>
		<?php echo $this->Form->input('horario', array(
				'type' => 'select', 
				'div' => false, 
				'class' => 'form-control input_mediano',
				'options' => $horarios));?>
		<div class="row">
			<a class="btn btn-danger col-md-6" id="horario_atras" href="#">ATRÁS</a>
			<button class="btn btn-success col-md-6">SIGUIENTE</button>
		</div>
    <?php echo $this->Form->end(); ?>
  </div>
</div>
<div id="preview" class="col-sm-3">
	<form>
		<div class="form-group has-error has-feedback">
			<label class="control-label" for="preview_tipo_movmiento" >TIPO DE MOVIMIENTO</label>
			<input class="form-control" id="preview_tipo_movmiento" disabled="disabled">
			<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
		</div>
		<div class="form-group has-error has-feedback">
			<label class="control-label" for="preview_vehiculo" >VEHÍCULO</label>
			<input class="form-control" id="preview_vehiculo" disabled="disabled" disabled="disabled">
			<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
		</div>
	</form>
</div>
<div style="clear:both"></div>

<?php echo $this->Form->create('Movimiento', array('inputDefaults' => array('label' => false), 'role' => 'form', 'class' => 'movimiento_form')); ?>
	<?php echo $this->Form->input('tipo_movimiento', array('type' => 'hidden'));?>
	<?php echo $this->Form->input('vehiculo_id', array('type' => 'hidden'));?>
	<?php echo $this->Form->input('persona_id', array('type' => 'hidden'));?>
	<?php echo $this->Form->input('sector', array('type' => 'hidden'));?>
	<?php echo $this->Form->input('interno', array('type' => 'hidden'));?>
	<?php echo $this->Form->input('horario', array('type' => 'hidden'));?>
<?php echo $this->Form->end(); ?>
		</div><!-- /.form -->
			
	</div><!-- /#page-content .col-sm-9 -->

</div><!-- /#page-container .row-fluid -->
<?php echo $this->element('vehiculos/add'); ?>
<?php echo $this->element('personas/add'); ?>

<?php echo $this->Html->script ( 'Movimientos/admin_add.js' );?>
