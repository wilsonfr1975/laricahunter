package laricahunter

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
@Secured(['ROLE_ADMIN'])


@Transactional(readOnly = true)
class PratoTipicoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PratoTipico.list(params), model:[pratoTipicoInstanceCount: PratoTipico.count()]
    }

    def show(PratoTipico pratoTipicoInstance) {
        respond pratoTipicoInstance
    }

    def create() {
        respond new PratoTipico(params)
    }

    @Transactional
    def save(PratoTipico pratoTipicoInstance) {
        if (pratoTipicoInstance == null) {
            notFound()
            return
        }

        if (pratoTipicoInstance.hasErrors()) {
            respond pratoTipicoInstance.errors, view:'create'
            return
        }

        pratoTipicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pratoTipicoInstance.label', default: 'PratoTipico'), pratoTipicoInstance.id])
                redirect pratoTipicoInstance
            }
            '*' { respond pratoTipicoInstance, [status: CREATED] }
        }
    }

    def edit(PratoTipico pratoTipicoInstance) {
        respond pratoTipicoInstance
    }

    @Transactional
    def update(PratoTipico pratoTipicoInstance) {
        if (pratoTipicoInstance == null) {
            notFound()
            return
        }

        if (pratoTipicoInstance.hasErrors()) {
            respond pratoTipicoInstance.errors, view:'edit'
            return
        }

        pratoTipicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PratoTipico.label', default: 'PratoTipico'), pratoTipicoInstance.id])
                redirect pratoTipicoInstance
            }
            '*'{ respond pratoTipicoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PratoTipico pratoTipicoInstance) {

        if (pratoTipicoInstance == null) {
            notFound()
            return
        }

        pratoTipicoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PratoTipico.label', default: 'PratoTipico'), pratoTipicoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pratoTipicoInstance.label', default: 'PratoTipico'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
