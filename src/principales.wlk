import plantas.papaPum.PapaPum
import plantas.girasol.Girasol
import plantas.lanzaGuisantes.Lanzaguisantes
import pvz.reglas
object cursor{
    var property position = game.at(2, 3)
    var recolectarPlantas = false
    method recolectarPlantas() = recolectarPlantas
    method cambiarRecoleccionPlantas() {if (recolectarPlantas) recolectarPlantas = false else recolectarPlantas = true}
    method image() = "cursor.png"
    method serImpactado(algo){}
    
    method plantarLanzaguisantes(){
        if(reglas.plantable(position) && contadorSoles.soles()>=100){
            contadorSoles.soles(-100)
            game.addVisual(new Lanzaguisantes(position = position))}}

    method plantarGirasol(){
        if(reglas.plantable(position) && contadorSoles.soles()>=50){
            contadorSoles.soles(-50)
            game.addVisual(new Girasol(position = position))}}

    method plantarPapa(){
        if(reglas.plantable(position) && contadorSoles.soles()>=150){
            contadorSoles.soles(-150)
            game.addVisual(new PapaPum(position = position))}}            


    method recolectar(algo){
        if(algo.recolectable()){
            algo.delete()
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