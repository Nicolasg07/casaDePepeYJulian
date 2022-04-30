import cosas.* 

object casa {
	const cosas = []
	
	method cosas() { return cosas }
	// comprar(cosa): registra que se ha comprado una cosa.
	method comprar(cosa) { cosas.add(cosa) }
	
	// cantidadDeCosasCompradas(): indica ... eso.
	method cantidadDeCosasCompradas() { cosas.size() }
	
	// tieneComida(): indica si compró algo que es comida al menos una vez.
	method tieneComida() { return cosas.any({ c => c.esComida() }) }
	
	// vieneDeEquiparse(): indica si la última cosa que se compró es un electrodoméstico, o bien vale más de 5000 pesos.
	method vieneDeEquiparse() { return cosas.last().esElectrodomestico() || cosas.last().precio() > 5000 }
	
	// esDerrochona(): indica si el importe total de las cosas compradas es de 9000 pesos o más.
	method esDerrochona() { return cosas.sum({ c => c.precio() }) >= 9000 }
	
	// compraMasCara(): retorna la cosa comprada de mayor valor.
	method compraMasCara() { return cosas.max({ c => c.precio() }) }
	
	// electrodomésticosComprados(): devuelve un objeto(lista) que contiene todas las cosas compradas que son electrodomésticos.
	method electrodomesticosComprados() { return cosas.filter({ c => c.esElectrodomestico() }) }
	
	// malaEpoca(): indica si todas las cosas compradas son comida.
	method malaEpoca() { return cosas.all({ c => c.esComida() }) }
	
	// queFaltaComprar(lista): recibe una lista de cosas y devuelve las cosas de esa lista que aún no se han comprado.
	method queFaltaComprar(lista) { return lista.asSet().difference(cosas.asSet()) }
	
	// faltaComida(): indica si se han comprado menos de 2 cosas que son comida.
	method faltaComida() { return cosas.count({ c => c.esComida() }) < 2 }
	
	// gastoEnComida(): el precio total de la comida comprada por la casa. 
	// O sea, hay que contemplar solamente las cosas que son comida.
	method gastoEnComida() { return cosas.comidaComprada().sum({ c => c.precio() }) }
	method comidaComprada() { return cosas.filter({ c => c.esComida() }) }
	
	// hayElectrodomesticosBaratos(): indica si la casa compró, al menos, un electrodoméstico de menos de 3000 pesos.
	method hayElectrodomesticosBaratos() { return self.electrodomesticosComprados().any({ c => c.precio() < 3000 }) }
	
	// preciosDeElectrodomesticos(): una colección con el precio de cada electrodoméstico que compró la casa.
	method preciosDeElectrodomesticos() { return self.electrodomesticosComprados().map({ c => c.precio() }) }

	// nivelEnAumento(): indica si el precio de la última cosa comprada es el doble del precio de la primera, o más.
	method nivelEnAumento() { return cosas.last().precio() >= cosas.firts().precio() * 2 }
	
	// primeraComidaComprada(): devuelve la primer cosa que se compró que es comida.
	method primeraComidaComprada() { return self.comidaComprada().first() } // cosas.find({ c => c.esComida() })
}
