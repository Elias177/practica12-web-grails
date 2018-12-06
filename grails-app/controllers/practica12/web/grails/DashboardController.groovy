package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

import java.security.Principal

@Secured(["ROLE_ADMIN","ROLE_USER"])
class DashboardController {

    SpringSecurityService springSecurityService

    ContactoService contactoService
    CategoriaService categoriaService
    DepartamentoService departamentoService

    class dataPoint{

        float y;
        String label;

        float getY() {
            return y
        }

        void setY(float y) {
            this.y = y
        }

        String getLabel() {
            return label
        }

        void setLabel(String label) {
            this.label = label
        }
    }

    def index() {

        def userLogged = new LoggedUser()

        userLogged.setUsername(springSecurityService.principal.username)

        def userAuth = springSecurityService.principal.authorities
        if(userAuth.toString() == "[ROLE_ADMIN]"){
            userLogged.setAdmin(true)
        }else{
            userLogged.setAdmin(false)
        }

        render(view: "/index",model: ['userLog':userLogged,'categoriaList': categoriaService.list(), 'contactoList': contactoService.list(), 'departamentoList': departamentoService.list()])
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
