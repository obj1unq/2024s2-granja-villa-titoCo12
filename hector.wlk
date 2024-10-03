import wollok.game.*
import posiciones.*
import cultivos.*
import mercados.*

class Aspersor {
	var property  position = null
	method image() {return "aspersor.png"}

	method regarAlrededor() {
		const cultivosCerca = granja.cultivos().filter({planta => self.position().distance(planta.position()) < 2})
		cultivosCerca.forEach({cultivoCerca => cultivoCerca.regado()})
	}

}

object granja {
	const property cultivos = #{} 
	const property mercados = #{}

	method agregarCultivo(cultivo) {
		game.addVisual(cultivo)
		cultivos.add(cultivo)
	}

	method eliminarCultivo(cultivo) {
		cultivos.remove(cultivo)
		cultivo.serCosechado()
	} 

}

object hector {
	var property billetera = 0
	var property position = game.at(4,5)
	const property image = "player.png"
	const property inventario = []


//  REGAR     -----------------------------------------------------


	method regar() {
		const cultivosAca = granja.cultivos().filter({cultivo => cultivo.position() == position})
		cultivosAca.forEach({cultivo => cultivo.regado()})
	}


//  SEMBRAR     -----------------------------------------------------


	method sembrarMaiz() {
		self.validarColocar()
		const nuevoMaiz = new Maiz(position = self.position())
		granja.agregarCultivo(nuevoMaiz)
	}

	method sembrarTrigo() {
		self.validarColocar()
		const nuevoTrigo = new Trigo(position = self.position())
		granja.agregarCultivo(nuevoTrigo)
	}

	method sembrarTomaco() {
		self.validarColocar()
		const nuevoTomaco = new Tomaco(position = self.position())
		granja.agregarCultivo(nuevoTomaco)
	}

	method validarColocar() {
		if (not(game.colliders(self).isEmpty())) {self.error("no puedo colocar aca")}
	}


//  MOVER     -------------------------------------------------------


	 method mover(direccion) {
	    position = direccion.sigPosicion(position)
	}


// COSECHAR ---------------------------------------------------------
 
	// Me tome la libertad de que, al cosechar, hector guarde los valores de lo cosechado en una lista
	// ya que cada tipo de cultivo tiene un precio diferente, por lo que se distingue :
	// 150 = maíz
	// 100 = trigo etapa 2
	// 200 = trigo etapa 3
	// 80  = tomaco

	method cosechar() {
		const cultivosCosechablesAca = granja.cultivos().filter({cultivo => self.estaYCosechable(cultivo)})
		cultivosCosechablesAca.forEach({cultivo => self.cosecharYSacar(cultivo)})
	}

	method estaYCosechable(cultivo) {
		return (cultivo.position() == position) and (cultivo.puedeSerCosechado())
	}

	method cosecharYSacar(cultivo) {
		inventario.add(cultivo.valor())
		granja.eliminarCultivo(cultivo)
	}


// VENDER TODO -------------------------------------------------------


	method venderEnMercado() {
		const mercadosAca = granja.mercados().filter({mercado => mercado.position() == position})
		mercadosAca.forEach({mercadoAca => self.venderleA(mercadoAca)})
	}

	method venderleA(mercado) {
		mercado.comprar(inventario)
	}

	method recibirPago(precio) {
		billetera += precio
	}

	method soltarLoVendido(precio) {
		inventario.remove(precio)
	}

// COLOCAR ASPERSOR --------------------------------------------------


	method colocarAspersor() {
		self.validarColocar()
		const aspersorNuevo = new Aspersor(position = self.position())
		game.addVisual(aspersorNuevo)
		game.onTick(1000, "aspersorNuevo".identity(),{aspersorNuevo.regarAlrededor()})
	}

}
