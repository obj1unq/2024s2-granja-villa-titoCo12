import wollok.game.*



class Cultivo {
	const property position = game.at(1,1)
	const property tipo = Cultivo
	method image() {return null}

}


class Maiz inherits Cultivo(){

	override method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_baby.png"
	}

}


class Trigo inherits Cultivo(){
	const property etapaEvol = 0

	override method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_0.png"
	}
	
}

class Tomaco inherits Cultivo(){

	override method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco_baby.png"
	}

}
