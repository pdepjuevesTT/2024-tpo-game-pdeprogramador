import pvz.*
class LanzaGuisantes {
  var property position
  const property velocidad = 3000

  const property costo = 100
  const property recolectable = false
  method valor() = costo/2

  method LanzaGuisantes() {
    self.actualizar()
  }

  method image() = "guisante_f1.png"

  method actualizar() {
    game.onTick(velocidad, "disparar", { self.disparar() })
  }
  method disparar(){
    game.say(self, "pichun!")
    // const guisante = new Guisante(x=x,y=y)
    juego.crear(new Guisante(position = self.position()))
    // game.addVisual(guisante)
    // guisante.avanzar()
    
  }
}

class Guisante {
  var property position
  const property velocidad = 150


  method image() = "guisante_proyectil.png"

  method finalizar() {
    game.removeVisual(self)
  }

  method actualizar () {
    game.onTick(velocidad, "mover guisante", { position = position.right(1) })
    self.colision()
  }

  method colision () {
    game.onCollideDo(self, { zombie =>
      zombie.colision()
      self.finalizar()
    }) 
  }
}

