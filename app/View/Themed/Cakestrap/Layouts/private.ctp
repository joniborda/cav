<?php
$cakeDescription = __d ( 'cake_dev', 'CAV' );
?>
<?php echo $this->Html->docType('html5'); ?>
<html>
<head>
		<?php echo $this->Html->charset(); ?>
		<title>
			<?php echo $cakeDescription ?>:
			<?php echo $title_for_layout; ?>
		</title>
		<?php
		echo $this->Html->meta ( 'icon' );
		
		echo $this->fetch ( 'meta' );
		
		echo $this->Html->css ( 'bootstrap.min' );
		echo $this->Html->css ( 'core' );
		echo $this->Html->css ( 'jquery/jquery-ui-1.10.3.custom.min.css' );
		echo $this->Html->css ( 'default.css' );
		
		echo $this->fetch ( 'css' );
		
		echo $this->Html->script ( 'libs/jquery-1.10.2.min' );
		echo $this->Html->script ( 'libs/bootstrap.min' );
		echo $this->Html->script ( 'jquery/jquery.floatThead.js' );
		echo $this->Html->script ( 'jquery/jquery-ui-1.10.3.custom' );
		echo $this->Html->script ( 'jquery/jquery.ui.datepicker-es.min' );
		echo $this->Html->script ( 'jquery/multiselect/bootstrap-multiselect.js' );
		echo $this->Html->script ( 'jquery/jquery.zoomooz.min.js' );
		echo $this->Html->script ( 'default.js' );
		echo $this->Html->script ( 'location.js' );
		echo $this->fetch ( 'script' );
		?>
		<meta http-equiv="X-UA-Compatible"
	content="IE=10; IE=9; IE=8; IE=7; IE=EDGE" />
		<script type="text/javascript">
			var base_url = 'http://<?php echo $_SERVER['HTTP_HOST'].ROUTER::url("/"); ?>';
			var usuario_login = null;
			<?php if (isset($current_user) && $current_user):?>
				usuario_login = '<?php echo $current_user['usuario_login']?>';
			<?php endif;?>
		</script>
</head>
<body>
	<div id="main-container">
		<div id="header" class="container">
				<?php if($current_user): ?>
					<?php echo $this->element('menu/top_menu'); ?>
				<?php endif; ?>
			</div>
		<!-- /#header .container -->
		<div id="content" class="container">
				<?php echo $this->Session->flash('auth'); ?>
				<?php echo $this->Session->flash(); ?>
				<?php echo $this->fetch('content'); ?>
			</div>
		<!-- /#header .container -->

		<div id="footer" class="container">
			<hr />
			DESARROLLADO POR LA DIRECCIÓN GENERAL DE GESTIÓN DE LA INFORMACIÓN - ANM
		</div>
		<!-- /#footer .container -->
	</div>
	<!-- /#main-container -->

	<div class="container" style='padding-top: 40px;'>
		<div class="well well-sm">
			<small>
					<?php echo $this->element('sql_dump'); ?>
				</small>
		</div>
		<!-- /.well well-sm -->
	</div>
	<!-- /.container -->

</body>

</html>