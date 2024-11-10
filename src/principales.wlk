import plantas.papaPum.PapaPum
import plantas.girasol.Girasol
import plantas.lanzaGuisantes.Lanzaguisantes
import pvz.reglas
import seleccionadorPlantas.seleccionadorPlantas
object cursor{
    var property position = game.at(2, 3)
    method image() = "cursor.png"
    method serImpactado(algo){}
    method esPlanta() = false
    method plantar() {seleccionadorPlantas.plantar(position)}

    method recolectar(algo){
        if(algo.recolectable()){
            algo.delete()
            contadorSoles.soles(algo.valor())
        }
    }
    method congelar(){}
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