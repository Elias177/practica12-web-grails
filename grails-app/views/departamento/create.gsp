<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'departamento.label', default: 'Departamento')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" class="container-fluid">

        <div class="row-fluid">

            <div class="span12">
                <g:if test="${flash.message}">
                    <div class="alert alert-info alert-block message" role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.contacto}">
                    <ul class="alert alert-danger alert-block message" role="alert"><a class="close" data-dismiss="alert" href="#">×</a>
                        <g:eachError bean="${this.contacto}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <div class="widget-box">
                    <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                        <h5><g:message code="default.create.label" args="[entityName]" /></h5>
                    </div>
                    <div id="tabl" class="widget-content nopadding">
                        <g:form resource="${this.departamento}" method="POST" class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label"><g:message code="nombre.label" /> :</label>
                                <div class="controls">
                                    <g:textField name="nombre" type="text" class="span11" required="required"/>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label"><g:message code="descripcion.label" /> :</label>
                                <div class="controls">
                                    <g:textArea name="descripcion" class="span11" required="required"/><br/>
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
    </body>
</html>
