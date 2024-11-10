import plantas.planta.PlantaConEvento
import plantas.lanzaGuisantes.Guisante

class LanzaguisantesCongelado inherits PlantaConEvento(costo = 150, velocidad = 2500){
  override method image() = "lanzagGuisanteCongelado.png"
  override method hacerAlgo() {game.addVisual(new GuisanteCongelado(position = position))}
}

class GuisanteCongelado inherits Guisante{
  override method image() = "guisanteCongelado.png"
  override method impactar(algo){
    algo.congelar()
    super(algo)
  }
}