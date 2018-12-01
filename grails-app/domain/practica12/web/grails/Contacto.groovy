package practica12.web.grails

class Contacto {

    String nombre
    String apellido
    String email
    String direccion
    String puesto
    String telefono
    Categoria categoria
    User usuario
    Date fecha
    String status
    static hasMany = [departamentos:Departamento]
    static belongsTo = Departamento

    static constraints = {
        email unique: true, email: true, blank: false
        telefono unique: true, blank: false
        usuario nullable: true, blank: false
        nombre blank: false
        apellido blank: false
        direccion blank: false
        puesto blank: false
        telefono blank: false
    }
}
