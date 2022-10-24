<%-- 
    Document   : index
    Created on : 23/10/2022, 19:25:01
    Author     : Sapón Pérez
--%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="apis.api_class" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados jsp</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <header style="background-color: #ff6633">
                <h1 style="text-align: center">Empleados</h1>
            </header>    
            
           
            
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalEmpleado" onclick="cls()">
            Agregar
            </button>
            <!-- Formulario -->
            <div class="modal fade" id="modalEmpleado" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                <div class="modal-body">
                    <div>
                        <form action="sr_empleado" method="post" class="form-group">
                        <label for="lbl_id"><b>ID</b></label>
                        
                        <input type="text" name="txt_id" id="txt_id" class="form-control" readonly="" value="0">

                        <label for="lbl_nombres"><b>Nombres</b></label>
                        <input type="text" name="txt_nom" id="txt_nom" class="form-control" placeholder="Ejemplo: Byron Allan">

                        <label for="lbl_ape"><b>Apellidos</b></label>
                        <input type="text" name="txt_ape" id="txt_ape" class="form-control" placeholder="Ejemplo: Brito Delgado">

                        <label for="lbl_dir"><b>Direccion</b></label>
                        <input type="text" name="txt_dir" id="txt_dir" class="form-control" placeholder="Ejemplo: Ciudad zona pais">

                        <label for="lbl_tel"><b>Telefono</b></label>
                        <input type="number" name="txt_tel" id="txt_tel" placeholder="Ejemplo: 33333333" class="form-control" >
                        
                        <label for="lbl_puesto"><b>Puesto</b></label>
                        <select name ="drop_puesto" id="drop_puesto" class="form-select">
                            <option value="1">Programador jr</option>
                            <option value="2">Secretaria</option>
                            <option value="3">Tallador</option>
                            <option value="4">Electricista</option>
                            <option value="5">Ferretero</option>
                            <option value="6">Mensajero</option>
                            <option value="7">Chofer</option>
                        </select>
                        <label for="lbl_dpi"><b>DPI</b></label>
                        <input type="number" name="txt_dpi" id="txt_dpi" placeholder="Ejemplo: 33333333" class="form-control" >
                        
                        <label for="lbl_fn"><b>Fecha nacimiento</b></label>
                        <input type="date" name="date_fn" id="date_fn" class="form-control">
                        
                        <label for="lbl_ingreso"><b>Fecha ingreso</b></label>
                        <input type="date" name="date_ingreso" id="date_ingreso" class="form-control">
                        
                
                        <br><button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                        
                            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    
                        </form>
                    </div>
                </div>
            </div>
            </div>
            </div>
            <!-- tabla -->
    
            <div>
                <h3 style="text-align:center">Tabla de Empleados registrados</h3>
                <br>
                <table class="table table-dark table-striped">
                    <thead>
                    <tr>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>Puesto</th>
                        <th>DPI</th>
                        <th>Nacimiento</th>
                        <th>FechaIngreso</th>
                    </tr>
                    </thead>
                    <tbody id="tbl_empleados">
                        <%
                            api_class obj = new api_class();
                            DefaultTableModel tabla = new DefaultTableModel();
                            tabla = obj.leer();
                            for(int j = 0 ; j<tabla.getRowCount();j++){
                                out.println("<tr data-id="+tabla.getValueAt(j,0)+">");
                                out.println("<td>"+tabla.getValueAt(j,1)+"</td>");
                                out.println("<td>"+tabla.getValueAt(j,2)+"</td>");
                                out.println("<td>"+tabla.getValueAt(j,3)+"</td>");
                                out.println("<td>"+tabla.getValueAt(j,4)+"</td>");
                                out.println("<td>"+tabla.getValueAt(j,5)+"</td>");
                                out.println("<td>"+tabla.getValueAt(j,6)+"</td>");
                                out.println("<td>"+tabla.getValueAt(j,7)+"</td>");
                                out.println("<td>"+tabla.getValueAt(j,8)+"</td>");
                                out.println("</tr>");
                            }
                        
                        %>
                    
                    </tbody>
                </table>
            </div>
            
    <footer>
        <h3>Haz sitios web como este!</h3>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ut semper sem, non posuere libero. Duis hendrerit mauris eget purus ornare, eu faucibus lorem porttitor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam eget feugiat augue. Sed elementum mi eu nibh condimentum, ac rhoncus nunc suscipit. Proin eu efficitur neque. Cras cursus lectus a urna pharetra dignissim. Aliquam ex felis, fringilla et semper a, ultrices id ligula. Maecenas ut lobortis arcu, tincidunt vulputate sapien. Suspendisse fermentum luctus arcu, quis sagittis urna sagittis sit amet. Nam dignissim laoreet quam eget blandit. Vivamus ac porttitor mauris. Nunc ac ipsum at lacus suscipit mollis. Proin ut nisl aliquet, accumsan lorem id, pulvinar odio.
        </p>
    </footer>            
            
            
            
            
        </div>
    <script src="https://code.jquery.com/jquery-3.6.1.slim.js" integrity="sha256-tXm+sa1uzsbFnbXt8GJqsgi2Tw+m4BLGDof6eUPjbtk=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>            
    <script type="text/javascript">
         $('#tbl_empleados').on('click','tr td',function(evt){
           var target,id,nombres,apellidos,direccion,telefono,puesto,dpi,nacimiento,ingreso;
                target = $(event.target);
                id= target.parent().data('id'); 
                nombres = target.parent("tr").find("td").eq(0).html();
                apellidos = target.parent("tr").find("td").eq(1).html();
                direccion = target.parent("tr").find("td").eq(2).html();
                telefono = target.parent("tr").find("td").eq(3).html();
                puesto = target.parent("tr").find("td").eq(4).html();
                dpi = target.parent("tr").find("td").eq(5).html();
                nacimiento = target.parent("tr").find("td").eq(6).html();
                ingreso = target.parent("tr").find("td").eq(7).html();
                $("#txt_id").val(id);
                $("#txt_nom").val(nombres);
                $("#txt_ape").val(apellidos);
                $("#txt_dir").val(direccion);
                $("#txt_tel").val(telefono);
                $("#drop_puesto").val(puesto);
                $("#txt_dpi").val(dpi);
                $("#date_fn").val(nacimiento);
                $("#date_ingreso").val(ingreso);
                $("#modalEmpleado").modal('show');  
         });
    
        
    </script>
    <script type="text/javascript">
         function cls(){
                 $("#txt_id").val(0);
                $("#txt_nom").val("");
                $("#txt_ape").val("");
                $("#txt_dir").val("");
                $("#txt_tel").val("");
                $("#drop_puesto").val(1);
                $("#txt_dpi").val("");
                $("#date_fn").val("");
                $("#date_ingreso").val("");
            };
    </script>
    </body>
</html>
