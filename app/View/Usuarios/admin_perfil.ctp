<div id="page-container" class="row">
	<div id="page-content" class="col-sm-12">

		<div class="usuarios form p_form">
		
			<?php echo $this->Form->create('Usuario', array("enctype"=>"multipart/form-data",'inputDefaults' => array('label' => false), 'role' => 'form')); ?>
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
							<?php echo $this->Form->label('usuario_login', 'Usuario Login'); ?>
						</div><!-- .form-group -->
						<div class="form-group col-sm-4">
								<?php echo $this->Form->input('usuario_login', array('div' => false, "class" => 'form-control', 'disabled' => 'disabled')); ?>
						</div><!-- .form-group -->
					</div>
					<!-- <div class="row">
						<div class="form-group col-sm-2">
						<?php //echo $this->Form->label('apellido', 'Apellido'); ?>
					</div><!-- .form-group -->
					<!-- <div class="form-group col-sm-4">-->
							<?php // echo $this->Form->input('apellido', array('div' => false, "class" => 'form-control')); ?>
					<!-- </div><!-- .form-group -->
					<!-- 															<div class="form-group col-sm-2">-->
						<?php //echo $this->Form->label('nombre', 'Nombre'); ?>
					<!-- </div><!-- .form-group -->
					<!-- <div class="form-group col-sm-4">
							<?php //echo $this->Form->input('nombre', array('div' => false, "class" => 'form-control')); ?>
					<!-- </div><!-- .form-group -->
					
					<!-- </div>-->
					<div class="row">
						<div class="form-group col-sm-2">
							<?php echo $this->Form->label('constrasenia', 'Contraseña'); ?>
						</div><!-- .form-group -->
						<div class="form-group col-sm-4">
							<?php echo $this->Form->input('password', array('div' => false, "class" => 'form-control', 'value' => '')); ?>
						</div><!-- .form-group -->
						<div class="form-group col-sm-2">
							<span>
								<span class="glyphicon glyphicon-chevron-left"></span>No cambia si está vacío
							</span>
						</div><!-- .form-group -->
					</div>
			<?php 
			echo "<div class='control-group'>";
			echo $this->Form->input('imagen', array('type'=>'file',"escape"=>false,'class' => 'span12', 'label' => 'Imagen JPG'));
			echo "</div>";
			
			$filename = $current_user['id'] . "_" . md5($current_user['id']);
			
			if (file_exists( WWW_ROOT . '/perfiles/' . $filename. '.jpg')) {
				echo "<div class='form-group col-sm-4'>";
					echo $this->Html->image('/perfiles/' . $filename. '.jpg');
				echo "</div>";
			}
			?>
				</fieldset>
			<?php echo $this->Form->submit('Guardar', array('class' => 'btn btn-large btn-primary')); ?>
<?php echo $this->Form->end(); ?>
			
		</div><!-- /.form -->
			
	</div><!-- /#page-content .col-sm-9 -->

</div><!-- /#page-container .row-fluid -->
