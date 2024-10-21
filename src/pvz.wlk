import zombies.zombie.*
import plantas.girasol.Sol
import wollok.game.*
import principales.*

object juego {
  method configuracion() {
    game.cellSize(100)
    game.title("PVZ")
    game.height(6)
    game.width(11)
    }
  method visuales(){
    game.boardGround("fondo.png")
    game.addVisualCharacter(cursor)
    game.addVisual(contadorSoles)
    }
  method imputs(){
    keyboard.space().onPressDo({cursor.plantarLanzaguisantes()})
    keyboard.g().onPressDo({cursor.plantarGirasol()})
    keyboard.p().onPressDo({cursor.plantarPapa()})
    keyboard.r().onPressDo({cursor.cambiarRecoleccionPlantas()})
  }
  method eventos() {
    game.onTick(10000, "sol", {game.addVisual(new Sol())})
    game.onCollideDo(cursor, {p=>cursor.recolectar(p)})
    game.schedule(5000, {hordas.primera()})
    //game.schedule(15000, {hordas.segunda()})
  }

}

object hordas{
  method primera(){
    self.generarZombies(2)
  }
  method segunda(){
    self.generarZombies(4)
  }
  method generarZombies(cantidad){
    if(cantidad>0)
      game.addVisual(new Zombie())
      game.schedule(1000, {self.generarZombies(cantidad-1)})
  }
}

object reglas {
  method plantable(position) = self.plantableRange(position) &&  not (self.hayPlantas(position))
  
  method plantableRange (position) = self.xPlantableRange(position.x()) && self.yPlantableRange(position.y())
  method xPlantableRange (x) = x>=1 && x<=9
  method yPlantableRange (y) = y<5

  method hayPlantas (position) = game.getObjectsIn(position).any({x=>x.className()=="Planta"})
    
}
