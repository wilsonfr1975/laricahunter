package seguranca

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class UsuarioRegra implements Serializable {

	private static final long serialVersionUID = 1

	Usuario usuario
	Regra regra

	UsuarioRegra(Usuario u, Regra r) {
		this()
		usuario = u
		regra = r
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof UsuarioRegra)) {
			return false
		}

		other.usuario?.id == usuario?.id && other.regra?.id == regra?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (usuario) builder.append(usuario.id)
		if (regra) builder.append(regra.id)
		builder.toHashCode()
	}

	static UsuarioRegra get(long usuarioId, long regraId) {
		criteriaFor(usuarioId, regraId).get()
	}

	static boolean exists(long usuarioId, long regraId) {
		criteriaFor(usuarioId, regraId).count()
	}

	private static DetachedCriteria criteriaFor(long usuarioId, long regraId) {
		UsuarioRegra.where {
			usuario == Usuario.load(usuarioId) &&
			regra == Regra.load(regraId)
		}
	}

	static UsuarioRegra create(Usuario usuario, Regra regra, boolean flush = false) {
		def instance = new UsuarioRegra(usuario, regra)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(Usuario u, Regra r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = UsuarioRegra.where { usuario == u && regra == r }.deleteAll()

		if (flush) { UsuarioRegra.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(Usuario u, boolean flush = false) {
		if (u == null) return

		UsuarioRegra.where { usuario == u }.deleteAll()

		if (flush) { UsuarioRegra.withSession { it.flush() } }
	}

	static void removeAll(Regra r, boolean flush = false) {
		if (r == null) return

		UsuarioRegra.where { regra == r }.deleteAll()

		if (flush) { UsuarioRegra.withSession { it.flush() } }
	}

	static constraints = {
		regra validator: { Regra r, UsuarioRegra ur ->
			if (ur.usuario == null || ur.usuario.id == null) return
			boolean existing = false
			UsuarioRegra.withNewSession {
				existing = UsuarioRegra.exists(ur.usuario.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['usuario', 'regra']
		version false
	}
}
