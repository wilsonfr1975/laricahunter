package seguranca

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
@Secured(['ROLE_ADMIN'])


@Transactional(readOnly = true)
class RegraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Regra.list(params), model:[regraInstanceCount: Regra.count()]
    }

    def show(Regra regraInstance) {
        respond regraInstance
    }

    def create() {
        respond new Regra(params)
    }

    @Transactional
    def save(Regra regraInstance) {
        if (regraInstance == null) {
            notFound()
            return
        }

        if (regraInstance.hasErrors()) {
            respond regraInstance.errors, view:'create'
            return
        }

        regraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'regraInstance.label', default: 'Regra'), regraInstance.id])
                redirect regraInstance
            }
            '*' { respond regraInstance, [status: CREATED] }
        }
    }

    def edit(Regra regraInstance) {
        respond regraInstance
    }

    @Transactional
    def update(Regra regraInstance) {
        if (regraInstance == null) {
            notFound()
            return
        }

        if (regraInstance.hasErrors()) {
            respond regraInstance.errors, view:'edit'
            return
        }

        regraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Regra.label', default: 'Regra'), regraInstance.id])
                redirect regraInstance
            }
            '*'{ respond regraInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Regra regraInstance) {

        if (regraInstance == null) {
            notFound()
            return
        }

        regraInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Regra.label', default: 'Regra'), regraInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'regraInstance.label', default: 'Regra'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
