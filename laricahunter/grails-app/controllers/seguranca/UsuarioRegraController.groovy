package seguranca

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
@Secured(['ROLE_ADMIN'])


@Transactional(readOnly = true)
class UsuarioRegraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UsuarioRegra.list(params), model:[usuarioRegraInstanceCount: UsuarioRegra.count()]
    }

    def show(UsuarioRegra usuarioRegraInstance) {
        respond usuarioRegraInstance
    }

    def create() {
        respond new UsuarioRegra(params)
    }

    @Transactional
    def save(UsuarioRegra usuarioRegraInstance) {
        if (usuarioRegraInstance == null) {
            notFound()
            return
        }

        if (usuarioRegraInstance.hasErrors()) {
            respond usuarioRegraInstance.errors, view:'create'
            return
        }

        usuarioRegraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuarioRegraInstance.label', default: 'UsuarioRegra'), usuarioRegraInstance.id])
                redirect action:"index", method:"POST"
            }
            '*' { respond usuarioRegraInstance, [status: CREATED] }
        }
    }

    def edit(UsuarioRegra usuarioRegraInstance) {
        respond usuarioRegraInstance
    }

    @Transactional
    def update(UsuarioRegra usuarioRegraInstance) {
        if (usuarioRegraInstance == null) {
            notFound()
            return
        }

        if (usuarioRegraInstance.hasErrors()) {
            respond usuarioRegraInstance.errors, view:'edit'
            return
        }

        usuarioRegraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UsuarioRegra.label', default: 'UsuarioRegra'), usuarioRegraInstance.id])
                redirect usuarioRegraInstance
            }
            '*'{ respond usuarioRegraInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UsuarioRegra usuarioRegraInstance) {

        if (usuarioRegraInstance == null) {
            notFound()
            return
        }

        usuarioRegraInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UsuarioRegra.label', default: 'UsuarioRegra'), usuarioRegraInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioRegraInstance.label', default: 'UsuarioRegra'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
