<!DOCTYPE html>
<html lang="en">
<head>
    <title>Black Mesa Admin</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
        <li class="active"><a href="${createLink(controller:'dashboard', action:'index')}"><i class="icon icon-home"></i> <span>Dashboard</span></a> </li>
        <li> <a  href="${createLink(controller:'contacto', action:'index')}"><i class="icon icon-envelope"></i> <span><g:message code="contacto.label" />s</span></a> </li>
        <li> <a href="${createLink(controller:'departamento', action:'index')}"><i class="icon icon-building"></i> <span><g:message code="departamento.label" />s</span></a> </li>
        <li > <a href="${createLink(controller:'categoria', action:'index')}"><i class="icon icon-list"></i> <span><g:message code="categorias.label" /></span></a> </li>

        <g:if test="${user.admin}">
            <li> <a href="${createLink(controller:'user', action:'index')}"><i class="icon icon-user"></i> <span><g:message code="user.label" />s</span></a> </li>
        </g:if>
    </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">


</div>

<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
    <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in">Themedesigner.in</a> </div>
</div>

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
