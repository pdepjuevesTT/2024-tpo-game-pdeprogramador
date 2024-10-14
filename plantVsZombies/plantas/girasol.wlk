import principales.gestorId

class Girasol {
  const property velocidad = 10000
  const property costo = 50
  const property recolectable = false
  const property position
  const evento = gestorId.nuevoId()

  method valor() = costo/2
  method initialize(){game.onTick(velocidad, evento , {game.addVisual(new Sol())})}

  method image() = "girasol.png"
}
class Sol{
    const property recolectable = true
    const velocidad = 7500
    const property position = game.at((1..9).anyOne(), (0..4).anyOne())
    method image() = "sol.png"
    method valor() = 50
    method serImpactado(alguien){}
    method initialize(){game.schedule(velocidad, {game.removeVisual(self)})}
}