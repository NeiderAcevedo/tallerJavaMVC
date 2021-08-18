/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aeropuerto;

import controladores.ControladorAvion;
import controladores.ControladorHangar;
import controladores.ControladorHangarAvion;

import controladores.ControladorPropietario;
import java.util.List;
import java.util.Scanner;
import modelos.Avion;
import modelos.Hangar;
import modelos.Propietario;
import vistas.VistaAvion;
import vistas.VistaHangar;
import vistas.VistaPropietario;

/**
 *
 * @author NEIDER
 */
public class Aeropuerto {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Scanner objLeer = new Scanner(System.in);
        ControladorHangar controladorHangar = new ControladorHangar();
        Hangar hangar = controladorHangar.consultarInformacionHangar();
        ControladorPropietario controladorPropietario = new ControladorPropietario();
        List<Propietario> propietarios = controladorPropietario.consultarPropietario();
        VistaPropietario vistaPropietario = new VistaPropietario();
        VistaHangar vistaHangar = new VistaHangar();
        
        int opcion;
        do {
            System.out.println("\nBienvenido al sistema administrador del Hangar Número 160");
            System.out.println("-----------------------------------------------------------");
            System.out.println("");
            System.out.println("-----------1.  Consultar datos del hangar------------------");
            System.out.println("-----------2.  Consultar datos de los propietarios---------");
            System.out.println("-----------3.  Consultar datos de los aviones ingresados---");
            System.out.println("-----------4.  Insertar nuevo registro---------------------");
            System.out.println("-----------5.  Salir---------------------------------------");

            System.out.print("\nDigite una opción: ");
            opcion = objLeer.nextInt();

            switch (opcion) {
                case 1:
                    vistaHangar.activarVista(hangar);
                    break;
                case 2:
                    vistaPropietario.activarVista2(propietarios);
                    break;
                case 3:

                    break;
                case 4:

                    if (hangar.getCuposDisponibles()> 0 && hangar.getCuposDisponibles()< 16) {

                        Propietario propietario = vistaPropietario.activarVista();
                        controladorPropietario.registrarPropietario(propietario);

                        VistaAvion vistaAvion = new VistaAvion();
                        Avion avion = vistaAvion.activarVista();
                        ControladorAvion controladorAvion = new ControladorAvion();
                        controladorAvion.registrarAvion(avion);

                        ControladorHangarAvion controladorAvionesHangares = new ControladorHangarAvion();
                        controladorAvionesHangares.matricularAvionEnHangar(avion.getMatriculaAvion());

                        controladorHangar.actualizarHangar(hangar);
                    } else {
                        System.out.println("No tenemos cupos disponibles");
                    }
                    break;
                case 5:
                    break;

            }

        } while (opcion != 5);


    }
    
}
