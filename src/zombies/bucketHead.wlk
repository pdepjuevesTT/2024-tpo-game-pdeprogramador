import zombies.zombie.Zombie
import principales.gestorId

class BucketHead inherits Zombie(vida = 8){
  var property imagen = "zombie_bh_f0.png"
  var property tieneBalde = true
  override method image() = imagen

  override method serImpactado(algo) {
    vida-=algo.danio()
    algo.delete()
    if(tieneBalde && vida<=5)
      self.perderBalde()
    if(vida<=0)
      self.delete()
  }
  method perderBalde(){
    imagen = "zombie.png"
    tieneBalde = false
  }
}