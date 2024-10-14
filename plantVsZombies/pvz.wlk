import plantas.zombie.*
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
  method eventos() {
    game.onTick(10000, "sol", {game.addVisual(new Sol())})
    game.onCollideDo(cursor, {p=>cursor.recolectar(p)})
    keyboard.space().onPressDo({cursor.plantar()})
  }
}