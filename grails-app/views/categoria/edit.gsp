<!DOCTYPE html>
<html lang="en">
<head>
    <title>Black Mesa Admin</title>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />

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
            <g:hasErrors bean="${this.categoria}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.categoria}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <div class="widget-box">
                <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                    <h5><g:message code="default.edit.label" args="[entityName]" /></h5>
                </div>

                <div id="tabl" class="widget-content nopadding">

                    <g:form resource="${this.categoria}" method="PUT" class="form-horizontal">
                        <g:hiddenField name="version" value="${this.categoria?.version}" />
                        <div class="control-group">
                            <label class="control-label">Nombre :</label>
                            <div class="controls">
                                <g:textField name="nombre" type="text" class="span11" value="${this.categoria?.nombre}" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">Descripcion :</label>
                            <div class="controls">
                                <g:textArea name="descripcion" class="span11" value="${this.categoria?.descripcion}" required="required"/><br/>
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
