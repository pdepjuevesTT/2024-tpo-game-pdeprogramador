import zombies.zombie.*
import pvz.*

class Saltador inherits Zombie(velocidad = 1500){
  var salto = true
  var imagen = "zombie_pv.png"
  override method image() =imagen
  override method avanzar() {
    if(reglas.hayPlantaEn(position)){
      if(salto){
        position = position.left(1)
        salto = false
        velocidad = 2000
        imagen = "zombie_pv_0.png"
      }
      else
        self.atacar(reglas.plantaEn(position))
    }
    else if(position.x() != 0)
      position = position.left(1)
    else{
      self.delete()
      reglas.perder()}
  }
}