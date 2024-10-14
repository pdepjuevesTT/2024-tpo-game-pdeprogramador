import principales.gestorId
class Lanzaguisantes {
  const property position
  const property velocidad = 3000
  const evento = gestorId.nuevoId()
  const property costo = 100
  const property recolectable = false
  method valor() = costo/2
  method serImpactado(){}
  method image() = "lanzaguisantes.png"
   method initialize(){
    game.onTick(velocidad, evento, {game.addVisual(new Guisante(position=position))})}
    method delete(){
        game.removeTickEvent(evento)
        game.removeVisual(self)
    }
}

class Guisante {
  var property position
  const property velocidad = 150
  const property recolectable = false
  const evento = gestorId.nuevoId()
  method serImpactado(algo){}
  method image() = "guisante.png"

  method delete() {
    game.removeTickEvent(evento)
    game.removeVisual(self)
  }

  method initialize(){
    game.onTick(velocidad, evento, {self.avanzar()})}
  method avanzar() {
    if(position.x()<game.width())
      position = position.right(1)
    else
      self.delete()
    }
}

