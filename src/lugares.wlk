/** ¡Éxitos en el parcial! */
class Lugar {
	const nombre
	
	method lugarDivertido() = self.nombreConCantidadParDeLetras() && self.esDivertido()
	method nombreConCantidadParDeLetras() = nombre.size().even()
	method esDivertido()
	method nombreConMuchasLetras() = nombre.size()>10
}

class Ciudad inherits Lugar{
	const cantidadHabitantes
	const atraccionesTuristicas = []
	const decibelesPromedio
	
	override method esDivertido() = self.muchasAtraccionesTuristicas() && self.muchosHabitantes()
	method muchasAtraccionesTuristicas() = atraccionesTuristicas.size()>3
	method muchosHabitantes() = cantidadHabitantes>100000
	method lugarTranquilo() = self.lugarConPocoRuido() 
	method lugarConPocoRuido() = decibelesPromedio<20
}

class Pueblo inherits Lugar {
	const property extension
	const fundacion
	const provincia
	
	override method esDivertido() = self.puebloViejo() || self.esDelLitoral()
	method puebloViejo() = fundacion<1800
	method esDelLitoral() = #{"Entre Rios", "Entre Ríos", "Corrientes", "Misiones"}.contains(provincia)
	method lugarTranquilo() = self.esDeLaPampa()
	method esDeLaPampa() = provincia=="La Pampa"
}

class Balneario inherits Lugar {
	const metrosDePlayaPromedio
	const marPeligroso
	const tienePeatonal
	
	override method esDivertido() = self.muchaPlaya() && marPeligroso
	method muchaPlaya() = metrosDePlayaPromedio>300
	method lugarTranquilo() = !tienePeatonal
}
