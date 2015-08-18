package laricahunter



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured


@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class EstabelecimentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]
    @Secured('permitAll')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Estabelecimento.list(params), model:[estabelecimentoInstanceCount: Estabelecimento.count()]
    }

    @Secured('permitAll')
    def list(){
        def estabelecimentoList = Estabelecimento.createCriteria().list(params) {
            if ( params.query ) {
                ilike("nomefantasia", "%${params.query}%")
            }else{
                order('nomefantasia', 'asc')
            }
        }
        //println estabelecimentoList

       // respond estabelecimentoList , model:[estabelecimentoInstanceList: estabelecimentoList, estabelecimentoTotal: estabelecimentoList.totalCount]
       // redirect action:"home/index", model:[estabelecimentoList: estabelecimentoList]
        render (view:"/home/index", model:[estabelecimentoList: estabelecimentoList])
    }
    @Secured(['permitAll'])
    def image() {
        def something = Estabelecimento.get( params.id )
        byte[] image = something.avatar
        response.outputStream << image
    }
    @Secured(['permitAll'])
    def show(Estabelecimento estabelecimentoInstance) {
        respond estabelecimentoInstance
    }

    def create() {
        respond new Estabelecimento(params)
    }


    @Transactional
    def save(Estabelecimento estabelecimentoInstance) {
        if (estabelecimentoInstance == null) {
            notFound()
            return
        }

        if (estabelecimentoInstance.hasErrors()) {
            respond estabelecimentoInstance.errors, view:'create'
            return
        }

        estabelecimentoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estabelecimentoInstance.label', default: 'Estabelecimento'), estabelecimentoInstance.id])
                redirect estabelecimentoInstance
            }
            '*' { respond estabelecimentoInstance, [status: CREATED] }
        }
    }


    def edit(Estabelecimento estabelecimentoInstance) {
        respond estabelecimentoInstance
    }


    @Transactional
    def update(Estabelecimento estabelecimentoInstance) {
        if (estabelecimentoInstance == null) {
            notFound()
            return
        }

        if (estabelecimentoInstance.hasErrors()) {
            respond estabelecimentoInstance.errors, view:'edit'
            return
        }

        estabelecimentoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Estabelecimento.label', default: 'Estabelecimento'), estabelecimentoInstance.id])
                redirect estabelecimentoInstance
            }
            '*'{ respond estabelecimentoInstance, [status: OK] }
        }
    }


    @Transactional
    def delete(Estabelecimento estabelecimentoInstance) {

        if (estabelecimentoInstance == null) {
            notFound()
            return
        }

        estabelecimentoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Estabelecimento.label', default: 'Estabelecimento'), estabelecimentoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estabelecimentoInstance.label', default: 'Estabelecimento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
