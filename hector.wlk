import wollok.game.*
import cultivos.*

object hector {
	var property position = game.center()
	const property image = "player.png"

	method sembrar(cultivo) {
		cultivo.sembrarseUnoEn(self.position())
	}
}