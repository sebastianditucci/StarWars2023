class Publicacion {
	var property tema 
	var property inteligenciaAportada 
	var property esUtil
    method valorGlobal() 
}

class Manual inherits Publicacion {
	override method inteligenciaAportada() = 5
	override method valorGlobal() {
		if (esUtil) { return 10 }
		else { return 4 }
	}
}

class Novela inherits Publicacion {
	override method tema() = "literatura"
	override method esUtil() = false
	override method valorGlobal() = inteligenciaAportada * 2
}