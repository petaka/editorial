<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class LibroDocentes extends CI_Controller {

    function __construct()
    {
        parent::__construct();
 
        $this->load->database();
        $this->load->library('grocery_CRUD');
        $this->load->helper('url');
 
    }
    public function index()
    
    {    
        $this->grocery_crud->set_table('libro_persona');
        $this->grocery_crud->set_relation('dni','persona','{nombre} {apellido}');
        $this->grocery_crud->set_relation('isbn','libro','titulo');
        $this->grocery_crud->display_as('dni','Docente');
        $this->grocery_crud->display_as('isbn','Libro');
        $this->grocery_crud->set_language('spanish');
        $output =$this->grocery_crud->render();

        $this->libro_docentes($output);
    }

    function libro_docentes($output)
 
    {
        $this->load->view('content',$output);    
    }
   
}
