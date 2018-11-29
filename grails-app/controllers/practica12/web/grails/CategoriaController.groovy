package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_USER'])
class CategoriaController {

    CategoriaService categoriaService

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
        respond categoriaService.list(params), model:[categoriaCount: categoriaService.count(), 'user':userLogged]
    }

    def show(Long id) {
        respond categoriaService.get(id)
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
        respond new Categoria(params) , model: ['user':userLogged]
    }

    def save(Categoria categoria) {
        if (categoria == null) {
            notFound()
            return
        }
        categoria.usuario = User.findById( (long) springSecurityService.principal.id)

            categoria.fecha = new Date()
            categoria.status = "creada - "+ new Date().toString()


        try {
            categoriaService.save(categoria)
        } catch (ValidationException e) {
            respond categoria.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoria.id])
                redirect categoria
            }
            '*' { respond categoria, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond categoriaService.get(id)
    }

    def update(Categoria categoria) {
        if (categoria == null) {
            notFound()
            return
        }

        try {
            categoriaService.save(categoria)
        } catch (ValidationException e) {
            respond categoria.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoria.id])
                redirect categoria
            }
            '*'{ respond categoria, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        categoriaService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
