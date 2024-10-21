import principales.gestorId
class Zombie {
  var property vida = 5
  var property position = game.at(game.width()-1, (0..game.height()-2).anyOne())
  method image() = "zombie.png"
  const evento = gestorId.nuevoId()
  const property recolectable = false

  method serImpactado(algo) {
    vida-=algo.danio()
    algo.delete()
    if(vida<=0)
      self.delete()
  }

  method initialize (){game.onTick(1500, evento, {self.avanzar()})}

  method avanzar () {
    if(position.x()!=0)    
      position = position.left(1)
    else
      self.delete() //Debería terminar el juego

  }

  method delete() {
    game.removeTickEvent(evento)
    game.removeVisual(self)
  }

}

