/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vistas;

import java.util.List;
import java.util.Scanner;
import modelos.Propietario;

/**
 *
 * @author NEIDER
 */
public class VistaPropietario {
    
    public Propietario activarVista(){
        
        Scanner entrada = new Scanner(System.in);
        Propietario propietario= new Propietario();
        
        System.out.println("Bienvenido al hanagr 160");
        
        System.out.println("Digite la cedula del propietario: ");
        propietario.setCedula(entrada.next());
        
        
        System.out.println("Digite los nombres del propietario");
        propietario.setNombres(entrada.next());
        
        
        System.out.println("Digite el metodo de pago (1 o 2)");
        propietario.setMetodoPago(entrada.nextInt());
        
        return propietario;
        
        
    }

    public void activarVista2(List<Propietario> propietarios) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
