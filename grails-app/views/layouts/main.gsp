<!doctype html>
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
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
    <style>
        .gradeXX{
            cursor: pointer;
        }
    </style>
    <g:layoutHead/>
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
        <form name="submitForm" class="form-inline" method="POST" action="${createLink(controller: 'logout')}">
            <input type="hidden" name="" value="">
        </form>
        <li class="dropdown" id="profile-messages"><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">Welcome ${userLog.username}</span><b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a href="/?lang=es"><i class="icon-flag"></i>Spanish</a></li>
                <li class="divider"></li>
                <li><a href="/?lang=en"><i class="icon-flag"></i>English</a></li>
                <li class="divider"></li>
                <li><a title="" HREF="javascript:document.submitForm.submit()"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
            </ul>
        </li>
        <li class="">

            <a title="" HREF="javascript:document.submitForm.submit()"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a>


        </li>
    </ul>
</div>
<!--close-top-Header-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>Dashboard</a>
    <ul>
        <li><a href="${createLink(controller:'dashboard', action:'index')}"><i class="icon icon-home"></i> <span>Dashboard</span></a> </li>
        <li> <a  href="${createLink(controller:'contacto', action:'index')}"><i class="icon icon-envelope"></i> <span><g:message code="contacto.label" />s</span></a> </li>
        <li> <a href="${createLink(controller:'departamento', action:'index')}"><i class="icon icon-building"></i> <span><g:message code="departamento.label" />s</span></a> </li>
        <li > <a href="${createLink(controller:'categoria', action:'index')}"><i class="icon icon-list"></i> <span><g:message code="categorias.label" /></span></a> </li>
        <g:if test="${userLog.admin}">
            <li > <a href="${createLink(controller:'user', action:'index')}"><i class="icon icon-user"></i> <span><g:message code="user.label" />s</span></a> </li>

        </g:if>
    </ul>
</div>


<g:layoutBody/>

<div class="row-fluid">
    <div id="footer" class="span12"> 2018 &copy; Combine Group </div>
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
