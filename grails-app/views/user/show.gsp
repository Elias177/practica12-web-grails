<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'Departamento')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div id="content" class="container-fluid">
    <div class="span8">
        <g:if test="${flash.message}">
            <div class="alert alert-info alert-block message" role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
        </g:if>
        <div class="widget-box">
            <div class="widget-title">
                <span class="icon"> <i class="icon-building"></i> </span>
                <h5><g:message code="user.label"/></h5>
            </div>
            <div class="widget-content">
                <div class="row-fluid">
                    <div class="span12">
                        <table class="">
                            <tbody>
                            <tr>
                                <td>
                                    <g:form resource="${this.user}" method="DELETE">

                                        <div class="btn-group">
                                            <h3><f:display bean="user" property="username"/> <g:link class="btn btn-primary btn-mini" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                                <input class="btn btn-danger btn-mini delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                            </h3>
                                        </div>
                                    </g:form>
                                </td>
                            </tr>
                            <tr>
                                <g:each var="cont" in="${userRoleList}">
                                    <g:if test="${cont.user == this.user}">

                                        <td><g:message code="role.label"/>: ${cont.role}</td>

                                    </g:if>

                                </g:each>
                            </tr>
                            </tbody>
                        </table>

                        <hr>
                        <h4><g:message code="departamento.label"/>s</h4>
                        <table class="table table-bordered table-invoice-full">
                            <thead>
                            <tr>
                                <th class="head0"><g:message code="nombre.label"/></th>
                                <th class="head1"><g:message code="descripcion.label"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${this.user.deps}">
                                <tr>
                                    <td>${it.nombre}</td>
                                    <td>${it.descripcion}</td>
                                </tr>
                            </g:each>

                            </tbody>
                        </table>


                    </div>

                </div>


            </div>
        </div>
    </div>

</div>
</body>
</html>
