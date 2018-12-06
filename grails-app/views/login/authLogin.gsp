<!DOCTYPE html>
<html lang="en">

<head>
    <title>Black Mesa Admin</title><meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <asset:stylesheet href="bootstrap.min.css"/>
    <asset:stylesheet href="bootstrap-responsive.min.css"/>
    <asset:stylesheet href="matrix-login.css"/>
    <asset:stylesheet href="css/font-awesome.css"/>
    <asset:link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>



    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

</head>
<body>


    <div id="loginbox">
        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
            <div class="control-group normal_text"> <h3> <asset:image src="logo3.png" width="100" height="200"/> </h3></div>
            <g:if test='${flash.message}'>
                <div class="alert alert-danger alert-block login_message">${flash.message}</div>
            </g:if>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lo"><i class="icon-user"> </i></span><input type="text" placeholder="<g:message code='springSecurity.login.username.label'/>" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>

                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_lr"><i class="icon-lock"></i></span><input type="password" placeholder="<g:message code='springSecurity.login.password.label'/>" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>

                    </div>
                </div>
            </div>
            <div class="form-actions">
                <span class="pull-right"><input type="submit" id="submit" class="btn btn-success" value="Login" /></span>
                <p id="remember_me_holder">
                    <input type="checkbox" class="chk checker" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                    <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
                </p>
            </div>
        </form>
    </div>


<asset:javascript src="jquery.min.js"/>
<asset:javascript src="matrix.login.js"/>

</body>

</html>
