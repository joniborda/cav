<?php if (isset($field)):?>
<?php $field_underscore = Inflector::underscore($field); ?>
<div class="form-group col-sm-3">
	<div>
		<input type="checkbox" id="<?php echo $model . $field ?>Check"
			onclick="buscar_<?php echo $field_underscore; ?>(this);"
			<?php echo (
					(isset($this->passedArgs[$field_underscore]) && $this->passedArgs[$field_underscore] != null) ||
					(isset($this->passedArgs[$field_underscore . '_desde']) && $this->passedArgs[$field_underscore . '_desde'] != null)
				)? 'checked="checked"' : '';?> />
		<script type="text/javascript">
			function buscar_<?php echo $field_underscore ?>($this) {
				if ($($this).is(':checked')) {
					$('#tipo_<?php echo $field_underscore ?>').show('fast');
					cambiar_tipo_<?php echo $field_underscore ?>();
				} else {
					$('#tipo_<?php echo $field_underscore ?>').hide('fast');
					$('#<?php echo $field_underscore ?>_exacta_input').hide('fast');
					$('#<?php echo $model . $field ?>').attr('disabled', 'disabled');
					$('#<?php echo $model . $field ?>_').attr('disabled', 'disabled');
					$('#<?php echo $field_underscore ?>_entre_input').hide('fast');
					$('#<?php echo $model . $field ?>Desde').attr('disabled', 'disabled');
					$('#<?php echo $model . $field ?>Hasta').attr('disabled', 'disabled');
				}
			}
		</script>
		<?php echo $this->Form->label($field_underscore .'_check',$label);?>
		<select class="form-control input_corto" id="tipo_<?php echo $field_underscore ?>" onclick="cambiar_tipo_<?php echo $field_underscore ?>(this);"
		    <?php echo (
				(isset($this->passedArgs[$field_underscore]) && $this->passedArgs[$field_underscore] != null) || 
		    	(isset($this->passedArgs[$field_underscore . '_desde']) && $this->passedArgs[$field_underscore . '_desde'] != null)
			)? '' : 'style="display:none;"';?>
		>
			<option value="exacta">Exacta</option>
			<option value="entre" 
				<?php echo (isset($this->passedArgs[ $field_underscore .'_desde'])  && $this->passedArgs[$field_underscore . '_desde'] != null)? 'selected="selected"' : ''?>>
				Entre
			</option>
		</select>
		<script type="text/javascript">
		function cambiar_tipo_<?php echo $field_underscore ?>() {
			if ($('#tipo_<?php echo $field_underscore ?>').val() == 'exacta') {
				$('#<?php echo $field_underscore ?>_exacta_input').show('fast');
				$('#<?php echo $model . $field ?>').removeAttr('disabled');
				$('#<?php echo $model . $field ?>_').removeAttr('disabled');
				$('#<?php echo $field_underscore ?>_entre_input').hide('fast');
				$('#<?php echo $model . $field ?>Desde').attr('disabled', 'disabled');
				$('#<?php echo $model . $field ?>Hasta').attr('disabled', 'disabled');
			} else {
				$('#<?php echo $field_underscore ?>_entre_input').show('fast');
				$('#<?php echo $model . $field ?>Desde').removeAttr('disabled');
				$('#<?php echo $model . $field ?>Hasta').removeAttr('disabled');
				$('#<?php echo $field_underscore ?>_exacta_input').hide('fast');
				$('#<?php echo $model . $field ?>').val('');
				$('#<?php echo $model . $field ?>').attr('disabled', 'disabled');
				$('#<?php echo $model . $field ?>_').attr('disabled', 'disabled');
			}
		}
		</script>
		<div id="<?php echo $field_underscore ?>_exacta_input"
			<?php echo (isset($this->passedArgs[$field_underscore])  && $this->passedArgs[$field_underscore] != null)? '' : 'style="display:none;"' ?>>
			<?php echo $this->Form->input($field_underscore, array('type' => 'text', 'div' => false, "class" => "form-control datepicker", "disabled" => (true || isset($this->passedArgs[$field_underscore])  && $this->passedArgs[$field_underscore] != null )? false : "disabled"));?>
		</div>
	</div>
	<div id="<?php echo $field_underscore ?>_entre_input"
		<?php echo (isset($this->passedArgs[$field_underscore . '_desde'])  && $this->passedArgs[$field_underscore . '_desde'] != null)? '' : 'style="display:none;"' ?>>
		<div>
			<?php echo $this->Form->label($field_underscore . '_desde','Desde');?>
			<?php echo $this->Form->input($field_underscore . '_desde', array('type' => 'text', 'div' => false, "class" => "form-control datepicker input_corto", "disabled" => (isset($this->passedArgs[$field_underscore . "_desde"])  && $this->passedArgs[$field_underscore . "_desde"] != null )? false : "disabled"));?>
		</div>
		<div>
			<?php echo $this->Form->label($field_underscore . '_hasta','Hasta');?>
			<?php echo $this->Form->input($field_underscore . '_hasta', array('type' => 'text', 'div' => false, "class" => "form-control datepicker input_corto", "disabled" => (isset($this->passedArgs[$field_underscore . "_hasta"])  && $this->passedArgs[$field_underscore . "_hasta"] != null )? false : "disabled"));?>
		</div>
	</div>
</div>
<?php endif;?>