<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Libros extends CI_Controller {

    function __construct()
    {
        parent::__construct();
 
        $this->load->database();
        $this->load->library('grocery_CRUD');
        $this->load->helper('url');
 
    }
    public function index()
    
    {
        
      
        $this->grocery_crud->set_table('libro');
        $this->grocery_crud->set_relation('id_col','coleccion','descripcion');

        $this->grocery_crud->display_as('id_col','Colección');
        $this->grocery_crud->display_as('titulo','Título');
        $this->grocery_crud->display_as('codigo','Código');
        $this->grocery_crud->display_as('anio_lanzamiento','Año de lanzamiento');
        $this->grocery_crud->display_as('paginas','Páginas');
        $this->grocery_crud->display_as('tamanio','Tamaño');
        $this->grocery_crud->display_as('codigo_barra','Código de Barras');
        
        $this->grocery_crud->set_field_upload('imagen','assets/uploads/files');
        $this->grocery_crud->set_language('spanish');
        $output =$this->grocery_crud->render();
        
        $this->libro_output($output);
    
    }

    function libro_output($output)
 
    {
        $this->load->view('content',$output);    
    }
   
}
