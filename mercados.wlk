import wollok.game.*


object mercadoFelipe {
    var property position = game.at(2,8)
    var property almacen = []
    var property cantMonedas = 500


    method image() {return "market.png"}
    method tipo() {return "Mercado"}
    method regado() {}
}


object mercadoRichardElUno {
    var property position = game.at(7,8) 
    var property almacen = []
    var property cantMonedas = 1000

    method image() {return "market.png"}
    method tipo() {return "Mercado"}
    method regado() {}



} 