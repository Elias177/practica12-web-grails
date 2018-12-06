<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'contacto.label', default: 'Contacto')}" />
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
                <h5><g:message code="contacto.label"/></h5>
            </div>
            <div class="widget-content">
                <div class="row-fluid">
                    <div class="span12">
                        <table class="">
                            <tbody>
                            <tr>
                                <td>
                                    <g:form resource="${this.contacto}" method="DELETE">

                                        <div class="btn-group">
                                            <h3><f:display bean="contacto" property="nombre"/> <f:display bean="contacto" property="apellido"/> <g:link class="btn btn-primary btn-mini" action="edit" resource="${this.contacto}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                                <input class="btn btn-danger btn-mini delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                            </h3>
                                        </div>
                                    </g:form>
                                </td>
                            </tr>
                            <tr>
                                <td><g:message code="puesto.label"/>: <f:display bean="contacto" property="puesto"/></td>
                            </tr>
                            <tr>
                                <td><g:message code="categoria.label"/>: ${this.contacto.categoria.nombre}</td>
                            </tr>
                            <tr>
                                <td><g:message code="direccion.label"/>: <f:display bean="contacto" property="direccion"/></td>
                            </tr>
                            <tr>
                                <td><g:message code="telefono.label"/>: <f:display bean="contacto" property="telefono"/></td>
                            </tr>
                            <tr>
                                <td>Email: <f:display bean="contacto" property="email"/></td>
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
                            <g:each in="${this.contacto.deps}">
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
