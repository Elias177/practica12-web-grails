package practica12.web.grails

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ContactoServiceSpec extends Specification {

    ContactoService contactoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Contacto(...).save(flush: true, failOnError: true)
        //new Contacto(...).save(flush: true, failOnError: true)
        //Contacto contacto = new Contacto(...).save(flush: true, failOnError: true)
        //new Contacto(...).save(flush: true, failOnError: true)
        //new Contacto(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //contacto.id
    }

    void "test get"() {
        setupData()

        expect:
        contactoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Contacto> contactoList = contactoService.list(max: 2, offset: 2)

        then:
        contactoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        contactoService.count() == 5
    }

    void "test delete"() {
        Long contactoId = setupData()

        expect:
        contactoService.count() == 5

        when:
        contactoService.delete(contactoId)
        sessionFactory.currentSession.flush()

        then:
        contactoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Contacto contacto = new Contacto()
        contactoService.save(contacto)

        then:
        contacto.id != null
    }
}
