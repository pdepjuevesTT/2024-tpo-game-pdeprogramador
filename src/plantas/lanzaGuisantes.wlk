import plantas.planta.PlantaConEvento
import principales.gestorId

class Lanzaguisantes inherits PlantaConEvento(costo = 100, velocidad = 3000){
  override method image() = "lanzaguisantes.png"
  override method hacerAlgo() {game.addVisual(new Guisante(position=position))}
}



class Guisante {
  var property position
  const property velocidad = 150
  const property recolectable = false
  const evento = gestorId.nuevoId()
  method serImpactado(algo){}
  method image() = "guisante.png"
  method danio() = 1

  method delete() {
    game.removeTickEvent(evento)
    game.removeVisual(self)
  }

  method initialize(){
    game.onCollideDo(self, {x=>self.impactar(x)})
    game.onTick(velocidad, evento, {self.avanzar()})}

  method impactar(algo) {algo.serImpactado(self)}
  method avanzar() {
    if(position.x()<game.width())
      position = position.right(1)
    else
      self.delete()
    }
  method esPlanta() = false
}

