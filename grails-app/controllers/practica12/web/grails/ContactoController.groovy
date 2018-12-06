package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_USER'])
class ContactoController {

    ContactoService contactoService
    CategoriaService categoriaService
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
        respond contactoService.list(params), model:[contactoCount: contactoService.count(),'userLog': userLogged]
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


        respond contactoService.get(id),model: ['userLog': userLogged]
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



        respond new Contacto(params),model: ['userLog': userLogged, 'categoriaList': categoriaService.list(),'departamentoList': departamentoService.list()]
    }

    def save(Contacto contacto) {
        if (contacto == null) {
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

        contacto.usuario = User.findById( (long) springSecurityService.principal.id)

        contacto.fecha = new Date()
        contacto.status = message(code: "creada.label")+" - "+ new Date().toString()



        try {
            contactoService.save(contacto)
        } catch (ValidationException e) {
            respond contacto.errors, view:'create', model: ['userLog': userLogged, 'categoriaList': categoriaService.list(),'departamentoList': departamentoService.list()]
            return
        }

        def deps = params.list('departamento')
        for(String d in deps){
            def departa =  Departamento.findById(Long.parseLong(d))
            departa.addToConts(contacto).save(flush: true)
            contacto.addToDeps(departa).save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contacto.label', default: 'Contacto'), contacto.nombre])
                redirect action: "index"
            }
            '*' { respond contacto, [status: CREATED] }
        }
    }

    def edit(Long id) {

        def userLogged = new LoggedUser()

        userLogged.setUsername(springSecurityService.principal.username)
        println(userLogged.getUsername())
        def userAuth = springSecurityService.principal.authorities
        if(userAuth.toString() == "[ROLE_ADMIN]"){
            userLogged.setAdmin(true)
        }else{
            userLogged.setAdmin(false)
        }

        respond contactoService.get(id), model: ['userLog': userLogged, 'categoriaList': categoriaService.list(),'departamentoList': departamentoService.list()]
    }

    def update(Contacto contacto) {

        def userLogged = new LoggedUser()

        userLogged.setUsername(springSecurityService.principal.username)

        def userAuth = springSecurityService.principal.authorities
        if(userAuth.toString() == "[ROLE_ADMIN]"){
            userLogged.setAdmin(true)
        }else{
            userLogged.setAdmin(false)
        }

        if (contacto == null) {
            notFound()
            return
        }


        contacto.usuario = User.findById( (long) springSecurityService.principal.id)

        contacto.fecha = new Date()
        contacto.status = message(code: "editada.label")+" - "+ new Date().toString()

        if(contacto.deps.size() != 0){
            for(Departamento d in departamentoService.list()){

                def book = contacto.deps.find { it.id == d.id }

                if(book != null)
                contacto.removeFromDeps(book)
            }

        }


        try {
            contactoService.save(contacto)
        } catch (ValidationException e) {
            respond contacto.errors, view:'edit', model: ['userLog':userLogged]
            return
        }

        def deps = params.list('departamento')

        for(String d in deps){
            def departa =  Departamento.findById(Long.parseLong(d))
            departa.addToConts(contacto).save(flush: true)
            contacto.addToDeps(departa).save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'contacto.label', default: 'Contacto'), contacto.nombre])
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
