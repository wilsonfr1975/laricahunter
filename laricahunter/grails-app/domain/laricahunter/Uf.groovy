package laricahunter

class Uf {
    String sigla
    String nome

    static constraints = {
        sigla(blank: false)
        nome(blank: false)

    }
    String toString() {
        return this.nome;
    }
}
