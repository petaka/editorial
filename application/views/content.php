<DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
 
<?php 
foreach($css_files as $file): ?>
    <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
 
<?php endforeach; ?>
<?php foreach($js_files as $file): ?>
 
    <script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>
 
<style type='text/css'>
body
{
    font-family: Arial;
    font-size: 14px;
}
a {
    color: blue;
    text-decoration: none;
    font-size: 14px;
}
a:hover
{
    text-decoration: underline;
}
</style>
</head>
<body>
<!-- Beginning header -->
    <ul>
        <li><a href="<?php base_url(); ?>/editorial/index.php/docentes">Docentes</a></li>
        <li><a href="<?php base_url(); ?>/editorial/index.php/cargos">Cargos</a></li>
        <li><a href="<?php base_url(); ?>/editorial/index.php/escuelas">Escuelas</a></li>
        <li><a href="<?php base_url(); ?>/editorial/index.php/docenteEscuelas">Relacionar Docentes -> Escuelas</a></li>
        <li><a href="<?php base_url(); ?>/editorial/index.php/libros">Libros</a></li>
        <li><a href="<?php base_url(); ?>/editorial/index.php/colecciones">Colecciones</a></li>
        <li><a href="<?php base_url(); ?>/editorial/index.php/libroDocentes">Relacionar Libros -> Docentes</a></li>
    </ul>
<!-- End of header-->
    <div style='height:20px;'></div>  
    <div>
        <?php echo $output; ?>
 
    </div>
<!-- Beginning footer -->
<div>Footer</div>
<!-- End of Footer -->
</body>
</html>
 