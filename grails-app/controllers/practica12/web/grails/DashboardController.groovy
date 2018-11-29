package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

import java.security.Principal

@Secured(['ROLE_ADMIN','ROLE_USER'])
class DashboardController {

    SpringSecurityService springSecurityService

    def index() {

        def userLogged = new LoggedUser()

        userLogged.setUsername(springSecurityService.principal.username)

        def userAuth = springSecurityService.principal.authorities
        if(userAuth.toString() == "[ROLE_ADMIN]"){
            userLogged.setAdmin(true)
        }else{
            userLogged.setAdmin(false)
        }

        render(view: "/index",model: ['user':userLogged])
    }

    class LoggedUser{

        String username
        boolean admin

        String getUsername() {
            return username
        }

        void setUsername(String username) {
            this.username = username
        }

        boolean getAdmin() {
            return admin
        }

        void setAdmin(boolean admin) {
            this.admin = admin
        }
    }


}
