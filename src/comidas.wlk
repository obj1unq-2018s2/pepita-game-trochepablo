import roque.*
import wollok.game.*

object manzana {
	const property imagen = "manzana.png"
	method energia() = 80
	method colisionHacer(objetoColision){
		if (roque.alimento() != null) {
			game.removeVisual(objetoColision)
			game.addVisualIn(roque.alimento(), game.at(5,5))
			roque.alimento(objetoColision)
		}
		else
		{
			roque.alimento(objetoColision)
			game.removeVisual(objetoColision)
		}
	}
}

object alpiste {
	const property imagen = "alpiste.png"
	method energia() = 5
	method colisionHacer(objetoColision){
		if (roque.alimento() != null) {
			game.removeVisual(objetoColision)
			game.addVisualIn(roque.alimento(), game.at(5,1))
			roque.alimento(objetoColision)
		}
		else
		{
			roque.alimento(objetoColision)
			game.removeVisual(objetoColision)
		}
	}
}


