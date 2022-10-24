/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package apis;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.swing.table.DefaultTableModel;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

/**
 *
 * @author Sapón Pérez
 */
public class api_class {
    private String id,id_p;
    private String nombres,apellidos,direccion,telefono,dpi,fn,fingr;
    private String url_api="https://localhost:5001/api/empleados/";

    public api_class(){};
    public api_class(String id, String id_p, String nombres, String apellidos, String direccion, String telefono, String dpi, String fn, String fingr) {
        this.id = id;
        this.id_p = id_p;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.telefono = telefono;
        this.dpi = dpi;
        this.fn = fn;
        this.fingr = fingr;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId_p() {
        return id_p;
    }

    public void setId_p(String id_p) {
        this.id_p = id_p;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    public String getFn() {
        return fn;
    }

    public void setFn(String fn) {
        this.fn = fn;
    }

    public String getFingr() {
        return fingr;
    }

    public void setFingr(String fingr) {
        this.fingr = fingr;
    }
    
    //peticiones get
    
    
    private String get(){
        String salida="";
        
        try{
             URL url = new URL(url_api);
            HttpURLConnection c_api= (HttpURLConnection) url.openConnection();
             c_api.setRequestMethod("GET");
            c_api.setRequestProperty("Accept","application/json");
            
                if(c_api.getResponseCode()==200){
                    InputStreamReader entrada = new InputStreamReader(c_api.getInputStream());
                    BufferedReader lectura = new BufferedReader(entrada);
                    salida = lectura.readLine();
                }
                else{
                    salida="";
                    System.out.println("error, no se puede conectar a la Api"+c_api.getResponseCode());
                }
            
        c_api.disconnect();
        }catch(IOException ex){
            System.out.println("xxxXXXerrorXXXxxx"+ex.getMessage());
        }
        return salida;
    }
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            String encabezado[] = {"id","nombres","apellidos","direccion","telefono","puesto","dpi","fechaNacimiento","fechaIngreso"};
          tabla.setColumnIdentifiers(encabezado);
          String[] datos = new String[9];
          JSONArray arreglo = new JSONArray(get());
          
          for(int i = 0 ; i < arreglo.length(); i++){
              JSONObject atributo = arreglo.getJSONObject(i);
              datos[0] = String.valueOf(atributo.getInt("idEmpleado"));
              datos[1]  =   atributo.getString("nombres");
              datos[2]  =   atributo.getString("apellidos");
              datos[3]  =   atributo.getString("direccion");
              datos[4]  =   atributo.getString("telefono");
              datos[5]  =   String.valueOf(atributo.getInt("idPuesto"));
              datos[6]  =   atributo.getString("dpi");
              datos[7]  =   atributo.getString("fechaNacimiento");
              datos[8]  =   atributo.getString("fechaIngresoRegistro");
              tabla.addRow(datos);
          }
            
        }catch(JSONException ex){
            System.out.println("xxxXXXerror al leerXXXxxx"+ex.getMessage());
        }
        return tabla;
    }
        
    //peticion post
    public int  post(){
         int salida = 0;
         try{
          URL url = new URL(url_api);  
          HttpURLConnection c_api = (HttpURLConnection) url.openConnection();
          c_api.setRequestMethod("POST");
          c_api.setRequestProperty("Content-Type", "application/json; utf-8");
         // c_api.setRequestProperty("Accept", "application/json");
          c_api.setDoOutput(true);
          String jsonS = "{\"Nombres\":\""+this.getNombres()+"\",\n" +
            "\"Apellidos\":\""+this.getApellidos()+"\",\n" +
            "\"Direccion\":\""+this.getDireccion()+"\",\n" +
             "\"Telefono\":\""+this.getTelefono()+"\",\n" +
            "\"idPuesto\":\""+this.getId_p()+"\",\n" +
            "\"DPI\":\""+this.getDpi()+"\",\n" +
            "\"FechaNacimiento\":\""+this.getFn()+"\",\n" +
            "\"FechaIngresoRegistro\":\""+this.getFingr()+"\"}";
         
         OutputStream os = c_api.getOutputStream();
        os.write(jsonS.getBytes());
        os.flush();
          
          if (c_api.getResponseCode()==200){
                salida = 1;
          }else{
              System.out.println("No se puede conectar a la api : " + c_api.getResponseCode());
          }
          c_api.disconnect();

        }catch(IOException ex){
     
            System.out.println("Error api:" + ex.getMessage());
        }
         return salida;
    
    }
    
    public int put(){
         int salida = 0;
         try{
          URL url = new URL(url_api);  
          HttpURLConnection c_api = (HttpURLConnection) url.openConnection();
          c_api.setRequestMethod("PUT");
          c_api.setRequestProperty("Content-Type", "application/json; utf-8");
         // c_api.setRequestProperty("Accept", "application/json");
          c_api.setDoOutput(true);
          String jsonS = "{\"idEmpleado\":\""+this.getId()+"\",\n" +
                        "\"Nombres\":\""+this.getNombres()+"\",\n" +
                        "\"Apellidos\":\""+this.getApellidos()+"\",\n" +
                        "\"Direccion\":\""+this.getDireccion()+"\",\n" +
                         "\"Telefono\":\""+this.getTelefono()+"\",\n" +
                        "\"idPuesto\":\""+this.getId_p()+"\",\n" +
                        "\"DPI\":\""+this.getDpi()+"\",\n" +
                        "\"FechaNacimiento\":\""+this.getFn()+"\",\n" +
                        "\"FechaIngresoRegistro\":\""+this.getFingr()+"\"}";
          
          OutputStream os = c_api.getOutputStream();
        os.write(jsonS.getBytes());
        os.flush();
        
        if(c_api.getResponseCode()==200){
            salida = 1;
        }else{
            System.out.println("No se puede conectar a la api : " + c_api.getResponseCode());
        }
        c_api.disconnect();
    }catch(IOException ex){
             System.out.println("xxxXXXno se puede hacer solicitud putXXXxxx"+ex.getMessage());
    }
         return salida;

    }
}
