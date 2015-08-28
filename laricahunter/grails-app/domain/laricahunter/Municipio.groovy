package laricahunter

class Municipio {
    String nome
    
    static belongsTo = [uf: Uf]


    static mapping = {
        sort "nome"
    }
    
    static constraints = {
        nome(blank: false)
    }

    String toString() {
        return this.nome;
    }
    
    
}
