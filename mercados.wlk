import wollok.game.*
import hector.*

// los hago clases ya que mercados pueden haber varios y de paso en los tests los puedo generar con 
// distintos presupuestos para testear
// (dejo dos comentados en el program de game por si quieren ver que en el visual del juego tambien andan)

object managerMercados {
    
    method agregarMercadoEnConDinero(posicion,dinero) {
        self.validarMercado(posicion)
		const mercado = new Mercado(position=posicion,presupuesto=dinero)
		game.addVisual(mercado)
        granja.mercados().add(mercado)
	}

    method validarMercado(posicion) {
        if (not(game.getObjectsIn(posicion).isEmpty())) {self.error("no podes colocar un mercado aca")}
    }

}

class Mercado {

    var property position = null
    var property almacen = []
    var property presupuesto = 0
    method image() {return "market.png"}

    method comprar(inventario) {
        inventario.forEach({precio => self.comprarSiPuede(precio)})
    }

    method comprarSiPuede(precio) {
        self.validarCompra(precio)
        self.pagarleAHectorYTomar(precio)
    }

    method validarCompra(precio) {
        if (precio > presupuesto) {self.error("no tenemos suficientes monedas")}
    }

    method pagarleAHectorYTomar(precio) {
        presupuesto -= precio
        hector.recibirPago(precio)
        hector.soltarLoVendido(precio)
        almacen.add(precio)
    }
}
