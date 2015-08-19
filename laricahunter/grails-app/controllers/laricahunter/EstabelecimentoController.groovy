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
        /*if (estabelecimentoInstance == null) {
            notFound()
            return
        }

        if (estabelecimentoInstance.hasErrors()) {
            respond estabelecimentoInstance.errors, view:'create'
            return
        }*/
        def registro = Estabelecimento.get(params.id)
        registro.preco = params.preco.toLong()
        registro.cnpj = params.cnpj
        registro.razaosocial = params.razaosocial
        registro.nomefantasia = params.nomefantasia
        registro.logradouro = params.logradouro
        registro.numero = params.numero
        registro.complemento = params.complemento
        registro.bairro = params.bairro
        registro.cep = params.cep
        registro.fone1 = params.fone1
        registro.fone2 = params.fone2
        registro.fone3 = params.fone3
        registro.horaabertura = params.horaabertura
        registro.horafechamento = params.horafechamento

        registro.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estabelecimentoInstance.label', default: 'Estabelecimento'), registro.id])
                //redirect estabelecimentoInstance
                redirect action:"index", method:"POST"
            }
            '*' { respond estabelecimentoInstance, [status: CREATED] }
        }
    }


    def edit(Estabelecimento estabelecimentoInstance) {
        respond estabelecimentoInstance
    }


    @Transactional
    def update() {
       /* if (estabelecimentoInstance == null) {
            notFound()
            return
        }

        if (estabelecimentoInstance.hasErrors()) {
            respond estabelecimentoInstance.errors, view:'edit'
            return
        }*/

        def registro = Estabelecimento.get(params.id)
        registro.cnpj = params.cnpj
        registro.razaosocial = params.razaosocial
        registro.nomefantasia = params.nomefantasia
        registro.logradouro = params.logradouro
        registro.numero = params.numero
        registro.complemento = params.complemento
        registro.bairro = params.bairro
        registro.cep = params.cep
        registro.fone1 = params.fone1
        registro.fone2 = params.fone2
        registro.fone3 = params.fone3
        registro.horaabertura = params.horaabertura
        registro.horafechamento = params.horafechamento
//registro.avatar = params.avatar

        registro.save flush:true


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Estabelecimento.label', default: 'Estabelecimento'), registro.id])
                //redirect estabelecimentoInstance
                redirect action:"index", method:"POST"
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
