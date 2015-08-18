import seguranca.*
class BootStrap {

    def init = { servletContext ->
        Regra admin = Regra.findByAuthority("ROLE_ADMIN")
        if (admin == null){
            admin = new Regra(authority: "ROLE_ADMIN").save(flush:true)
        }
        Usuario administrador = Usuario.findByUsername("administrador")
        if(administrador == null){
            administrador = new Usuario(username: "administrador", password: "123456", enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false).save(flush:true)
        }


        if(UsuarioRegra.findByUsuarioAndRegra(administrador,admin) == null){
            new UsuarioRegra(usuario: administrador, regra: admin).save(flush:true)
        }

    }
    def destroy = {
    }
}
