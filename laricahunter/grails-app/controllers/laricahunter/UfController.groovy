package laricahunter

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
@Secured(['ROLE_ADMIN'])


@Transactional(readOnly = true)
class UfController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Uf.list(params), model:[ufInstanceCount: Uf.count()]
    }

    def show(Uf ufInstance) {
        respond ufInstance
    }

    def create() {
        respond new Uf(params)
    }

    @Transactional
    def save(Uf ufInstance) {
        if (ufInstance == null) {
            notFound()
            return
        }

        if (ufInstance.hasErrors()) {
            respond ufInstance.errors, view:'create'
            return
        }

        ufInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ufInstance.label', default: 'Uf'), ufInstance.id])
                redirect ufInstance
            }
            '*' { respond ufInstance, [status: CREATED] }
        }
    }

    def edit(Uf ufInstance) {
        respond ufInstance
    }

    @Transactional
    def update(Uf ufInstance) {
        if (ufInstance == null) {
            notFound()
            return
        }

        if (ufInstance.hasErrors()) {
            respond ufInstance.errors, view:'edit'
            return
        }

        ufInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Uf.label', default: 'Uf'), ufInstance.id])
                redirect ufInstance
            }
            '*'{ respond ufInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Uf ufInstance) {

        if (ufInstance == null) {
            notFound()
            return
        }

        ufInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Uf.label', default: 'Uf'), ufInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ufInstance.label', default: 'Uf'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
