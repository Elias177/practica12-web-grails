<!DOCTYPE html>
<html lang="en">
<head>
    <title>Black Mesa Admin</title>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'contacto.label', default: 'Contacto')}" />


</head>
<body>


<!--main-container-part-->
    <!--End-breadcrumbs-->
    <div id="content" class="container-fluid">
        <!--breadcrumbs-->
        <!--End-breadcrumbs-->
<g:if test="${userLog.admin}">

    <div class="quick-actions_homepage">
        <ul class="quick-actions">
            <g:set var="entityName" value="${message(code: 'contacto.label', default: 'Contacto')}" />
            <li class="bg_lb">
                <g:link action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]"/></g:link>
            </li>
        </ul>
    </div>
</g:if>

    <div class="span11">
        <g:if test="${flash.message}">
            <div class="alert alert-info alert-block message" role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
        </g:if>
        <div class="widget-box">
            <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
                <h5><g:message code="contacto.label" /></h5>
            </div>
            <div id="tab" class="widget-content nopadding">

                <table class="table table-bordered data-table">
                    <thead>
                    <tr>
                        <th class="sortable sorted asc" ><a href="/contacto/index?sort=nombre&amp;max=10&amp;order=desc"><g:message code="nombre.label" /></a></th>
                        <th class="sortable" ><a href="/contacto/index?sort=apellido&amp;max=10&amp;order=asc"><g:message code="apellido.label" /></a></th>
                        <th class="sortable" ><a href="/contacto/index?sort=email&amp;max=10&amp;order=asc">Email</a></th>
                        <th class="sortable" ><a href="/contacto/index?sort=direccion&amp;max=10&amp;order=asc"><g:message code="direccion.label" /></a></th>
                        <th class="sortable" ><a href="/contacto/index?sort=puesto&amp;max=10&amp;order=asc"><g:message code="puesto.label" /></a></th>
                        <th class="sortable" ><a href="/contacto/index?sort=telefono&amp;max=10&amp;order=asc"><g:message code="telefono.label" /></a></th>
                        <th class="sortable" ><a href="/contacto/index?sort=categoria&amp;max=10&amp;order=asc"><g:message code="categoria.label" /></a></th>
                        <th><g:message code="departamento.label" />s</th>
                        <th class="sortable" ><a href="/contacto/index?sort=usuario&amp;max=10&amp;order=asc"><g:message code="mod.label" /></a></th>
                        <th class="sortable" ><a href="/contacto/index?sort=fecha&amp;max=10&amp;order=asc"><g:message code="fecha.label" /></a></th>
                        <th class="sortable" ><a href="/contacto/index?sort=status&amp;max=10&amp;order=asc"><g:message code="status.label" /></a></th>
                        <th><g:message code="accion.label" /></th>
                    </tr>
                    </thead>
                    <tbody>

                    <g:each in="${contactoList}">
                        <tr class="gradeXX" onclick="getLink(${it.id})">

                            <td>${it.nombre}</td>
                            <td>${it.apellido}</td>
                            <td>${it.email}</td>
                            <td>${it.direccion}</td>
                            <td>${it.puesto}</td>
                            <td>${it.telefono}</td>
                            <td>${it.categoria.nombre}</td>
                            <td>
                                <ul>
                                    <g:each var="dep" in="${it.deps}">

                                        <li>${dep.nombre}</li>

                                    </g:each>
                                </ul>
                            </td>
                            <td><a href="/user/show/${it.usuario.id}">${it.usuario.username}</a></td>
                            <td>${it.fecha}</td>
                            <td>${it.status}</td>

                            <td>
                                <g:form action="delete"   method="delete">
                                    <div class="btn-group">

                                        <a role="button" class="btn btn-primary" href="/contacto/edit/${it.id}"><i class="icon-edit"></i></a>
                                        <input name="id" id="id" value="${it.id}" type="hidden"/>
                                        <button type="submit" class="btn btn-danger"><i class="icon-remove"></i></button>

                                    </div>

                                </g:form>
                            </td>

                        </tr>
                    </g:each>

                    </tbody>

                </table>


                <div class="pagination">
                    <g:paginate total="${contactoCount ?: 0}" />
                </div>

            </div>
        </div>
    </div>



    </div>


<script>

    function getLink(e)
    {
        window.location.replace('/contacto/show/'+e);
    }

</script>

<!--end-main-container-part-->

<!--Footer-part-->


</body>
</html>

