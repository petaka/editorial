<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class DocenteEscuelas extends CI_Controller {

    function __construct()
    {
        parent::__construct();
 
        $this->load->database();
        $this->load->library('grocery_CRUD');
        $this->load->helper('url');
 
    }
    public function index()
    
    {    
        $this->grocery_crud->set_table('persona_escuela');
        $this->grocery_crud->set_relation('dni','persona','{nombre} {apellido}');
        $this->grocery_crud->set_relation('id_escuela','escuela','nombre');
        $this->grocery_crud->set_relation('id_cargo','cargo','descripcion');
        $this->grocery_crud->display_as('dni','Docente');
        $this->grocery_crud->display_as('id_escuela','Escuela');
        $this->grocery_crud->display_as('id_cargo','Cargo');
        $this->grocery_crud->display_as('1_grado','1° Grado');
        $this->grocery_crud->display_as('2_grado','2° Grado');
        $this->grocery_crud->display_as('3_grado','3° Grado');
        $this->grocery_crud->display_as('4_grado','4° Grado');
        $this->grocery_crud->display_as('5_grado','5° Grado');
        $this->grocery_crud->display_as('6_grado','6° Grado');
        $this->grocery_crud->display_as('7_grado','7° Grado CABA / 1° Secundaria');
        $this->grocery_crud->display_as('1_anio','1° Año CABA / 2° Secundaria');
        $this->grocery_crud->display_as('2_anio','2° Año CABA / 3° Secundaria');
        $this->grocery_crud->display_as('3_anio','3° Año CABA / 4° Secundaria');
        $this->grocery_crud->display_as('4_anio','4° Año CABA / 5° Secundaria');
        $this->grocery_crud->display_as('5_anio','5° Año CABA / 6° Secundaria');
        //$this->grocery_crud->set_relation_n_n('cursos','persona_curso','curso','dni', 'grado', 'grado', 'id_escuela');
        $this->grocery_crud->set_language('spanish');
        $output =$this->grocery_crud->render();

        $this->docente_escuelas($output);
    }

    function docente_escuelas($output)
 
    {
        $this->load->view('content',$output);    
    }
   
}
