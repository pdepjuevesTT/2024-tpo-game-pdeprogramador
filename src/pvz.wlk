import zombies.zombie.*
import zombies.bucketHead.BucketHead
import plantas.girasol.Sol
import wollok.game.*
import principales.*
import seleccionadorPlantas.seleccionadorPlantas

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
    keyboard.space().onPressDo({cursor.plantar()})
    keyboard.q().onPressDo({seleccionadorPlantas.anterior()})
    keyboard.e().onPressDo({seleccionadorPlantas.siguiente()})
  }
  method eventos() {
    game.onTick(10000, "sol", {game.addVisual(new Sol())})
    game.onCollideDo(cursor, {p=>cursor.recolectar(p)})
    game.schedule(5000, {hordas.primera()})
    game.schedule(15000, {hordas.segunda()})
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
      if((1..3).anyOne() == 1)
        game.addVisual(new BucketHead())
      else
        game.addVisual(new Zombie())
      game.schedule(1000, {self.generarZombies(cantidad-1)})
  }
}

object reglas {
  method plantable(position) = self.plantableRange(position) &&  not (self.hayPlantaEn(position))
  
  method plantableRange (position) = self.xPlantableRange(position.x()) && self.yPlantableRange(position.y())
  method xPlantableRange (x) = x>=1 && x<=9
  method yPlantableRange (y) = y<5

  method hayPlantaEn (position) = game.getObjectsIn(position).any({x=>x.esPlanta()})
  method plantaEn (position) = game.getObjectsIn(position).find({x=>x.esPlanta()})

  method perder (){
    game.addVisual(object {method image() = "game_over.png" method position() = game.at(3, 2)})
    game.stop()
  }
    
}
