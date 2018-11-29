package practica12.web.grails

class Departamento {

    String nombre
    String descripcion
    User usuario
    Date fecha
    String status
    static hasMany = [contactos:Contacto]

    static constraints = {
       usuario nullable: true
    }
}