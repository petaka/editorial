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
        $this->grocery_crud->set_table('curso');
        $output =$this->grocery_crud->render();
        $this->curso($output);
    }

    function curso($output)
 
    {
        $this->load->view('content',$output);    
    }
   
}
