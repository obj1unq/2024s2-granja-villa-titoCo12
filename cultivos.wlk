import wollok.game.*
import posiciones.*


class Cultivo {

	const tipo = Cultivo
	var property position = game.at(1,1)
	var property image = null
	method tipo() {return tipo}

}


class Maiz inherits Cultivo(image="corn_baby.png"){

	method regado() {
		self.image("corn_adult.png")
	}
}


class Trigo inherits Cultivo(image="wheat_0.png"){
	var property etapaEvol = 0
	
	

	method evolucionar() {
		if (etapaEvol < 3) {etapaEvol += 1}
		else {self.etapaEvol(0)}
	}

	method actualizarImagen(etapa) {
		self.image("wheat_" + etapa + ".png")
	}

	method regado() {
		self.evolucionar()
		self.actualizarImagen(etapaEvol)	
	}
}

class Tomaco inherits Cultivo(image="tomaco_baby.png"){

	method regado() {
		if (arriba.puedeSubir(position)) {self.position(arriba.sigPosicion(position))}
		else {}
	}
}
