import wollok.game.*
import cultivos.*

object loca {}

object hector {
	var property position = game.center()
	const property image = "player.png"
	const property cultivos = #{Maiz,Trigo,Tomaco}


	method regar() {
		const colisiones = game.colliders(self)

		self.validarRegar(colisiones) 
		colisiones.head().regado()
	}

	method validarRegar(colisiones) {
		if (colisiones.isEmpty()) {self.error("no hay un cultivo para regar")}
	}

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