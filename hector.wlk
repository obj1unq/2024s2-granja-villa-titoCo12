import wollok.game.*
import posiciones.*
import cultivos.*
import mercados.*

class Aspersor {
	var property  position = null
	method image() {return "aspersor.png"}
	method tipo() {return "Aspersor"}

	method regarAlrededor(plantas) {
		const plantasCerca = plantas.filter({planta => self.position().distance(planta.position()) < 2})
		plantasCerca.forEach({plantaCerca => plantaCerca.regado()})
	}

	method regado() {}

}

object hector {
	const property granja = #{} 
	var billetera = 0
	var property position = game.at(4,5)
	const property image = "player.png"
	const property tipo = self
	const property plantasCosechadas = []

	method billetera() {return billetera}

//  REGAR     -----------------------------------------------------

	method regar() {
		self.validarHayCultivo()
		game.uniqueCollider(self).regado()
	}

	method validarHayCultivo() {
		const colisiones = game.colliders(self)
		if (colisiones.isEmpty()) {self.error("no hay un cultivo aca")}
		else if (game.uniqueCollider(self).tipo() != "Cultivo") {self.error("no hay un cultivo aca")}
	}

//  SEMBRAR     -----------------------------------------------------


	method sembrarMaiz() {
		self.validarSembrar()
		const nuevoMaiz = new Maiz(position = self.position())
		game.addVisual(nuevoMaiz)
		granja.add(nuevoMaiz)
	}

	method sembrarTrigo() {
		self.validarSembrar()
		const nuevoTrigo = new Trigo(position = self.position())
		game.addVisual(nuevoTrigo)
		granja.add(nuevoTrigo)
	}

	method sembrarTomaco() {
		self.validarSembrar()
		const nuevoTomaco = new Tomaco(position = self.position())
		game.addVisual(nuevoTomaco)
		granja.add(nuevoTomaco)
	}

	method validarSembrar() {
		const colisiones = game.colliders(self)
		if (not(colisiones.isEmpty())) {self.error("no puedo sembrar aca")}
	}

//  MOVER     -------------------------------------------------------


	 method mover(direccion) {
		self.validarMover(direccion)
	    position = direccion.sigPosicion(position)
	}

	method validarMover(direccion) {
		
	}

// COSECHAR ---------------------------------------------------------


	// una alternativa que pense era que cada cultivo sepa su nombre (un string),
	// yo agrego eso a la lista y que despues el mercado sepa a cuanto equivale cada string?   
	method cosechar() {
		self.validarHayCultivo()
		self.validarPuedeSerCosechado()
		plantasCosechadas.add(game.uniqueCollider(self).valor())
		granja.remove(game.uniqueCollider(self))
		game.uniqueCollider(self).serCosechado()
	}

	method validarPuedeSerCosechado() {
		if (not(game.uniqueCollider(self).puedeSerCosechado())) 
			{self.error("no está listo para ser cosechado")
		}
	}

// VENDER TODO -------------------------------------------------------

	method venderTodo() {
		self.validarVender()


		billetera += plantasCosechadas.sum()
		plantasCosechadas.clear()
	}

	method validarVender() {
		const colisiones = game.colliders(self)
		if (colisiones.isEmpty()) {self.error("no estoy en mercado")}
		else if (game.uniqueCollider(self).tipo() != "Mercado") {self.error("no estoy en mercado")}
	}

// COLOCAR ASPERSOR --------------------------------------------------

	method colocarAspersor() {
		self.validarSembrar()
		const aspersorNuevo = new Aspersor(position = self.position())
		game.addVisual(aspersorNuevo)
		game.onTick(1000, "aspersorNuevo".identity(),{aspersorNuevo.regarAlrededor(granja)})

	}

	method regado() {}

}
