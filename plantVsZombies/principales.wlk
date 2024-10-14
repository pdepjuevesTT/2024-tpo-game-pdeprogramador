import plantas.girasol.Girasol
//import plantas.lanzaguisantes.Lanzaguisantes No se porque no me deja immportar el lanzaguisantes, ayuda!!
object cursor{
    var property position = game.at(2, 3)
    method xPlantableRange () = self.position().x()>=1 && self.position().x()<=9
    method yPlantableRange () = self.position().y() <5
    method plantableRange () = self.xPlantableRange() && self.yPlantableRange()
    method image() = "cursor.png"
    method serImpactado(algo){}
    method plantar(){
        if(self.plantableRange())
            game.addVisual(new Girasol(position = position))}
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

object gestorId{
    var id = 0
    method nuevoId(){
        id+=1
        return id
    }
}