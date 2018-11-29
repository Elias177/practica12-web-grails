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
        email unique: true
        telefono unique: true
        usuario nullable: true
    }
}
