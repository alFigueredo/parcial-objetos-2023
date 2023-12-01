import lugares.*

class Persona {
	var property preferenciaVacaciones
	var property presupuestoMaximo
	method tienePreferencia(lugar) = preferenciaVacaciones.tienePreferencia(self, lugar)
	method puedePagarElTour(montoAPagar) = montoAPagar<=presupuestoMaximo
	method lugaresAdecuados(lugares) = lugares.all({lugar=>self.tienePreferencia(lugar)})
}

class LugaresTranquilos {
	method tienePreferencia(persona, lugar) = lugar.lugarTranquilo()
}

class LugaresDivertidos {
	method tienePreferencia(persona, lugar) = lugar.lugarDivertido()
}

class LugaresRaros {
	method tienePreferencia(persona, lugar) = lugar.nombreConMuchasLetras()
}

class CombinacionCriteriosLugares {
	const criterios = #{}
	method tienePreferencia(persona, lugar) = criterios.any({criterio=>criterio.tienePreferencia(persona, lugar)})
}
