<!DOCTYPE html>
<html lang="en">
<head>
    <title>Black Mesa Admin</title>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'contacto.label', default: 'Contacto')}" />
</head>
<body>

<div id="content" class="container-fluid">

    <div class="row-fluid">

        <div class="span12">
            <div class="widget-box">
                <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                    <h5><g:message code="default.create.label" args="[entityName]" /></h5>
                </div>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.contacto}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.contacto}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <div id="tabl" class="widget-content nopadding">
                    <g:form resource="${this.contacto}" method="POST" class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label"><g:message code="nombre.label" /> :</label>
                            <div class="controls">
                                <g:field name="nombre" type="text" class="span11" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><g:message code="apellido.label" /> :</label>
                            <div class="controls">
                                <g:field name="apellido" type="text" class="span11" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Email :</label>
                            <div class="controls">
                                <g:field name="email" type="email" class="span11" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><g:message code="direccion.label" /> :</label>
                            <div class="controls">
                                <g:textField name="direccion" type="text" class="span11" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><g:message code="puesto.label" /> :</label>
                            <div class="controls">
                                <g:textField name="puesto" type="text" class="span11" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><g:message code="telefono.label" /> :</label>
                            <div class="controls">
                                <g:field name="telefono" type="tel" class="span11" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">
                                <g:message code="categoria.label" /> :</label>
                            <div class="controls">
                                <g:select class="span11" name='categoria' value="${categoria?.id}"
                                          noSelection="${['null':'Select One...']}"
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
                            <g:submitButton name="create" class="btn btn-success save" value="${message(code: 'default.button.create.label', default: 'Create')}" />

                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>

</div>




<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
    <div id="footer" class="span12"> 2018 &copy; Combine Group </div>
</div>

</body>
</html>

