class Universidad {
	var property provincia	
	var property honorarioRecomendado
	var recibidoPorDonaciones = 0
	
	method recibirDonacion(importe) { recibidoPorDonaciones += importe }
}

// esta clase es **equivalente** a Universidad
// se deja para que se entienda el efecto de los var property 
class UniversidadLarga {
	var provincia
	var honorarioRecomendado
	var recibidoPorDonaciones = 0
	
	method provincia() { return provincia }
	method provincia(prov) { provincia = prov }
	
	method honorarioRecomendado() { return honorarioRecomendado }
	method honorarioRecomendado(hon) { honorarioRecomendado = hon }	

	method recibirDonacion(importe) { recibidoPorDonaciones += importe }
}


object asociacionProfesionalesLitoral {
	var recaudado = 0
	
	method recaudar(importe) { recaudado += importe }
}