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
       
       def listaEstabelecimento = null
       def cardapioList = null


       if (params.city != null){
            Municipio municipio = Municipio.find { nome == params.city }
            listaEstabelecimento =  Estabelecimento.findAllByMunicipio(municipio)            

            def listaPratoTipico  = PratoTipico.findAllByMunicipio(municipio)  

            def idsProdutos  = [] 
            listaPratoTipico.each {
                idsProdutos.push("${it.produto.id}" as long)            
            }   

            cardapioList = Cardapio.createCriteria().list() {            
                if(idsProdutos){
                    produto {
                        'in'("id", idsProdutos)    
                    }                    
                }                                           
                order('descricao', 'desc')
            }

       } else{
           //Tras todos
           
            listaEstabelecimento =  Estabelecimento.list() 
            
       }

       render (view:"/home/index", model:[estabelecimentoList: listaEstabelecimento, cardapioList: cardapioList])
        
    }

    @Secured('permitAll')
    def list(){
               
        def cardapios = Cardapio.createCriteria().list(params) {
            if ( params.search ) {
                ilike("descricao", "%${params.search}%")                              
            }
        }        
        
        def ids  = [] 
        cardapios.each {
            ids.push("${it.estabelecimento.id}" as long)            
        }


        def estabelecimentoList = Estabelecimento.createCriteria().list(params) {            
            if(ids){
                'in'("id", ids)    
            }
            else if ( params.search ) {
                ilike("nomefantasia", "%${params.search}%")
            }
            
            if ( params.city ) {
                municipio {
                    ilike("nome", "%${params.city}%")
                }
            } 
                       
            order('nomefantasia', 'desc')
        }
        
        render (view:"/home/index", model:[estabelecimentoList: estabelecimentoList])
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