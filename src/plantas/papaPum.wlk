import plantas.planta.Planta
class PapaPum inherits Planta(costo = 150) {
  const property danio = 100
  var image = "papaCargando.png"

  override method initialize(){game.schedule(10000,{self.cargarse()})}

  method cargarse(){
    image = "papaCargada.png"
    game.onCollideDo(self, {x=>x.perderVida(danio) self.explotar()})}
  override method image() = image
  method explotar(){
    image = "explosion.png"
    game.schedule(1000, {game.removeVisual(self)})
  }

}

