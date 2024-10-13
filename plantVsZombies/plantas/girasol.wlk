import principales.*
import pvz.juego

class Girasol {
  // var property x
  // var property y
  const property velocidad = 10000
  const property costo = 50
  const property recolectable = false
  var property position
  // const property position

  method valor() = costo/2
  //method initialize(){
  //    game.onTick(velocidad, "sol", {game.addVisual(new Sol())})
  //}

  method image() = "girasol_f1.png"

  method actualizar () {
    game.onTick(velocidad, "generar soles", { self.generar() })
  }

  method generar () {
    const sol = new Sol(position = self.position())
    juego.crear(sol)
    game.onTick(5000, "eliminar soles", {game.removeVisual(sol)})
    game.say(self, "Hola")
  }
}

// class Sol{
//     // const property recolectable = true

//     const property position
//     method image() = "sol_f0.png"
//     // method valor() = 50
// }

