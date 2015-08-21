package laricahunter
import laricahunter.Estabelecimento
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static laricahunter.Estabelecimento.*
import static org.springframework.http.HttpStatus.*

@Secured(['permitAll'])

@Transactional(readOnly = true)
class HomeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def lista =  Estabelecimento.list()

        println  lista
        // respond estabelecimentoList , model:[estabelecimentoInstanceList: estabelecimentoList, estabelecimentoTotal: estabelecimentoList.totalCount]
        // redirect action:"home/index", model:[estabelecimentoList: estabelecimentoList]
        render (view:"/home/index", model:[estabelecimentoList: lista])
        //respond Estabelecimento.list(params), model:[EstabelecimentoInstanceCount: Estabelecimento.count()]
    }


    def show(Home homeInstance) {
        respond homeInstance
    }

    def create() {
        respond new Home(params)
    }

    @Secured(['permitAll'])
    def image() {
        def something = Estabelecimento.get( params.id )
        byte[] image = something.avatar
        response.outputStream << image
    }

    @Transactional
    def save(Home homeInstance) {
        if (homeInstance == null) {
            notFound()
            return
        }

        if (homeInstance.hasErrors()) {
            respond homeInstance.errors, view:'create'
            return
        }

        homeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'homeInstance.label', default: 'Home'), homeInstance.id])
                redirect homeInstance
            }
            '*' { respond homeInstance, [status: CREATED] }
        }
    }

    def edit(Home homeInstance) {
        respond homeInstance
    }

    @Transactional
    def update(Home homeInstance) {
        if (homeInstance == null) {
            notFound()
            return
        }

        if (homeInstance.hasErrors()) {
            respond homeInstance.errors, view:'edit'
            return
        }

        homeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Home.label', default: 'Home'), homeInstance.id])
                redirect homeInstance
            }
            '*'{ respond homeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Home homeInstance) {

        if (homeInstance == null) {
            notFound()
            return
        }

        homeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Home.label', default: 'Home'), homeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'homeInstance.label', default: 'Home'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
