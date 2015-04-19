<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Docentes extends CI_Controller {

    function __construct()
    {
        parent::__construct();
 
        $this->load->database();
        $this->load->library('grocery_CRUD');
        $this->load->helper('url');
 
    }
    public function index()
    
    {
        
      
        $this->grocery_crud->set_table('persona_escuela_curso');
        $this->grocery_crud->set_relation('id_persona','persona','nombre');
        $this->grocery_crud->set_relation('id_escuela','escuela','nombre');
        $this->grocery_crud->set_relation('id_curso','curso','año');
        $this->grocery_crud->display_as('division','curso')->display_as('id_escuela','Escuela')->display_as('id_curso','Curso');
        $output =$this->grocery_crud->render();
        
        $this->persona_escuela_curso_output($output);
    
    }

    function persona_escuela_curso_output($output)
 
    {
        $this->load->view('content',$output);    
    }
   
}
