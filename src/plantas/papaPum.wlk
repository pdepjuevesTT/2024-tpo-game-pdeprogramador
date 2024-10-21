import plantas.planta.Planta
class PapaPum inherits Planta(velocidad = 10000, costo = 150) {
  const property danio = 100
  var image = "papaCargando.png"

  override method initialize(){game.schedule(velocidad,{self.cargarse()})}

  method cargarse(){
    image = "papaCargada.png"
    game.onCollideDo(self, {x=>x.serImpactado(self)})} //En un futuro será que explote cuando el zombie trate de comerlo
  override method image() = image
  override method delete(){
    image = "explosion.png"
    game.schedule(1000, {game.removeVisual(self)})
  }

}

