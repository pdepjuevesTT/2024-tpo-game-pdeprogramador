import principales.*
class Planta{
  var vida = 3
  const property position
  const property velocidad
  const property costo
  method recolectable() = false
  method valor() = costo/2
  method serImpactado(algo){}
  method congelar(){}
  method image()
  method delete(){
    game.removeVisual(self)
    }
  method esPlanta() = true
  method serAtacada(zombie){
    vida-=zombie.danio()
    if(vida<=0)
      self.delete()
  }
}

class PlantaConEvento inherits Planta{
  const evento = gestorId.nuevoId()
  method hacerAlgo()
  method initialize(){
    game.onTick(velocidad, evento, {self.hacerAlgo()})
  }
  override method delete(){
    game.removeTickEvent(evento)
    super()
  }
}