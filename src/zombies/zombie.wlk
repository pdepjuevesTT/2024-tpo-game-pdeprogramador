import pvz.*
import principales.gestorId
class Zombie {
  var velocidad = 2000
  var property vida = 5
  var property position = game.at(game.width()-1, (0..game.height()-2).anyOne())
  var congelado = false
  //var imagen = "zombie.png"
  method image() = "zombie.png"
  const evento = gestorId.nuevoId()
  const property recolectable = false
  method esPlanta() = false
  const property danio =  1
  method serImpactado(algo) {
    self.perderVida(algo.danio())
    algo.delete()
  }
  method perderVida(valor) {
    vida-=valor
    if(vida<=0)
      self.delete()
  }
  method congelar(){
    if(!congelado){
      congelado = true
      game.removeTickEvent(evento)
      game.onTick(velocidad*2, evento, {self.avanzar()})
      //imagen = "zombieCongelado.png"
    }
  }

  method atacar(planta){planta.serAtacada(self)}

  method initialize (){game.onTick(velocidad, evento, {self.avanzar()})}

  method avanzar () {
    if(reglas.hayPlantaEn(position))
      self.atacar(reglas.plantaEn(position))
    else if(position.x()!=0)
      position = position.left(1)
    else{
      self.delete()
      reglas.perder()}

  }

  method delete() {
    game.removeTickEvent(evento)
    game.removeVisual(self)
  }

}