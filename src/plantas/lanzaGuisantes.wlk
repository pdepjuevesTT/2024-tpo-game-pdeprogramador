import plantas.planta.Planta
import principales.gestorId

class Lanzaguisantes inherits Planta(costo = 100, velocidad = 3000){
  override method image() = "lanzaguisantes.png"
  override method hacerAlgo() {game.addVisual(new Guisante(position=position))}
    override method delete() {
    game.removeTickEvent(evento)
    super()}
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
    game.onCollideDo(self, {x=>x.serImpactado(self)})
    game.onTick(velocidad, evento, {self.avanzar()})}
  method avanzar() {
    if(position.x()<game.width())
      position = position.right(1)
    else
      self.delete()
    }
}

