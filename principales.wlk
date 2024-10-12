import plantas.*
object cursor{
    var property position = game.at(2, 3)
    method xPlantableRange () = self.position().x()>=1 && self.position().x()<=9
    method yPlantableRange () = self.position().y() <5
    method plantableRange () = self.xPlantableRange() && self.yPlantableRange()
    method image() = "cursor.png"
    method plantar(){
        if(self.plantableRange())
        game.addVisual(new Girasol(position = self.position()))
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

    const property position = game.at((0..4).anyOne(), (1..9).anyOne())
    method image() = "sol.png"
    method valor() = 50
}

