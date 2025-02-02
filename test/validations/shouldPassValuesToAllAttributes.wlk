/* ================================================================================
 * - using a simple hierarchy 
 * - instantiation with new using different strategies
 * ===============================================================================*/
class Ave {
  var variableInicializadaConNull = null
	var energia
	var edad = 10
	method variableInicializadaConNull() = variableInicializadaConNull
	method cumplirAnios() {
		edad = edad + 1
		variableInicializadaConNull = true
	}
	method volar() { energia = energia - 10 }
}

class Golondrina inherits Ave {
	const peso
	method estaGorda() = peso > 100
}

class Torcaza inherits Ave {
	var color
	
	method crecer() {
		color = "rojo"
	}
	method esLinda() = color === "rojo"
}

class Entrenador {
	var pepita = null
	var otraPepita = null
	var torcaza = null
	method crearUnAve() {
		pepita = @Expect(code="shouldPassValuesToAllAttributes", level="error", expectedOn="new Ave(edad = 2) // missing 'energia'") new Ave(edad = 2) // missing 'energia'
		pepita = new Ave(edad = 2, energia = 50)
		pepita = new Ave(energia = 50)
	}
	method crearOtraAve() {
		otraPepita = @Expect(code="shouldPassValuesToAllAttributes", level="error", expectedOn="new Golondrina(edad = 2)") new Golondrina(edad = 2)
		otraPepita = @Expect(code="shouldPassValuesToAllAttributes", level="error", expectedOn="new Golondrina(edad = 10, peso = 5) // missing 'energia'") new Golondrina(edad = 10, peso = 5) // missing 'energia'
		otraPepita = new Golondrina(edad = 10, peso = 5, energia = 56)
	}
	method crearTorcaza() {
		torcaza = new Torcaza(color = "rojo", energia = 25, edad = 3) // OK
		torcaza = @Expect(code="shouldPassValuesToAllAttributes", level="error", expectedOn="new Torcaza(color = \"rojo\") // missing 'energia'") new Torcaza(color = "rojo") // missing 'energia'
		torcaza = @Expect(code="shouldPassValuesToAllAttributes", level="error", expectedOn="new Torcaza(edad = 5) // missing 'color' and 'energia'") new Torcaza(edad = 5) // missing 'color' and 'energia'
		torcaza = @Expect(code="shouldPassValuesToAllAttributes", level="error", expectedOn="new Torcaza() // missing 'color' and 'energia'") new Torcaza() // missing 'color' and 'energia'
	}
}
