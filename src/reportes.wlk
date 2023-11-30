import tours.*

class Reporte {
	const tours = #{}
	
	method toursPendientesDeConfirmacion() = tours.filter({tour=>!tour.tourConfirmado()})
	
	method montoTotalToursEsteAnio() = self.montoTotal(self.toursQueSalenEsteAnio())
	
	method toursQueSalenEsteAnio() = tours.filter({tour=>tour.saleEsteAnio()})
	
	method montoTotal(coleccionTours) = coleccionTours.sum({tour=>tour.montoTour()}) 
}
