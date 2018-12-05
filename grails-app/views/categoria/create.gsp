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

    <div class="row-fluid">

        <div class="span12">
            <div class="widget-box">
                <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                    <h5><g:message code="default.create.label" args="[entityName]" /></h5>
                </div>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.categoria}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.categoria}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <div id="tabl" class="widget-content nopadding">
                    <g:form resource="${this.categoria}" method="POST" class="form-horizontal">
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


<div class="row-fluid">
    <div id="footer" class="span12"> 2018 &copy; Combine Group </div>
</div>


</body>
</html>
