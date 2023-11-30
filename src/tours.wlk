import personas.*

class Tour {
	const fechaSalida
	const cantPersonasRequeridas
	const listaLugares = []
	const montoAPagarPorPersona
	const personas = #{}
	
	method agregarPersona(persona) {
		if (self.personaAdecuada(persona))
			self.incorporarPersona(persona)
		else if (!persona.puedePagarElTour(montoAPagarPorPersona))
			throw new DomainException(message="La persona no posee el presupuesto suficiente")
		else if (!persona.lugaresAdecuados(listaLugares))
			throw new DomainException(message="No todos los lugares son adecuados para la persona")
	}
	method personaAdecuada(persona) = persona.puedePagarElTour(montoAPagarPorPersona) &&
		persona.lugaresAdecuados(listaLugares)
	method incorporarPersona(persona) {
		if (!self.tourConfirmado())
			personas.add(persona)
		else
			throw new DomainException(message="El tour ya se encuentra confirmado, no es posible incorporar más gente")
	}
	method tourConfirmado() = personas.size()==cantPersonasRequeridas
	method desvincularPersona(persona) = personas.remove(persona)
	method saleEsteAnio() = fechaSalida.year() == new Date().year()
	method montoTour() = montoAPagarPorPersona * personas.size()
}
