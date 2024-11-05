import plantas.planta.PlantaConEvento
class Girasol inherits PlantaConEvento(velocidad = 10000, costo = 50){
  override method image() = "girasol.png"
  override method hacerAlgo() {game.addVisual(new Sol(position = position))}
}
class Sol{
    const property recolectable = true
    const velocidad = 7500
    const property position = game.at((1..9).anyOne(), (0..4).anyOne())
    method image() = "sol.png"
    method valor() = 25
    method serImpactado(alguien){}
    method initialize(){game.schedule(velocidad, {self.delete()})}
    method delete(){game.removeVisual(self)}
    method esPlanta() = false
}