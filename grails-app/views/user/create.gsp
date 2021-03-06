<!DOCTYPE html>
<html lang="en">
<head>
    <title>Black Mesa Admin</title>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'Contacto')}" />
</head>
<body>

<div id="content" class="container-fluid">

    <div class="row-fluid">

        <div class="span12">
            <g:if test="${flash.message}">
                <div class="alert alert-info alert-block message" role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
                <ul class="alert alert-danger alert-block message" role="alert"><a class="close" data-dismiss="alert" href="#">×</a>
                    <g:eachError bean="${this.user}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <div class="widget-box">
                <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
                    <h5><g:message code="default.create.label" args="[entityName]" /></h5>
                </div>

                <div id="tabl" class="widget-content nopadding">
                    <g:form resource="${this.user}" method="POST" class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label">Username :</label>
                            <div class="controls">
                                <g:field name="username" type="text" class="span11" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><g:message code="password.label" /> :</label>
                            <div class="controls">
                                <g:field name="password" type="text" class="span11" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><g:message code="role.label" /> :</label>
                            <div class="controls">
                                <g:checkBox name="admin" checked="false" />
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

