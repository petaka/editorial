<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Colecciones extends CI_Controller {

    function __construct()
    {
        parent::__construct();
 
        $this->load->database();
        $this->load->library('grocery_CRUD');
        $this->load->helper('url');
 
    }
    public function index()
    
    {
        
      
        $this->grocery_crud->set_table('coleccion');
        $this->grocery_crud->set_language('spanish');
        $output =$this->grocery_crud->render();
        
        $this->coleccion_output($output);
    
    }

    function coleccion_output($output)
 
    {
        $this->load->view('content',$output);    
    }
   
}
