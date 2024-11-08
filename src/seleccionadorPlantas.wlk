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
    const costo
    var seleccionada = false
    const property siguiente
    const property anterior
    const property recolectable = false
    method position() = anterior.position().right(1)
    method switch(){seleccionada = !seleccionada}
    method seleccionada () = if(seleccionada) 1 else 0
    method image() = "logo_" + self.kindName() + "_" + self.seleccionada() + ".png"
    method initialize(){game.addVisual(self)}
    method plantar(lugar){
        if(reglas.plantable(lugar) && contadorSoles.soles()>=costo){
            contadorSoles.soles(-costo)
            self.generarPlanta(lugar)
        }
    }
    method generarPlanta(lugar){}

}

object girasol inherits Plantador(siguiente = lanzaguisantes, anterior = pala, seleccionada = true, costo = 50){
    override method position() = game.at(1, game.height()-1)
    override method generarPlanta(lugar){
        game.addVisual(new Girasol(position = lugar))
    }
}

object lanzaguisantes inherits Plantador(siguiente = lanzaguisantesCongelado, anterior = girasol, costo = 100){
    override method generarPlanta(lugar){
        game.addVisual(new Lanzaguisantes(position = lugar))
    }
}

object lanzaguisantesCongelado inherits Plantador(siguiente = nuez, anterior = lanzaguisantes, costo = 150){
    override method generarPlanta(lugar){
        game.addVisual(new LanzaguisantesCongelado(position = lugar))
    }
}

object nuez inherits Plantador(siguiente = papapum, anterior = lanzaguisantesCongelado, costo = 50){
    override method generarPlanta(lugar){
        game.addVisual(new Nuez(position = lugar))
    }
}

object papapum inherits Plantador(siguiente = pala, anterior = nuez, costo = 150){
    override method generarPlanta(lugar){
        game.addVisual(new PapaPum(position = lugar))
    }
}

object pala inherits Plantador(siguiente = girasol, anterior = papapum, costo = 0){
    override method plantar(lugar){
        if(reglas.hayPlantaEn(lugar)){
            const planta = reglas.plantaEn(lugar)
            contadorSoles.soles(planta.valor())
            planta.delete()
        }
    }
}

