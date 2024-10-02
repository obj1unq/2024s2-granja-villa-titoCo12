import wollok.game.*

object arriba {

    method dirString() {return "-arriba"}

    method sigPosicion(position) {
        return position.up(1)
    }

    method puedeSubir(posicion) {
        return (self.sigPosicion(posicion).y() < game.height() and self.sigCeldaEstaVacia(posicion))
    }

    method sigCeldaEstaVacia(posicion) {
        return (game.getObjectsIn(self.sigPosicion(posicion)).isEmpty())
    }

}

object izquierda {
   
    method dirString() {return "-izquierda"}
   
    method sigPosicion(position) {
        return position.left(1)
    }

}

object abajo {

    method dirString() {return "-abajo"}

    method sigPosicion(position) {
        return position.down(1)
    }

}

object derecha {
    
    method dirString() {return "-derecha"}

    method sigPosicion(position) {
        return position.right(1)
    }
    
}

