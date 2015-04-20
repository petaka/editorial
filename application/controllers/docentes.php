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
        
      
        $this->grocery_crud->set_table('persona');
        $this->grocery_crud->set_relation_n_n('escuelas', 'persona_escuela_cargo', 'escuela', 'cargo' 'dni', 'id_escuela', 'id_escuela', 'grado');
        //$this->grocery_crud->set_relation_n_n('cursos_por_escuela', 'persona_curso', 'curso', 'dni', 'id_escuela',  'grado');
        //$this->grocery_crud->set_relation('cursos_por_escuela','persona_curso','id_escuela', "id_escuela IN (SELECT grado FROM curso WHERE id_escuela='3')");
        $this->grocery_crud->set_relation_n_n('cargo', 'persona_escuela_cargo', 'cargo', 'dni', 'id_cargo', 'descripcion');
        //$this->grocery_crud->set_relation_n_n('cursos_por_escuela', 'persona_curso', 'curso', 'dni', 'id_escuela',  'grado');
        $this->grocery_crud->set_language('spanish');
        $output =$this->grocery_crud->render();
        
        $this->persona_escuela_curso_output($output);
    
    }

    function persona_escuela_curso_output($output)
 
    {
        $this->load->view('content',$output);    
    }
   
}
