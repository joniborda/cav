<?php
/**
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       Cake.Console.Templates.default.views
 * @since         CakePHP(tm) v 1.2.0.5234
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
?>



<div id="page-container" class="row">
<?php if ($search):?>
	<?php echo'<div class="form" id="search-form" <?php echo ($this->view === \'admin_index\')? \'style="display:none;"\' : \'\'?>>';?>
	<?php echo '<?php echo $this->Form->create(\'' . $modelClass . '\', array(
		    \'url\' => array(\'controller\' => \'' . $modelClass . 's\', \'action\' => \'find\'),
			\'inputDefaults\' => array(\'label\' => false), \'role\' => \'form\'
		));?>';?>
		<?php $count = (int)count($fields)/4;?>
		<?php for ($i = 0; $i <= $count; $i++):?>
		<div class="row">
			<?php for ($j = ($i*4)+1; $j <= 4+($i*4); $j++):?>
			<?php if ($j >= count($fields)): break;endif;?>
			<?php $field = $fields[$j];?>
			<?php if (in_array($field, ['usuario_id','fecha_carga', 'tabla', 'tabla_id'])) continue;?>
			<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="<?php echo $modelClass . Inflector::camelize($field)?>Check" onclick="buscar_<?php echo $field?>(this);" <?php echo "<?php echo (isset(\$this->passedArgs['" . $field . "']) && \$this->passedArgs['" . $field . "'] != null)? 'checked=\"checked\"' : '';?>";?>/>
					<script type="text/javascript">
						function buscar_<?php echo $field;?>() {
							if ($('#<?php echo $modelClass?><?php echo Inflector::camelize($field);?>').attr('disabled')) {
								$('#<?php echo $field;?>_input').show('slow');
								$('#<?php echo $modelClass?><?php echo Inflector::camelize($field);?>').removeAttr('disabled');
								$('#<?php echo $modelClass?><?php echo Inflector::camelize($field);?>_').removeAttr('disabled');
								
							} else {
								$('#<?php echo $field;?>_input').hide('slow');
								$('#<?php echo $modelClass?><?php echo Inflector::camelize($field);?>').val('');
								$('#<?php echo $modelClass?><?php echo Inflector::camelize($field);?>').attr('disabled', 'disabled');
								$('#<?php echo $modelClass?><?php echo Inflector::camelize($field);?>_').attr('disabled', 'disabled');
							}
						}
					</script>
				<?php echo '<?php echo $this->Form->label(\''.$field .'_check\',\''. Inflector::humanize(str_replace('_id', '', $field)) .'\');?>';?></div>
				<div id="<?php echo $field;?>_input"  <?php echo "<?php echo (isset(\$this->passedArgs['" . $field . "'])  && \$this->passedArgs['" . $field . "'] != null)? '' : 'style=\"display:none;\"' ?>";?> >
				<?php echo '<?php echo $this->Form->input(\''.$field .'\', array(';
		echo ($schema[$field]['type'] == 'datetime' || $schema[$field]['type'] == 'date' || strpos($field, '_id'))? '\'type\'=>\'text\',' : ''; 
 		echo '\'div\' => false, "class" => "form-control';
 	    echo ($schema[$field]['type'] == 'datetime' || $schema[$field]['type'] == 'date')? ' datepicker' : '';
 		echo '", "disabled" => (isset($this->passedArgs["' . $field . '"])  && $this->passedArgs["' . $field . '"] != null )? false : "disabled"));?>';?>
				</div>
			</div><!-- .form-group -->
			<?php endfor;?>
		</div>
		<?php endfor;?>
		<?php echo '<div style="clear:both;">';?>
			<?php echo '<?php echo $this->Form->submit(__(\'Buscar\'), array(\'class\' => \'btn btn-large btn-primary\'));'."\n".' echo $this->Form->end();?>';?>
		<?php echo '</div>';?>			
	</div><!-- form -->
	<div class="show_search text-center">
	<a href="#" onclick="showSearch(this);return false;">
		<?php echo '<?php echo ($this->view === \'admin_index\')? \'<span class="glyphicon glyphicon-chevron-down"></span>\' : \'<span class="glyphicon glyphicon-chevron-up"></span>\';?> ';?> 
		<span>Búsqueda</span>
	</a>
	<script type="text/javascript">
		function showSearch(element) {
				if ($('#search-form').is(':visible')) {
					$(element).find('.glyphicon').removeClass('glyphicon-chevron-up');
					$(element).find('.glyphicon').addClass('glyphicon-chevron-down');
					$('#search-form').hide('slow');
				} else {
					$(element).find('.glyphicon').removeClass('glyphicon-chevron-down');
					$(element).find('.glyphicon').addClass('glyphicon-chevron-up');
					$('#search-form').show('slow');
				}
			}
	</script>
	</div>
<?php endif; // search ?>
<!-- 	<div id="sidebar" class="col-sm-3">
		
		<div class="actions">
		
			<ul class="list-group">
				<?php echo "<li class=\"list-group-item\"><?php echo \$this->Html->link(__('New " . $singularHumanName . "'), array('action' => 'add'), array('class' => '')); ?></li>"; ?>
				<?php
					$done = array();
					foreach ($associations as $type => $data) {
						foreach ($data as $alias => $details) {
							if ($details['controller'] != $this->name && !in_array($details['controller'], $done)) {
								echo "\t\t<li class=\"list-group-item\"><?php echo \$this->Html->link(__('List " . Inflector::humanize($details['controller']) . "'), array('controller' => '{$details['controller']}', 'action' => 'index'), array('class' => '')); ?></li> \n";
								echo "\t\t<li class=\"list-group-item\"><?php echo \$this->Html->link(__('New " . Inflector::humanize(Inflector::underscore($alias)) . "'), array('controller' => '{$details['controller']}', 'action' => 'add'), array('class' => '')); ?></li> \n";
								$done[] = $details['controller'];
							}
						}
					}
				?>
			</ul><!-- /.list-group -->
			
<!--  		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .col-sm-3 -->
				
	<div id="page-content" class="col-sm-12">
<!-- 	<div id="page-content" class="col-sm-9"> -->

		<div class="<?php echo $pluralVar; ?> index">
		
			<h2 style='display:inline;'><?php echo "<?php echo __('{$pluralHumanName}'); ?>"; ?></h2> <a href="<?php echo "<?php echo Router::url(array('controller' => '".$pluralVar."', 'action' => 'add'));?>"; ?>" class='btn btn-large btn-primary' style='float:right'>Agregar nuevo</a>
			<hr />
			<div class="table-responsive">
				<table cellpadding="0" cellspacing="0" class="table table-striped table-bordered">
					<thead>
						<tr>
							<?php  foreach ($fields as $field): ?>
							<?php if (in_array($field, ['usuario_id','fecha_carga', 'tabla', 'tabla_id'])) continue;?>
								<th><?php echo "<?php echo \$this->Paginator->sort('{$field}'); ?>"; ?></th>
							<?php endforeach; ?>
								<th class="actions"><?php echo "<?php echo __('Opciones'); ?>"; ?></th>
						</tr>
					</thead>
					<tbody>
						<?php
						echo "<?php
						foreach (\${$pluralVar} as \${$singularVar}): ?>\n";
						echo "\t<tr>\n";
							foreach ($fields as $field) {
								if (in_array($field, ['usuario_id','fecha_carga', 'tabla', 'tabla_id'])) continue;
								$isKey = false;
								if (!empty($associations['belongsTo'])) {
									foreach ($associations['belongsTo'] as $alias => $details) {
										if ($field === $details['foreignKey']) {
											$isKey = true;
											echo "\t\t<td>";
											echo "<?php if (\${$singularVar}['{$alias}']):?>";
											echo "\n\t\t\t<?php echo \$this->Html->link(\${$singularVar}['{$alias}']['{$details['displayField']}'], array('controller' => '{$details['controller']}', 'action' => 'view', \${$singularVar}['{$alias}']['{$details['primaryKey']}'])); ?>\n\t\t";
											echo "<?php endif;?>";
											echo "</td>\n";
											break;
										}
									}
								}
								if ($isKey !== true) {
									echo "\t\t<td><?php echo h(\${$singularVar}['{$modelClass}']['{$field}']); ?>";
									if ($singularVar == 'persona' && $modelClass == 'Persona' && $field == 'id') {
									echo "<?php if (\$persona['Persona']['sdh'])
										echo \$this->Html->link('',
												array('controller' => 'l24321Certificados', 'action' => 'menu', \$persona['Persona']['id']),
												array('class' => 'glyphicon glyphicon-book')
										); ?>&nbsp;";
									}
									echo "&nbsp;</td>\n";
								}
							}

							echo "\t\t<td class=\"actions\">\n";
							echo "\t\t\t<?php echo \$this->Html->link('<span class=\"glyphicon glyphicon-list-alt\" title=\"Ver\"></span>', array('action' => 'view', \${$singularVar}['{$modelClass}']['{$primaryKey}']), array('escape'=>false)); ?>\n";
							echo "\t\t\t<?php echo \$this->Html->link('<span class=\"glyphicon glyphicon-wrench\" title=\"Editar\"></span>', array('action' => 'edit', \${$singularVar}['{$modelClass}']['{$primaryKey}']), array('escape'=>false)); ?>\n";
							echo "\t\t\t<?php echo \$this->Form->postLink('<span class=\"glyphicon glyphicon-trash\" title=\"Borrar\"></span>', array('action' => 'delete', \${$singularVar}['{$modelClass}']['{$primaryKey}']), array('escape'=>false), __('¿Estas seguro que desea borrar # %s?', \${$singularVar}['{$modelClass}']['{$primaryKey}'])); ?>\n";
							echo "\t\t</td>\n";
						echo "\t</tr>\n";

						echo "<?php endforeach; ?>\n";
						?>
					</tbody>
				</table>
			</div><!-- /.table-responsive -->
			<center>
				<p><small>
					<?php echo "<?php
					echo \$this->Paginator->counter(array(
					'format' => __('Página {:page} de {:pages}, mostrando {:current} registros de {:count} total, comenzando por el {:start}, y terminando en el {:end}')
					));
					?>"; ?>
				</small></p>
	
				<ul class="pagination">
					<?php
						echo "<?php\n";
						echo "\t\techo \$this->Paginator->prev('< ' . __('Anterior'), array('tag' => 'li'), null, array('class' => 'disabled', 'tag' => 'li', 'disabledTag' => 'a'));\n";
						echo "\t\techo \$this->Paginator->numbers(array('separator' => '', 'currentTag' => 'a', 'tag' => 'li', 'currentClass' => 'disabled'));\n";
						echo "\t\techo \$this->Paginator->next(__('Siguiente') . ' >', array('tag' => 'li'), null, array('class' => 'disabled', 'tag' => 'li', 'disabledTag' => 'a'));\n";
						echo "\t?>\n";
					?>
				</ul><!-- /.pagination -->
			
			</center>
		</div><!-- /.index -->
	
	</div><!-- /#page-content .col-sm-9 -->

</div><!-- /#page-container .row-fluid -->
