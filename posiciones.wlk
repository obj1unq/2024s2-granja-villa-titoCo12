import wollok.game.*

object arriba {

    method dirString() {return "-arriba"}

    method sigPosicion(position) {
        return position.up(1)
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

