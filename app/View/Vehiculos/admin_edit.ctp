<?php $todos_dias = array('1' => 'L' ,
			  '2' => 'M' ,
			  '3' => 'X' ,
			  '4' => 'J' ,
			  '5' => 'V' ,
			  '6' => 'S' ,
			  '7' => 'D' ,


 ); ?>
<div id="page-container" class="row">

	<div id="page-content" class="col-sm-12">

		<div class="vehiculos form p_form">
		
			<?php echo $this->Form->create('Vehiculo', array('inputDefaults' => array('label' => false), 'role' => 'form')); ?>
				<fieldset>
					<h2><?php echo __('Editar Vehiculo'); ?>										</h2>
					<hr />
		<div class="row">
		<h4>Datos Vehiculo</h4>
			<div class="col-sm-3">
				<?php echo $this->Form->label('patente', 'Patente'); ?>
				<br>
				<?php echo $this->Form->input('patente', array('div' => false, "class" => 'form-control input_corto','disabled'=>'disabled'));?>
			</div>
			<div class="col-sm-3">
				<?php echo $this->Form->label('color', 'Color'); ?>
				<br>
				<?php echo $this->Form->input('color', array('div' => false, "class" => 'form-control input_corto'));?>
			</div>
			<div class="col-sm-3">
				<?php echo $this->Form->label('descripcion', 'Descripcion'); ?>
				<?php echo $this->Form->input('descripcion', array('div' => false, "class" => 'form-control '));?>
			</div>
			<div class="col-sm-3">
				<?php echo $this->Form->label('tipo_autorizacion', 'Tipo Autorizacion'); ?>
				<?php echo $this->Form->input('tipo_autorizacion', array('type' => 'select', 'div' => false, "class" => 'form-control'));?>
			</div>
		</div>

		<div class="row">
		<h4>Datos Persona</h4>
			<div class="col-sm-3">
				<?php echo $this->Form->label('nombre', 'Nombre'); ?>
				<br>
				<?php echo $this->Form->input('nombre', array('type'=>'text','div' => false, "class" => 'form-control input_mediano'));?>
			</div>
			<div class="col-sm-3">
				<?php echo $this->Form->label('apellido', 'Apellido'); ?>
				<br>
				<?php echo $this->Form->input('apellido', array('type'=>'text','div' => false, "class" => 'form-control input_mediano'));?>
			</div>
			<div class="col-sm-3">
				<?php echo $this->Form->label('dni', 'Dni'); ?>
				<br>
				<?php echo $this->Form->input('dni', array('type'=>'text','div' => false, "class" => 'form-control input_mediano'));?>
			</div>
		</div>


				<h4>Repetir</h4>
					<div class="row">
						<div class="col-sm-3"> 
							<?php echo $this->Form->label('desde', 'Desde:'); ?>
							<br>
							<?php echo $this->Form->input('desde', array('type'=>'text','div' => false, "class" => 'form-control input_corto datepicker', 'value'=>date("d/m/Y")));?>
						</div>
						<div class="col-sm-3">
							<?php echo $this->Form->label('hasta', 'Hasta:'); ?>
							<br>
							<?php echo $this->Form->input('hasta', array('type'=>'text','div' => false, "class" => 'form-control input_corto datepicker', 'value'=>''));?>
						</div>
						<div class="col-sm-3"
							<?php echo $this->Form->label('dia', 'Los Días:'); ?>
							<br>
							<?php echo $this->Form->input('dia', array('type' => 'select','multiple' => 'checkbox','options' => $todos_dias,'div' => false, "class" => 'form-control', 'value' => $dias));?>
						</div>
				</div>

			
			<div class="related">
				
			

				
				<div class="actions">
					<?php // echo $this->Html->link('<i class="icon-plus icon-white"></i> '.__('Nuevo Movimiento'), array('controller' => 'movimientos', 'action' => 'add',h($this->data['Vehiculo']['id'])),array('class' => 'btn btn-primary', 'escape' => false)); ?>				</div><!-- /.actions -->
				
			</div><!-- /.related -->

			
				</fieldset>
			<?php echo $this->Form->submit('Editar', array('class' => 'btn btn-large btn-primary')); ?>
<?php echo $this->Form->end(); ?>
			
		</div><!-- /.form -->
			
	</div><!-- /#page-content .col-sm-9 -->

</div><!-- /#page-container .row-fluid -->

