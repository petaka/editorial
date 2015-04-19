<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Cursos extends CI_Controller {

    function __construct()
    {
        parent::__construct();
 
        $this->load->database();
        $this->load->library('grocery_CRUD');
        $this->load->helper('url');
 
    }
    public function index()
    
    {
        /* Creamos el objeto */
        $crud = new grocery_CRUD();
     
        /* Seleccionamos el tema */
        //$crud->set_theme('flexigrid');
     
        /* Seleccionmos el nombre de la tabla de nuestra base de datos*/
        $this->grocery_crud->set_table('curso');
     
        /* Le asignamos un nombre */
        $this->grocery_crud->set_subject('Curso');
     
        /* Asignamos el idioma español */
        $this->grocery_crud->set_language('spanish');
     
        /* Aqui le decimos a grocery que estos campos son obligatorios */
        /*$crud->required_fields(
          'id',
          'nombre',
        );*/
     
        /* Aqui le indicamos que campos deseamos mostrar */
        /*$crud->columns(
          'id',
          'proveedor',
        );*/
        $output =$this->grocery_crud->render();
        $this->curso($output);
    }

    function curso($output)
 
    {
        $this->load->view('content',$output);    
    }
   
}
