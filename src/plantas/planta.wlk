import principales.*
class Planta{
  const property position
  const property velocidad
  const evento = gestorId.nuevoId()
  const property costo
  method recolectable() = cursor.recolectarPlantas()
  method valor() = costo/2
  method serImpactado(algo){}
  method image()
  method initialize(){
    game.onTick(velocidad, evento, {self.hacerAlgo()})}
  method hacerAlgo() {}
  method delete(){
    game.removeVisual(self)
    }
  override method className() = "Planta"
}