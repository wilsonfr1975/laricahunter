package laricahunter

class Categoria {
    String nome
    static constraints = {
        nome(blank: false)
    }

    static mapping = {
        sort "nome"
    }
    
    String toString() {
        return this.nome;
    }
}