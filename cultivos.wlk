import wollok.game.*
import hector.*


class Cultivo {
	method position() {return game.at(1,1)}

}


class Maiz  {
	const property position = game.at(1,1)

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_baby.png"
	}

	method sembrarseUnoEn(posicion) {
		const maizNuevo = new Maiz(position = posicion)
		game.addVisual(maizNuevo)
	}

}


class Trigo inherits Cultivo {
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_0.png"
	}
}

class Tomaco inherits Cultivo {
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco_baby.png"
	}
}
