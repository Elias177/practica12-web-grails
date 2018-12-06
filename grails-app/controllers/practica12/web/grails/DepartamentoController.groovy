package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_USER'])
class DepartamentoController {

    ContactoService contactoService
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
        println(userLogged.getAdmin())
        params.max = Math.min(max ?: 10, 100)

        println(User.findById(springSecurityService.principal.id).deps.size())

        if(!userLogged.getAdmin()){
            respond User.findById(springSecurityService.principal.id).deps.toList(), model:[departamentoCount: departamentoService.count(), 'userLog': userLogged]
            return
        }

        respond departamentoService.list(params), model:[departamentoCount: departamentoService.count(), 'userLog': userLogged]
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
        respond departamentoService.get(id), model: ['userLog': userLogged]
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

        respond new Departamento(params),model: ['userLog': userLogged]
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
            respond departamento.errors, view:'create', model: ['userLog': userLogged]
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamento.nombre])
                redirect action: 'index'
            }
            '*' { respond departamento, [status: CREATED] }
        }
    }

    def edit(Long id) {


        def userLogged = new LoggedUser()

        userLogged.setUsername(springSecurityService.principal.username)

        def userAuth = springSecurityService.principal.authorities
        if(userAuth.toString() == "[ROLE_ADMIN]"){
            userLogged.setAdmin(true)
        }else{
            userLogged.setAdmin(false)
        }

        respond departamentoService.get(id), model: ['userLog': userLogged, 'contactoList': contactoService.list()]
    }

    def update(Departamento departamento) {
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
        departamento.status = message(code: "editada.label")+" - "+ new Date().toString()

        if(departamento.conts.size() != 0){
            for(Contacto d in contactoService.list()){

                def book = departamento.conts.find { it.id == d.id }

                if(book != null)
                    departamento.removeFromConts(book)
            }

        }

        try {
            departamentoService.save(departamento)
        } catch (ValidationException e) {
            respond departamento.errors, view:'edit'
            return
        }

        def deps = params.list('contacto')

        for(String d in deps){
            def departa =  Contacto.findById(Long.parseLong(d))
            departa.addToDeps(departamento).save(flush: true)
            departamento.addToConts(departa).save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamento.nombre])
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
