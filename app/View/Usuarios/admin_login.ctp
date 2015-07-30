<style>

</style>

<div class='col-md-12' id='this_page'>

	<div class="users form col-md-5">
		<table id='table_imagen'>
			<tr>
				<td id='td_escudo' width='60'></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2"><h3>CONTROL DE ACCESO VEHICULAR</h3></td>
			</tr>
		</table>
	</div>

	<div class="users form col-md-5">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span9">
	                        <?php echo $this->Form->create('Usuario'); ?>
	                            <fieldset>
						<legend><?php echo __('INGRESE CREDENCIALES'); ?></legend>
									
									    	<?php
														
echo $this->Form->input ( 'usuario_login', array (
																'type' => 'text',
																'placeholder' => 'USUARIO',
																'class' => 'form-control',
																'label' => 'USUARIO',
																'div' => 'form-group input_mediano' 
														) );
														?>
									    	<?php
														
echo $this->Form->input ( 'password', array (
																'label' => 'CONTRASEÑA',
																'type' => 'password',
																'class' => 'form-control',
																'placeholder' => 'CONTRASEÑA',
																'div' => 'form-group input_mediano' 
														) );
														?>
	                            </fieldset>
	                            <br>
	                            <?php echo $this->Form->submit(__('INGRESAR'), array('class' => 'btn btn-large btn-default')); ?>
	                               
	                               <?php echo $this->Html->link(__('OLVIDO LA CONTRASEÑA?'), array('controller'=>'usuarios', 'action' => 'admin_forgetpwd'), array('class' => 'blanco')); ?>
	                               
	                                <?php echo $this->Form->end(); ?>
	                    </div>
			</div>
		</div>

	</div>
</div>
