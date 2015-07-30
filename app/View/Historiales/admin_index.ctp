
<div id="page-container" class="row">
	<div class="form" id="search-form" <?php echo ($this->view === 'admin_index')? 'style="display:none;"' : ''?>>	<?php echo $this->Form->create('Historiale', array(
		    'url' => array('controller' => 'Historiales', 'action' => 'find'),
			'inputDefaults' => array('label' => false), 'role' => 'form'
		));?>						<div class="row">
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="HistorialeUsuarioIdCheck" onclick="buscar_usuario_id(this);" <?php echo (isset($this->passedArgs['usuario_id']) && $this->passedArgs['usuario_id'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_usuario_id() {
							if ($('#HistorialeUsuarioId').attr('disabled')) {
								$('#usuario_id_input').show('slow');
								$('#HistorialeUsuarioId').removeAttr('disabled');
								$('#HistorialeUsuarioId_').removeAttr('disabled');
								
							} else {
								$('#usuario_id_input').hide('slow');
								$('#HistorialeUsuarioId').val('');
								$('#HistorialeUsuarioId').attr('disabled', 'disabled');
								$('#HistorialeUsuarioId_').attr('disabled', 'disabled');
							}
						}
					</script>

				<?php echo $this->Form->label('usuario_id','Usuario');?></div>

				<div id="usuario_id_input"  <?php echo (isset($this->passedArgs['usuario_id'])  && $this->passedArgs['usuario_id'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('usuario_id', array('type'=>'text','div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["usuario_id"])  && $this->passedArgs["usuario_id"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="HistorialeUrlCheck" onclick="buscar_url(this);" <?php echo (isset($this->passedArgs['url']) && $this->passedArgs['url'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_url() {
							if ($('#HistorialeUrl').attr('disabled')) {
								$('#url_input').show('slow');
								$('#HistorialeUrl').removeAttr('disabled');
								$('#HistorialeUrl_').removeAttr('disabled');
								
							} else {
								$('#url_input').hide('slow');
								$('#HistorialeUrl').val('');
								$('#HistorialeUrl').attr('disabled', 'disabled');
								$('#HistorialeUrl_').attr('disabled', 'disabled');
							}
						}
					</script>

				<?php echo $this->Form->label('url','Url');?></div>

				<div id="url_input"  <?php echo (isset($this->passedArgs['url'])  && $this->passedArgs['url'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('url', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["url"])  && $this->passedArgs["url"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="HistorialeParametrosCheck" onclick="buscar_parametros(this);" <?php echo (isset($this->passedArgs['parametros']) && $this->passedArgs['parametros'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_parametros() {
							if ($('#HistorialeParametros').attr('disabled')) {
								$('#parametros_input').show('slow');
								$('#HistorialeParametros').removeAttr('disabled');
								$('#HistorialeParametros_').removeAttr('disabled');
								
							} else {
								$('#parametros_input').hide('slow');
								$('#HistorialeParametros').val('');
								$('#HistorialeParametros').attr('disabled', 'disabled');
								$('#HistorialeParametros_').attr('disabled', 'disabled');
							}
						}
					</script>

				<?php echo $this->Form->label('parametros','Parametros');?></div>

				<div id="parametros_input"  <?php echo (isset($this->passedArgs['parametros'])  && $this->passedArgs['parametros'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('parametros', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["parametros"])  && $this->passedArgs["parametros"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="HistorialeNavegadorCheck" onclick="buscar_navegador(this);" <?php echo (isset($this->passedArgs['navegador']) && $this->passedArgs['navegador'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_navegador() {
							if ($('#HistorialeNavegador').attr('disabled')) {
								$('#navegador_input').show('slow');
								$('#HistorialeNavegador').removeAttr('disabled');
								$('#HistorialeNavegador_').removeAttr('disabled');
								
							} else {
								$('#navegador_input').hide('slow');
								$('#HistorialeNavegador').val('');
								$('#HistorialeNavegador').attr('disabled', 'disabled');
								$('#HistorialeNavegador_').attr('disabled', 'disabled');
							}
						}
					</script>

				<?php echo $this->Form->label('navegador','Navegador');?></div>

				<div id="navegador_input"  <?php echo (isset($this->passedArgs['navegador'])  && $this->passedArgs['navegador'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('navegador', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["navegador"])  && $this->passedArgs["navegador"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
					</div>
				<div class="row">
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="HistorialeIpCheck" onclick="buscar_ip(this);" <?php echo (isset($this->passedArgs['ip']) && $this->passedArgs['ip'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_ip() {
							if ($('#HistorialeIp').attr('disabled')) {
								$('#ip_input').show('slow');
								$('#HistorialeIp').removeAttr('disabled');
								$('#HistorialeIp_').removeAttr('disabled');
								
							} else {
								$('#ip_input').hide('slow');
								$('#HistorialeIp').val('');
								$('#HistorialeIp').attr('disabled', 'disabled');
								$('#HistorialeIp_').attr('disabled', 'disabled');
							}
						}
					</script>

				<?php echo $this->Form->label('ip','Ip');?></div>

				<div id="ip_input"  <?php echo (isset($this->passedArgs['ip'])  && $this->passedArgs['ip'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('ip', array('div' => false, "class" => "form-control", "disabled" => (isset($this->passedArgs["ip"])  && $this->passedArgs["ip"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
												<div class="form-group col-sm-3">
				<div>
					<input type="checkbox" id="HistorialeFechaCheck" onclick="buscar_fecha(this);" <?php echo (isset($this->passedArgs['fecha']) && $this->passedArgs['fecha'] != null)? 'checked="checked"' : '';?>/>
					<script type="text/javascript">
						function buscar_fecha() {
							if ($('#HistorialeFecha').attr('disabled')) {
								$('#fecha_input').show('slow');
								$('#HistorialeFecha').removeAttr('disabled');
								$('#HistorialeFecha_').removeAttr('disabled');
								
							} else {
								$('#fecha_input').hide('slow');
								$('#HistorialeFecha').val('');
								$('#HistorialeFecha').attr('disabled', 'disabled');
								$('#HistorialeFecha_').attr('disabled', 'disabled');
							}
						}
					</script>

				<?php echo $this->Form->label('fecha','Fecha');?></div>

				<div id="fecha_input"  <?php echo (isset($this->passedArgs['fecha'])  && $this->passedArgs['fecha'] != null)? '' : 'style="display:none;"' ?> >
				<?php echo $this->Form->input('fecha', array('type'=>'text','div' => false, "class" => "form-control datepicker", "disabled" => (isset($this->passedArgs["fecha"])  && $this->passedArgs["fecha"] != null )? false : "disabled"));?>				</div>
			</div><!-- .form-group -->
								</div>
				<div style="clear:both;">			<?php echo $this->Form->submit(__('Buscar'), array('class' => 'btn btn-large btn-primary'));
 echo $this->Form->end();?>		</div>			
	</div><!-- form -->
	<div class="show_search text-center">
	<a href="#" onclick="showSearch(this);return false;">
		<?php echo ($this->view === 'admin_index')? '<span class="glyphicon glyphicon-chevron-down"></span>' : '<span class="glyphicon glyphicon-chevron-up"></span>';?>  
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
<!-- 	<div id="sidebar" class="col-sm-3">
		
		<div class="actions">
		
			<ul class="list-group">
				<li class="list-group-item"><?php echo $this->Html->link(__('New Historiale'), array('action' => 'add'), array('class' => '')); ?></li>						<li class="list-group-item"><?php echo $this->Html->link(__('List Usuarios'), array('controller' => 'usuarios', 'action' => 'index'), array('class' => '')); ?></li> 
		<li class="list-group-item"><?php echo $this->Html->link(__('New Usuario'), array('controller' => 'usuarios', 'action' => 'add'), array('class' => '')); ?></li> 
			</ul><!-- /.list-group -->
			
<!--  		</div><!-- /.actions -->
		
<!-- 	</div><!-- /#sidebar .col-sm-3 -->
				
	<div id="page-content" class="col-sm-12">
<!-- 	<div id="page-content" class="col-sm-9"> -->

		<div class="historiales index">
		
			<h2><?php echo __('Historiales'); ?></h2>
			<hr />
			<div class="table-responsive">
				<table cellpadding="0" cellspacing="0" class="table table-striped table-bordered">
					<thead>
						<tr>
															<th class="actions"><?php echo __('Opciones'); ?></th>
															<th><?php echo $this->Paginator->sort('id'); ?></th>
															<th><?php echo $this->Paginator->sort('usuario_id'); ?></th>
															<th><?php echo $this->Paginator->sort('url'); ?></th>
															<th><?php echo $this->Paginator->sort('parametros'); ?></th>
															<th><?php echo $this->Paginator->sort('navegador'); ?></th>
															<th><?php echo $this->Paginator->sort('ip'); ?></th>
															<th><?php echo $this->Paginator->sort('fecha'); ?></th>
						</tr>
					</thead>
					<tbody>
						<?php
						foreach ($historiales as $historiale): ?>
	<tr>
		<td class="actions">
			<?php echo $this->Html->link('<span class="glyphicon glyphicon-list-alt" title="Ver"></span>', array('action' => 'view', $historiale['Historiale']['id']), array('escape'=>false)); ?>
			<?php echo $this->Html->link('<span class="glyphicon glyphicon-wrench" title="Ver"></span>', array('action' => 'edit', $historiale['Historiale']['id']), array('escape'=>false)); ?>
			<?php echo $this->Form->postLink('<span class="glyphicon glyphicon-trash" title="Borrar"></span>', array('action' => 'delete', $historiale['Historiale']['id']), array('escape'=>false), __('¿Estas seguro que desea borrar # %s?', $historiale['Historiale']['id'])); ?>
		</td>
		<td><?php echo h($historiale['Historiale']['id']); ?>&nbsp;</td>
		<td><?php if ($historiale['Usuario']):?>
			<?php echo $this->Html->link($historiale['Usuario']['nombre_completo'], array('controller' => 'usuarios', 'action' => 'view', $historiale['Usuario']['id'])); ?>
		<?php endif;?></td>
		<td><?php echo h($historiale['Historiale']['url']); ?>&nbsp;</td>
		<td><?php echo h($historiale['Historiale']['parametros']); ?>&nbsp;</td>
		<td><?php echo h($historiale['Historiale']['navegador']); ?>&nbsp;</td>
		<td><?php echo h($historiale['Historiale']['ip']); ?>&nbsp;</td>
		<td><?php echo h($historiale['Historiale']['fecha']); ?>&nbsp;</td>
	</tr>
<?php endforeach; ?>
					</tbody>
				</table>
			</div><!-- /.table-responsive -->
			<center>
				<p><small>
					<?php
					echo $this->Paginator->counter(array(
					'format' => __('Página {:page} de {:pages}, mostrando {:current} registros de {:count} total, comenzando por el {:start}, y terminando en el {:end}')
					));
					?>				</small></p>
	
				<ul class="pagination">
					<?php
		echo $this->Paginator->prev('< ' . __('Anterior'), array('tag' => 'li'), null, array('class' => 'disabled', 'tag' => 'li', 'disabledTag' => 'a'));
		echo $this->Paginator->numbers(array('separator' => '', 'currentTag' => 'a', 'tag' => 'li', 'currentClass' => 'disabled'));
		echo $this->Paginator->next(__('Siguiente') . ' >', array('tag' => 'li'), null, array('class' => 'disabled', 'tag' => 'li', 'disabledTag' => 'a'));
	?>
				</ul><!-- /.pagination -->
			
			</center>
		</div><!-- /.index -->
	
	</div><!-- /#page-content .col-sm-9 -->

</div><!-- /#page-container .row-fluid -->
