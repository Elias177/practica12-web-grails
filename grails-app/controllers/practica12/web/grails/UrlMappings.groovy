package practica12.web.grails

import grails.plugin.springsecurity.annotation.Secured


@Secured(["ROLE_ADMIN","ROLE_USER"])
class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "dashboard")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
