import universidades.*

class Profesional {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method cubreProvincia(prov) { return self.provinciasDondePuedeTrabajar().contains(prov) }
	
	method provinciasDondePuedeTrabajar()
}

class ProfesionalAsociado inherits Profesional {
	override method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }

	method cobrar(importe) { asociacionProfesionalesLitoral.recaudar(importe) }
}


class ProfesionalVinculado inherits Profesional {
	method honorariosPorHora() { return universidad.honorarioRecomendado() }
	override method provinciasDondePuedeTrabajar() { return #{universidad.provincia()} }
	
	method cobrar(importe) { universidad.recibirDonacion(importe / 2) }

}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre inherits Profesional {
	var honorarios
	var provincias
	var totalRecibido = 0
	
	method honorariosPorHora(cuanto) { honorarios = cuanto }
	method provinciasDondePuedeTrabajar(provs) { provincias = provs }
	method honorariosPorHora() { return honorarios }
	override method provinciasDondePuedeTrabajar() { return provincias }
	
	method cobrar(importe) { totalRecibido += importe }
	
	method pasarDinero(destinatario, importe) {
		totalRecibido -= importe
		destinatario.cobrar(importe)
	}
}
