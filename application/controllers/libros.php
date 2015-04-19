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
        $this->grocery_crud->set_language('spanish');
        $output =$this->grocery_crud->render();
        $this->libro($output);
    }

    function libro($output)
 
    {
        $this->load->view('content',$output);    
    }
   
}
