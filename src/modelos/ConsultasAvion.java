/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author NEIDER
 */
public class ConsultasAvion extends BaseDatos{
    private PreparedStatement sentenciaSQL;
    
    public void insertarAvion(Avion avion){
        
        Connection conexion=conectarBD();
        String consulta="INSERT INTO aviones(matriculaAvion,modeloAvion,cedulaPropietario,tipoContrato)"
                + "VALUES(?,?,?,?)";
        
        try{
            
            sentenciaSQL=conexion.prepareStatement(consulta);
            
            sentenciaSQL.setString(1,avion.getMatriculaAvion());
            sentenciaSQL.setString(2, avion.getModeloAvion());
            sentenciaSQL.setString(3, avion.getCedulaPropietario());
            sentenciaSQL.setInt(4, avion.getTipoCPontrato());
        
        }catch(Exception error){
            
            System.out.println("No se pudo registrar el avion: "+error);
    
        }finally{
            
            try{
                conexion.close();
            }catch(Exception error){
                System.out.println("error: "+error);
            }
    
        }
    
    }
}
