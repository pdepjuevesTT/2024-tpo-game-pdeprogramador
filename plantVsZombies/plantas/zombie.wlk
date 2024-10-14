class Zombie {
 // var property x
 // var property y
  var property vida = 5

  var property position
    
  method image() = "zombie_bh_f0.png"

  method colision() {
    game.say(self, "auch!")
    vida -= 1
    self.finalizar(vida <= 0)
  }

  method actualizar () {
    
  }
  
  method avanzar () {
    
  }

  method finalizar(flag) {
    if (flag) {
        game.removeVisual(self)
    }
  }

}

