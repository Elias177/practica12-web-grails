package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_USER'])
class ContactoController {

    ContactoService contactoService



    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    SpringSecurityService springSecurityService
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

    def index(Integer max) {
        def userLogged = new LoggedUser()

        userLogged.setUsername(springSecurityService.principal.username)

        def userAuth = springSecurityService.principal.authorities
        if(userAuth.toString() == "[ROLE_ADMIN]"){
            userLogged.setAdmin(true)
        }else{
            userLogged.setAdmin(false)
        }
        params.max = Math.min(max ?: 10, 100)
        respond contactoService.list(params), model:[contactoCount: contactoService.count(),'user': userLogged]
    }

    def show(Long id) {
        respond contactoService.get(id)
    }

    def create() {
        respond new Contacto(params)
    }

    def save(Contacto contacto) {
        if (contacto == null) {
            notFound()
            return
        }

        try {
            contactoService.save(contacto)
        } catch (ValidationException e) {
            respond contacto.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contacto.label', default: 'Contacto'), contacto.id])
                redirect contacto
            }
            '*' { respond contacto, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond contactoService.get(id)
    }

    def update(Contacto contacto) {
        if (contacto == null) {
            notFound()
            return
        }

        try {
            contactoService.save(contacto)
        } catch (ValidationException e) {
            respond contacto.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'contacto.label', default: 'Contacto'), contacto.id])
                redirect contacto
            }
            '*'{ respond contacto, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        contactoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'contacto.label', default: 'Contacto'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contacto.label', default: 'Contacto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
