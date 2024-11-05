import plantas.lanzagGuisanteCongelado.LanzaguisantesCongelado
import plantas.papaPum.PapaPum
import plantas.girasol.Girasol
import plantas.lanzaGuisantes.Lanzaguisantes
import plantas.nuez.Nuez
import principales.contadorSoles
import pvz.reglas


object seleccionadorPlantas{
    var planta = girasol
    method plantar(lugar) {planta.plantar(lugar)}
    method cambiar(nuevaPLanta) {
    planta.switch()
    planta = nuevaPLanta
    planta.switch()}
    method siguiente() {self.cambiar(planta.siguiente())}
    method anterior()  {self.cambiar(planta.anterior())}
}

class Plantador{
    var seleccionada = false
    const property siguiente
    const property anterior
    const property recolectable = false
    method position() = anterior.position().right(1)
    method switch(){seleccionada = !seleccionada}
    method seleccionada () = if(seleccionada) 1 else 0
    method image() = "logo_" + self.kindName() + "_" + self.seleccionada() + ".png"
    method initialize(){game.addVisual(self)}

}

object girasol inherits Plantador(siguiente = lanzaguisantes, anterior = pala, seleccionada = true){
    override method position() = game.at(1, game.height()-1)
    method plantar(lugar){
        if(reglas.plantable(lugar) && contadorSoles.soles()>=50){
            contadorSoles.soles(-50)
            game.addVisual(new Girasol(position = lugar))
        }
    }
}

object lanzaguisantes inherits Plantador(siguiente = lanzaguisantesCongelado, anterior = girasol){
        method plantar(lugar){
        if(reglas.plantable(lugar) && contadorSoles.soles()>=100){
            contadorSoles.soles(-100)
            game.addVisual(new Lanzaguisantes(position = lugar))
        }
    }
}

object lanzaguisantesCongelado inherits Plantador(siguiente = nuez, anterior = lanzaguisantes){
        method plantar(lugar){
        if(reglas.plantable(lugar) && contadorSoles.soles()>=150){
            contadorSoles.soles(-150)
            game.addVisual(new LanzaguisantesCongelado(position = lugar))
        }
    }
}

object nuez inherits Plantador(siguiente = papapum, anterior = lanzaguisantesCongelado){
        method plantar(lugar){
        if(reglas.plantable(lugar) && contadorSoles.soles()>=50){
            contadorSoles.soles(-50)
            game.addVisual(new Nuez(position = lugar))
        }
    }
}

object papapum inherits Plantador(siguiente = pala, anterior = nuez){
        method plantar(lugar){
        if(reglas.plantable(lugar) && contadorSoles.soles()>=150){
            contadorSoles.soles(-150)
            game.addVisual(new PapaPum(position = lugar))
        }
    }
}

object pala inherits Plantador(siguiente = girasol, anterior = papapum){
        method plantar(lugar){
        if(reglas.hayPlantaEn(lugar)){
            const planta = reglas.plantaEn(lugar)
            contadorSoles.soles(planta.valor())
            planta.delete()
        }
    }
}

