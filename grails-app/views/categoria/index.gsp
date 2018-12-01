<!DOCTYPE html>
<html lang="en">
<head>
    <title>Black Mesa Admin</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
    <asset:stylesheet href="bootstrap.min.css"/>
    <asset:stylesheet href="bootstrap-responsive.min.css"/>
    <asset:stylesheet href="fullcalendar.css"/>
    <asset:stylesheet href="matrix-style.css"/>
    <asset:stylesheet href="matrix-media.css"/>
    <asset:stylesheet href="css/font-awesome.css"/>
    <asset:stylesheet href="jquery.gritter.css"/>
    <asset:link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>

<!--Header-part-->
<div id="header" style="height: 40px">

    <asset:image src="logo2.png"/>
    <h1><a href="${createLink(controller:'dashboard', action:'index')}">">Home</a></h1>
</div>
<!--close-Header-part-->


<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
    <ul class="nav">
        <li class=""><a title="" href="#"><i class="icon icon-user-md"></i> <span class="text">Welcome ${user.username}</span></a></li>
        <li class="">
            <form name="submitForm" class="form-inline" method="POST" action="${createLink(controller: 'logout')}">
                <input type="hidden" name="" value="">
            </form>
            <a title="" HREF="javascript:document.submitForm.submit()"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a>


        </li>    </ul>
</div>
<!--close-top-Header-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
    <ul>
        <li><a href="${createLink(controller:'dashboard', action:'index')}"><i class="icon icon-home"></i> <span>Dashboard</span></a> </li>
        <li> <a  href="${createLink(controller:'contacto', action:'index')}"><i class="icon icon-envelope"></i> <span><g:message code="contacto.label" />s</span></a> </li>
        <li> <a href="${createLink(controller:'departamento', action:'index')}"><i class="icon icon-building"></i> <span><g:message code="departamento.label" />s</span></a> </li>
        <li class="active"> <a href="${createLink(controller:'categoria', action:'index')}"><i class="icon icon-list"></i> <span><g:message code="categorias.label" /></span></a> </li>

        <g:if test="${user.admin}">
            <li> <a href="${createLink(controller:'user', action:'index')}"><i class="icon icon-user"></i> <span><g:message code="user.label" />s</span></a> </li>
        </g:if>
    </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<!--End-breadcrumbs-->
<div id="content" class="container-fluid">
    <!--breadcrumbs-->
    <div class="quick-actions_homepage">
        <ul class="quick-actions">
            <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
            <li class="bg_lb">
                <g:link class="create" action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
            </li>
        </ul>
    </div>

    <div class="span11">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
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


<script>
    

</script>

<!--end-Footer-part-->
<asset:javascript src="matrix.dashboard.js"/>
<asset:javascript src="jquery.min.js"/>
<asset:javascript src="jquery.ui.custom.js"/>
<asset:javascript src="bootstrap.min.js"/>
<asset:javascript src="jquery.flot.min.js"/>
<asset:javascript src="jquery.flot.resize.min.js"/>
<asset:javascript src="jquery.peity.min.js"/>
<asset:javascript src="fullcalendar.min.js"/>
<asset:javascript src="matrix.js"/>
<asset:javascript src="matrix.chat.js"/>
<asset:javascript src="matrix.interface.js"/>
<asset:javascript src="jquery.validate.js"/>
<asset:javascript src="matrix.form_validation.js"/>
<asset:javascript src="jquery.wizard.js"/>
<asset:javascript src="jquery.uniform.js"/>
<asset:javascript src="select2.min.js"/>
<asset:javascript src="matrix.popover.js"/>


</body>
</html>




