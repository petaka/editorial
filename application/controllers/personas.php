<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Main extends CI_Controller {
 
    function __construct()
    {
        parent::__construct();
 
        $this->load->database();
        $this->load->library('grocery_crud');
        $this->load->helper('url');
 
    }
    public function index()
    
    {
        echo 'todos putos';
        /*$this->grocery_crud->set_table('persona_escuela_curso');
        $output = $this->grocery_crud->render();
        echo '<pre>';
        echo $output;
        echo '</pre>';*/
        //$this->persona_escuela_curso_output($output); 
        
       
    }
    function persona_escuela_curso_output($output = null)
 
    {
        $this->load->view('content.php',$output);    
    }
}
 
/* End of file main.php */
/* Location: ./application/controllers/main.php */