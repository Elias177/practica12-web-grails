package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_USER'])
class DepartamentoController {

    DepartamentoService departamentoService

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
        respond departamentoService.list(params), model:[departamentoCount: departamentoService.count(), 'user': userLogged]
    }

    def show(Long id) {
        def userLogged = new LoggedUser()

        userLogged.setUsername(springSecurityService.principal.username)

        def userAuth = springSecurityService.principal.authorities
        if(userAuth.toString() == "[ROLE_ADMIN]"){
            userLogged.setAdmin(true)
        }else{
            userLogged.setAdmin(false)
        }
        respond departamentoService.get(id), model: ['user': userLogged]
    }

    def create() {

        def userLogged = new LoggedUser()

        userLogged.setUsername(springSecurityService.principal.username)

        def userAuth = springSecurityService.principal.authorities
        if(userAuth.toString() == "[ROLE_ADMIN]"){
            userLogged.setAdmin(true)
        }else{
            userLogged.setAdmin(false)
        }

        respond new Departamento(params),model: ['user': userLogged]
    }

    def save(Departamento departamento) {
        if (departamento == null) {
            notFound()
            return
        }


        def userLogged = new LoggedUser()

        userLogged.setUsername(springSecurityService.principal.username)

        def userAuth = springSecurityService.principal.authorities
        if(userAuth.toString() == "[ROLE_ADMIN]"){
            userLogged.setAdmin(true)
        }else{
            userLogged.setAdmin(false)
        }

        departamento.usuario = User.findById( (long) springSecurityService.principal.id)

        departamento.fecha = new Date()
        departamento.status = message(code: "creada.label")+" - "+ new Date().toString()



        try {
            departamentoService.save(departamento)
        } catch (ValidationException e) {
            respond departamento.errors, view:'create', model: ['user': userLogged]
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamento.id])
                redirect action: 'index'
            }
            '*' { respond departamento, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond departamentoService.get(id)
    }

    def update(Departamento departamento) {
        if (departamento == null) {
            notFound()
            return
        }

        try {
            departamentoService.save(departamento)
        } catch (ValidationException e) {
            respond departamento.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamento.id])
                redirect departamento
            }
            '*'{ respond departamento, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        departamentoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
