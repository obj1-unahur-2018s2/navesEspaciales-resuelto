class EmpresaDeServicios {
	var profesionales = []
	var property honorarioReferencia
	var clientes = #{} 
	
	method contratarProf(prof) { profesionales.add(prof) }
	method despedirProf(prof) { profesionales.remove(prof) }
	
	method profesionalesCaros() = profesionales.filter { prof => prof.honorariosPorHora() > honorarioReferencia }
	method universidadesFormadoras() = profesionales.map { prof => prof.universidad() }.asSet()
	
	
	method estaCubierta2(prov) {
		return profesionales.any { prof => prof.provinciasDondePuedeTrabajar().contains(prov) }
	}
	method estaCubierta(prov) {
		return profesionales.any { prof => prof.cubreProvincia(prov) }
	}
	
	
	method profesionalMasBarato() { 
		return profesionales.min { prof => prof.honorariosPorHora() }
	}
	method esPocoAtractivo(prof) = prof.provinciasDondePuedeTrabajar().all {
		prov => profesionales.any { 
			prof2 => prof2.provinciasDondePuedeTrabajar().contains(prov) 
			and prof2.honorariosPorHora() < prof.honorariosPorHora()
		}
	}

	method puedeSatisfacer(solicitante) = profesionales.any { prof => solicitante.puedeSerAtendide(prof) }
	
	method darServicio(solicitante) {
		if (not self.puedeSatisfacer(solicitante)) { self.error("no se puede dar servicio al solicitante indicado") }
		const profElegido = profesionales.find { prof => solicitante.puedeSerAtendide(prof) }
		profElegido.cobrar(profElegido.honorariosPorHora())
		clientes.add(solicitante)
	}	
}
