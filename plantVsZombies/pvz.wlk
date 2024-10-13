import plantas.zombie.*
import plantas.papaPum.*
import plantas.lanzaGuisantes.*
import plantas.girasol.*
import wollok.game.*
import principales.*

object juego {
  
  method iniciar() {
    game.cellSize(60)
    game.title("PVZ")
    game.height(10)
    game.width(24)
    game.boardGround("fondo.png")
    game.addVisualCharacter(cursor)
    game.addVisual(contadorSoles)
    game.onTick(10000, "sol", {game.addVisual(new Sol(position = game.at((0..4).anyOne(), (1..9).anyOne())))})
    game.onCollideDo(cursor, {p=>cursor.recolectar(p)})

    keyboard.space().onPressDo({cursor.plantar()})
    // self.crear(new Girasol(x=1, y = 1))
    self.crear(new LanzaGuisantes(position = game.at(1, 3)))
    self.crear(new PapaPum(position = game.at(3, 1)))
    self.crear(new Zombie(position = game.at(16, 3)))
    
    game.start()
  }

  method crear (obj) {
    game.addVisual(obj)
    obj.actualizar()
  }
}