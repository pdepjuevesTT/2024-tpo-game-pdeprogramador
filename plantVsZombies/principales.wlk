import plantas.lanzaGuisantes.*
import plantas.girasol.*
import pvz.juego
object cursor{
    var property position = game.at(2, 3)
    method xPlantableRange () = self.position().x()>=1 && self.position().x()<=20
    method yPlantableRange () = self.position().y() <9
    method plantableRange () = self.xPlantableRange() && self.yPlantableRange()
    method image() = "cursor.png"
    method plantar(){
        if(self.plantableRange())
        juego.crear(new Girasol(position = self.position()))
    }
    method recolectar(algo){
        if(algo.recolectable()){
            game.removeVisual(algo)
            contadorSoles.soles(algo.valor())
        }
    }
}

object contadorSoles{
    const property recolectable = false
    var soles = 200
    method position() = game.at(0, game.height()-1)
    method soles() = soles
    method soles(cantidad) {soles+=cantidad}
    method text() = ""+soles
}

class Sol{
    const property recolectable = true

    const property position
    method image() = "sol_f0.png"
    method valor() = 50
    method actualizar() {}
}

