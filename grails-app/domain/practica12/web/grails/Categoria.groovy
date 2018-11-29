package practica12.web.grails

class Categoria {

    String nombre
    String descripcion
    User usuario
    Date fecha
    String status

    static constraints = {
        usuario nullable: true
    }
}
