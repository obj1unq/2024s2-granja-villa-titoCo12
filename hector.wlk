import wollok.game.*
import cultivos.*

object loca {}

object hector {
	var property position = game.center()
	const property image = "player.png"

	// method regar() {
	// 	self.validarRegar() 

	// }

	// method validarRegar() {
	// 	if (self.uniqueCollider(Maiz)) {self.error("no hay un cultivo")}
	// }

	method sembrarMaiz() {
		game.addVisual(new Maiz(position = self.position()))

	}

	method sembrarTrigo() {
		game.addVisual(new Trigo(position = self.position()))
	}

	method sembrarTomaco() {
		game.addVisual(new Tomaco(position = self.position()))
	}

	 method mover(direccion) {
	        position = direccion.sigPosicion(position)
	}
}