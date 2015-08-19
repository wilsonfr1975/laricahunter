package laricahunter

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
@Secured(['ROLE_USER','ROLE_ADMIN'])
@Transactional(readOnly = true)
class CardapioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cardapio.list(params), model:[cardapioInstanceCount: Cardapio.count()]
    }

    def show(Cardapio cardapioInstance) {
        respond cardapioInstance
    }

    @Secured(['permitAll'])
    def image() {
        def something = Cardapio.get( params.id )
        byte[] image = something.avatar
        response.outputStream << image
    }

    def create() {
        respond new Cardapio(params)
    }

    @Transactional
    def save(Cardapio cardapioInstance) {
        if (cardapioInstance == null) {
            notFound()
            return
        }

        if (cardapioInstance.hasErrors()) {
            respond cardapioInstance.errors, view:'create'
            return
        }

        cardapioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cardapioInstance.label', default: 'Cardapio'), cardapioInstance.id])
                //redirect cardapioInstance
                redirect action:"index", method:"POST"
            }
            '*' { respond cardapioInstance, [status: CREATED] }
        }
    }

    def edit(Cardapio params) {
        respond params
    }

    @Transactional
    def update() {
        /*if (params == null) {
            notFound()
            return
        }

        if (params.hasErrors()) {
            respond params.errors, view:'edit'
            return
        }*/
        def registro = Cardapio.get(params.id)

        registro.preco = params.preco.toLong()
        registro.descricao = params.descricao

        //cardapioInstance.save flush:true
        registro.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cardapio.label', default: 'Cardapio'), registro.id])
               // redirect cardapioInstance
                redirect action:"index", method:"POST"
            }
            '*'{ respond cardapioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cardapio cardapioInstance) {

        if (cardapioInstance == null) {
            notFound()
            return
        }

        cardapioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cardapio.label', default: 'Cardapio'), cardapioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cardapioInstance.label', default: 'Cardapio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
