<div class="card-body p-0">
    <!-- Nested Row within Card Body -->
    <div class="col-lg-7">

        <div class="col">
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Nuevo horario</h1>
                </div>
                <form class="user" id="form" method="post">
                    <label for="ciudad">hora atencion</label>
                    <input type="hidden" class="form-control " id="listar" name="listar" value="cargar">
                    <input type="hidden" class="form-control " id="idhorario" name="idhorario">
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <input type="time" class="form-control" id="hora_atencion" name="hora_atencion" placeholder="hora atencion">
                        </div>
                        

                      

                        
                    </div>


                    <div class="form-group row">

     

                        <div class="col-sm-8">
                            <div class="dropdown mb-8">
                                           <div class="col-sm-8">
                                    <div class="form-group row">

                                        <label for="">Estado</label>

                                        <select class="form-control" id="hora_estado" name="hora_estado">
                                            <option value="Activo">Activo</option>
                                            <option value="Inactivo">Inactivo</option>

                                        </select>
                                         <label for="ciudad">Doctor</label>

                               <select id="iddoctor" class="js-states form-control" name="iddoctor">                         

                            </select>
                                    </div>
                                </div>
                                <div class="dropdown-menu animated--fade-in"
                                     aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Action</a>


                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="button" class="btn btn-primary" id="boton-aceptar" name="boton-aceptar" value="Guardar"/>
        <input type="button" onclick="cancelar()" class="btn btn-danger" id="boton-cancelar" name="boton"  value="Cancelar" href="container.jsp" />


                </form>

                <div id="mensaje"></div>
                <hr>
            </div>

        </div>

    </div>
</div><div class="container-fluid">

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
<div class="contenedor">
  <div class="derecha">                               <input type="text" id="buscar" class="form-control form-control-user" onkeyup="buscar()" placeholder="Buscar en tabla" title="Empieza a escribir para buscar">
</div>                                <table class="table table-bordered"  id="tabla" width="100%" data-sort="table">
                                 
                                    <a type="button" class="fa fa-print" href="rpaciente_8.jsp"></a>

                    <thead>
                        <tr>
                            <th>#</th>
                            <th>hora Atencion</th>
                            <th>doctor</th>
                            <th>estado</th>

                            <th>Opciones</th>
                        </tr>
                    </thead>

                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>