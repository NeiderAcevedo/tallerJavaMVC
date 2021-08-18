/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;
import modelos.ConsultasAngaresAviones;
/**
 *
 * @author NEIDER
 */
public class ControladorHangarAvion {
    private ConsultasAngaresAviones modelo= new ConsultasAngaresAviones();
    
    
    public void matricularAvionEnHangar(String matriculaAvion){
        
        modelo.insertarAvionHangar(matriculaAvion);
        
        
    }
}
