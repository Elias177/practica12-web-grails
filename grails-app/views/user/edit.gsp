<!DOCTYPE html>
<html lang="en">
<head>
    <title>Black Mesa Admin</title>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'Categoria')}" />

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
            <g:hasErrors bean="${this.user}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.user}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <div class="widget-box">
                <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                    <h5><g:message code="default.edit.label" args="[entityName]" /></h5>
                </div>

                <div id="tabl" class="widget-content nopadding">

                    <g:form resource="${this.user}" method="PUT" class="form-horizontal">
                        <g:hiddenField name="version" value="${this.user?.version}" />
                        <div class="control-group">
                            <label class="control-label"><g:message code="nombre.label" /> :</label>
                            <div class="controls">
                                <g:field name="username" type="text" value="${this.user?.username}" class="span11" required="required"/>
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
