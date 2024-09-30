import wollok.game.*
import cultivos.*

object loca {}

object hector {
	var property position = game.center()
	const property image = "player.png"


//  REGAR     -----------------------------------------------------

	method regar() {
		const colisiones = game.colliders(self)

		self.validarRegar(colisiones) 
		colisiones.forEach({colision => colision.regado()})
	}

	method validarRegar(colisiones) {
		if (colisiones.isEmpty()) {self.error("no hay un cultivo para regar")}
	}

//  SEMBRAR     -----------------------------------------------------


	method sembrarMaiz() {
		game.addVisual(new Maiz(position = self.position()))

	}

	method sembrarTrigo() {
		game.addVisual(new Trigo(position = self.position()))
	}

	method sembrarTomaco() {
		game.addVisual(new Tomaco(position = self.position()))
	}

//  MOVER     -----------------------------------------------------


	 method mover(direccion) {
		self.validarMover(direccion)
	    position = direccion.sigPosicion(position)
	}

	method validarMover(direccion) {
		
	}
}