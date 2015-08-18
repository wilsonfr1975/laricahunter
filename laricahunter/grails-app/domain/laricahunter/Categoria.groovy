package laricahunter

class Categoria {
    String nome
    static constraints = {
        nome(blank: false)
    }

    String toString() {
        return this.nome;
    }
}