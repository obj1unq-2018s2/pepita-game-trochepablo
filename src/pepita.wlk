import ciudades.*
import wollok.game.*
import roque.*

object pepita {
	var property energia = 110
	var property ciudad = buenosAires 

	var property posicion = game.at(3,3)
	method imagen(){ 
		var imagen = "pepita1.png";
		if (self.energia() > 100) {
			imagen = "pepita2.png"
		}
		if (self.energia() < 50) {
			imagen ="pepita.png"
		}
		return imagen;
	}

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	
	method volaHacia(unaCiudad) {
		if(self.energiaParaVolar(posicion.distance(unaCiudad.posicion())) < self.energia()){
			if (ciudad != unaCiudad) {
				self.move(unaCiudad.posicion())
				ciudad = unaCiudad
			}
			else {
				game.say(self, "Ya estoy ahi!")
			}
		}
		else {
			game.say(self, "Dame de comer primero!")
		}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
		self.posicion(nuevaPosicion)
	}	
	
	method colisionHacer(objetoColision){
		self.come(objetoColision)
		game.addVisualIn(roque.alimento(), game.at(7,7))
		
		//roque.alimento(null)
	}
}
