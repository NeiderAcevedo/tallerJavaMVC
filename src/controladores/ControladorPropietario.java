/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.util.List;
import modelos.ConsultasPropietario;
import modelos.Propietario;

/**
 *
 * @author NEIDER
 */
public class ControladorPropietario {
    private ConsultasPropietario modelo= new ConsultasPropietario();
    
    public void registrarPropietario(Propietario propietario){
        
        //validaciones
        
        modelo.insertarPropietario(propietario);
        
    }

   
    
}
