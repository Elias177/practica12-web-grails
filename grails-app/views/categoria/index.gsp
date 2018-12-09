<!DOCTYPE html>
<html lang="en">
<head>
    <title>Black Mesa Admin</title>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
</head>
<body>


<div id="content" class="container-fluid">
    <!--breadcrumbs-->
<g:if test="${userLog.admin}">
    <div class="quick-actions_homepage">
        <ul class="quick-actions">
            <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
            <li class="bg_lb">
                <g:link class="create" action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
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
                <h5><g:message code="categorias.label" /></h5>
            </div>
            <div id="tab" class="widget-content nopadding">

                <table class="table table-bordered data-table">
                    <thead>
                    <tr>
                        <th class="sortable sorted asc" ><a href="/categoria/index?sort=nombre&amp;max=10&amp;order=desc"><g:message code="nombre.label" /></a></th>
                        <th class="sortable" ><a href="/categoria/index?sort=descripcion&amp;max=10&amp;order=asc"><g:message code="descripcion.label" /></a></th>
                        <th class="sortable" ><a href="/categoria/index?sort=usuario&amp;max=10&amp;order=asc"><g:message code="mod.label" /></a></th>
                        <th class="sortable" ><a href="/categoria/index?sort=fecha&amp;max=10&amp;order=asc"><g:message code="fecha.label" /></a></th>
                        <th class="sortable" ><a href="/categoria/index?sort=status&amp;max=10&amp;order=asc"><g:message code="status.label" /></a></th>
                        <th><g:message code="accion.label" /></th>
                    </tr>
                    </thead>
                    <tbody>

                            <g:each in="${categoriaList}">
                                <tr class="gradeX">

                                    <td>${it.nombre}</td>
                                    <td>${it.descripcion}</td>
                                    <td><a href="/user/show/${it.usuario.id}">${it.usuario.username}</a></td>
                                    <td>${it.fecha}</td>
                                    <td>${it.status}</td>
                                    <td>
                                            <g:form action="delete"  method="delete">
                                                <div class="btn-group">

                                                        <a role="button" class="btn btn-primary" href="/categoria/edit/${it.id}"><i class="icon-edit"></i></a>
                                                        <input name="id" id="id" value="${it.id}" type="hidden"/>
                                                        <button type="submit" class="btn btn-danger"><i class="icon-remove"></i></button>

                                                </div>

                                            </g:form>
                                    </td>

                                </tr>
                            </g:each>

                    </tbody>

                </table>


                <div class="pagination alternate">
                    <g:paginate class="pagination alternate" total="${categoriaCount ?: 0}" />
                </div>
            </div>
        </div>
    </div>




    <div id="list-categoria" class="content scaffold-list" role="main">

    </div>

</div>



<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
    <div id="footer" class="span12"> 2018 &copy; Combine Group </div>
</div>

</body>
</html>




