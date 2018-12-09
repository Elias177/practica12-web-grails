package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN'])
class UserController {

    UserService userService
    UserRoleService userRoleService
    DepartamentoService departamentoService
    RoleService roleService

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

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

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



        respond userService.list(params), model:[userCount: userService.count(), 'userLog': userLogged, userRoleList: userRoleService.list()]
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
        println(userLogged.username)
        respond userService.get(id), model: ['userLog': userLogged, 'userRoleList': userRoleService.list()]
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

        respond new User(params), model: ['userLog': userLogged,'departamentoList': departamentoService.list()]
    }

    def save(User user) {

        def userLogged = new LoggedUser()

        userLogged.setUsername(springSecurityService.principal.username)

        def userAuth = springSecurityService.principal.authorities
        if(userAuth.toString() == "[ROLE_ADMIN]"){
            userLogged.setAdmin(true)
        }else{
            userLogged.setAdmin(false)
        }



        if (user == null) {
            notFound()
            return
        }


        user.usuario = User.findById( (long) springSecurityService.principal.id)

        user.fecha = new Date()
        user.status = message(code: "creada.label")+" - "+ new Date().toString()


        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'create', model: ['userLog': userLogged]
            return
        }


        if(!params.list('admin').isEmpty()){
            def r = new UserRole(user: user,role: Role.findById(1)).save(flush: true)
        }else{
            def r = new UserRole(user: user,role: Role.findById(2)).save(flush: true)

        }

        def deps = params.list('departamento')

        for(String d in deps){
            def departa =  Departamento.findById(Long.parseLong(d))
            user.addToDeps(departa).save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
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


        respond userService.get(id), model: ['userLog': userLogged, 'departamentoList': departamentoService.list()]
    }

    def update(User user) {

        def userLogged = new LoggedUser()

        userLogged.setUsername(springSecurityService.principal.username)

        def userAuth = springSecurityService.principal.authorities
        if(userAuth.toString() == "[ROLE_ADMIN]"){
            userLogged.setAdmin(true)
        }else{
            userLogged.setAdmin(false)
        }



        if (user == null) {
            notFound()
            return
        }


        user.usuario = User.findById( (long) springSecurityService.principal.id)

        user.fecha = new Date()
        user.status = message(code: "editada.label")+" - "+ new Date().toString()

        if(user.deps.size() != 0){
            for(Departamento d in departamentoService.list()){

                def book = user.deps.find { it.id == d.id }

                if(book != null)
                    user.removeFromDeps(book)
            }

        }

        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'edit',model: ['userLog': userLogged]
            return
        }

        def deps = params.list('departamento')

        for(String d in deps){
            def departa =  Departamento.findById(Long.parseLong(d))
            user.addToDeps(departa).save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }


        User u = User.findById(id)

        if(u.deps.size() != 0){
            for(Departamento d in departamentoService.list()){

                def book = u.deps.find { it.id == d.id }

                if(book != null)
                    u.removeFromDeps(book)
            }

        }



        userRoleService.delete(UserRole.findByUser(u))



       userService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
