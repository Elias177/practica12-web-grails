package practica12.web.grails

class BootStrap {

    def init = { servletContext ->

        if(User.count == 0){

            def adminRole = new Role(authority: 'ROLE_ADMIN').save()

            def normalRole = new Role(authority: 'ROLE_USER').save()

            def userNormal = new User(username: 'user', password: 'user',fecha: new Date(),status: "auto-generado al iniciar").save(failOnError: true)

            def testUser = new User(username: 'admin', password: 'admin',fecha: new Date(),status: "auto-generado al iniciar").save(failOnError: true)

            def r = new UserRole(user: testUser,role: adminRole).save(failOnError: true)

            def r2 = new UserRole(user: userNormal,role: normalRole).save(failOnError: true)


        }


    }
    def destroy = {
    }
}
