import principales.*
class Girasol {
    const property costo = 50
    const property recolectable = false
    const property position
    method image() = "girasol.png"
    method valor() = costo/2
    method initialize(){
        game.onTick(10000, "sol", {game.addVisual(new Sol())})
    }
}

class Lanzaguisatnes{
    const property costo = 100
    const property recolectable = false
    const property position
    method image() = "lanzaguisantes.png"
    method valor() = costo/2
}