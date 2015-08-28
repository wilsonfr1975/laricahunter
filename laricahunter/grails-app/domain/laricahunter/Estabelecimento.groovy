package laricahunter

class Estabelecimento {
    String cnpj
    String razaosocial
    String nomefantasia
    String logradouro
    String numero
    String complemento
    String bairro
    String cep
    String fone1
    String fone2
    String fone3
    Date horaabertura
    Date horafechamento
    byte[] avatar

    static belongsTo = [municipio: Municipio]
    //static belongsTo = [user: municipio]

    static mapping = {
        sort "nomefantasia"
    }

    static constraints = {
        cnpj(blank: false)
        razaosocial(blank: false)
        nomefantasia(blank: false)
        logradouro(blank: false)
        numero(blank: false)
        complemento(blank: false)
        bairro(blank: false)
        cep(blank: false)
        fone1(blank: false)
        fone2(blank: false)
        fone3(blank: false)
        horaabertura(blank: false)
        horafechamento(blank: false)
        avatar(size:0..131072, nulable: true)
    }

    String toString() {
        return this.nomefantasia;
    }
}

