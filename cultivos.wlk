import wollok.game.*
import posiciones.*


class Cultivo {

	var property position = game.at(1,1)
	var property image = null
	
	method tipo() {return "Cultivo"}

	method serCosechado() {
		game.removeVisual(self)
	}

}


class Maiz inherits Cultivo(image="corn_baby.png"){

	method valor() {return 150}

	method puedeSerCosechado() {
		return (self.image() == "corn_adult.png")
	}

	method regado() {
		self.image("corn_adult.png")
	}

}


class Trigo inherits Cultivo(image="wheat_0.png"){
	var property etapaEvol = 0
	
	method valor() {return (etapaEvol - 1) * 100}

	method puedeSerCosechado() {
		return (etapaEvol >= 2)
	}

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

	method valor() {return 80}

	method nombre() {return "Tomaco"}

	method puedeSerCosechado() {
		return (true)
	}

	method regado() {
		if (arriba.puedeSubir(position)) {self.position(arriba.sigPosicion(position))}
		else {self.position(game.at(position.x(),0))}
	}
}
