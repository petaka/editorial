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
       // $this->grocery_crud->set_relation('id_coleccion','coleccion','descripcion');
        $this->grocery_crud->set_language('spanish');
        $output =$this->grocery_crud->render();
        
        $this->libro_output($output);
    
    }

    function libro_output($output)
 
    {
        $this->load->view('content',$output);    
    }
   
}
