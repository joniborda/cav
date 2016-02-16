<div id="page-container" class="row">
	<div id="page-content" class="col-sm-12" align="center">
		<div class="movimientos form p_form">
<div class="col-lg-2"></div>
<div id="tabs" class="col-lg-6 col-sm-9">
  <ul>
    <li><a href="#tab-movimiento">TIPO DE MOVIMIENTO</a></li>
    <li><a href="#tab-vehiculo">VEHÍCULO</a></li>
    <li><a href="#tab-horario">CONFIRMACIÓN</a></li>
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
<div class="row">
  	<div class="col-sm-6">
		<span class="title_vehiculo">Tipo de Vehículo</span>
	</div>
	<div class="col-sm-6">
		<span class="vehiculo_tipo_vehiculo_id data_vehiculo">&nbsp;</span>
	</div>
	<div class="col-sm-6">
		<span class="title_vehiculo">Patente</span>
	</div>
	<div class="col-sm-6">
		<span class="vehiculo_patente data_vehiculo">&nbsp;</span>
	</div>

	<div class="col-sm-6">
		<span class="title_vehiculo">Color</span>
	</div>
	<div class="col-sm-6">
		<span class="vehiculo_color data_vehiculo">&nbsp;</span>
	</div>

	<div class="col-sm-6">
		<span class="title_vehiculo">Descripcion</span>
	</div>
	<div class="col-sm-6">
		<span class="vehiculo_descripcion data_vehiculo">&nbsp;</span>
	</div>

	<div class="col-sm-6">
		<span class="title_vehiculo">Tipo Autorizacion</span>
	</div>
	<div class="col-sm-6">
		<span class="vehiculo_tipo_autorizacion data_vehiculo">&nbsp;</span>
	</div>

	<div class="col-sm-6 div_horario">
		<?php echo $this->Form->label('horario', '¿Cuántas horas se va a quedar?'); ?>
	</div>
	<div class="col-sm-6 text_left div_horario">
		<?php echo $this->Form->input('horario', array('type' => 'select', 'div' => false,'class' => 'form-control input_mediano','options' => $horarios));?>
		<span class="red">*</span>
	</div>
	</div>
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
