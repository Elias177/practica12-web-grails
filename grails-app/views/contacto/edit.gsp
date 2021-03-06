<!DOCTYPE html>
<html lang="en">
<head>
    <title>Black Mesa Admin</title>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'contacto.label', default: 'Contacto')}" />

</head>
<body>

<!--sidebar-menu-->

<!--main-container-part-->
<!--End-breadcrumbs-->
<div id="content" class="container-fluid">

    <div class="row-fluid">

        <div class="span12">
            <g:if test="${flash.message}">
                <div class="alert alert-info alert-block message" role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.contacto}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.contacto}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <div class="widget-box">
                <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                    <h5><g:message code="default.edit.label" args="[entityName]" /></h5>
                </div>

                <div id="tabl" class="widget-content nopadding">

                    <g:form resource="${this.contacto}" method="PUT" class="form-horizontal">
                        <g:hiddenField name="version" value="${this.contacto?.version}" />
                        <div class="control-group">
                            <label class="control-label"><g:message code="nombre.label" /> :</label>
                            <div class="controls">
                                <g:field name="nombre" type="text" value="${this.contacto?.nombre}" class="span11" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><g:message code="apellido.label" /> :</label>
                            <div class="controls">
                                <g:field name="apellido" type="text" value="${this.contacto?.apellido}" class="span11" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Email :</label>
                            <div class="controls">
                                <g:field name="email" type="email" value="${this.contacto?.email}" class="span11" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><g:message code="direccion.label" /> :</label>
                            <div class="controls">
                                <g:textField name="direccion" type="text" value="${this.contacto?.direccion}" class="span11" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><g:message code="puesto.label" /> :</label>
                            <div class="controls">
                                <g:textField name="puesto" type="text" class="span11" value="${this.contacto?.puesto}" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><g:message code="telefono.label" /> :</label>
                            <div class="controls">
                                <g:field name="telefono" type="text" id="mask-phone" value="${this.contacto?.telefono}" class="span11 mask text" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">
                                <g:message code="categoria.label" /> :</label>
                            <div class="controls">
                                <g:select class="span11" name='categoria' value="${this.contacto?.categoria.nombre}"
                                          noSelection="${['null':message(code:'select.label')]}"
                                          from='${categoriaList}'
                                          optionKey="id" optionValue="nombre" required="required"></g:select>
                                <g:link class="btn btn-success create" controller="categoria" action="create"><i class="icon-plus"></i></g:link>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">
                                <g:message code="departamento.label" />s :
                            </label>
                            <div class="controls">
                                <table class="table table-striped with-check span11">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th ><g:message code="nombre.label" /></th>
                                        <th ><g:message code="descripcion.label" /></th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <g:each in="${departamentoList}">
                                        <tr class="gradeX">
                                            <td><g:checkBox name="departamento" value="${it.id}" checked="false" /></td>
                                            <td>${it.nombre}</td>
                                            <td>${it.descripcion}</td>
                                        </tr>
                                    </g:each>

                                    </tbody>

                                </table>
                                <g:link class="btn btn-success create" controller="departamento" action="create"><i class="icon-plus"></i></g:link>
                            </div>


                        </div>
                        <div class="form-actions">
                            <input class="save btn btn-success" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
