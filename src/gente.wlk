import planeta.*
import armas.*
import publicaciones.*

class Persona {
	var property edad
	method inteligencia() {
		if (edad.between(20, 40)) { return 12 }
		else { return 8 }
	}
	method potencia() = 20
	method esDestacada() = edad == 25 or edad == 35
	method ofrecerTributos(planeta) {}
	method valor() = self.inteligencia() + self.potencia()
}

class Atleta inherits Persona {
	var property masaMuscular = 4
	var property tecnicasConocidas = 2
	override method potencia() = super() + (masaMuscular * tecnicasConocidas)
	override method esDestacada() = super() or tecnicasConocidas > 5
	method entrenar(dias) { masaMuscular += dias / 5 }
	method aprenderUnaTecnica() { tecnicasConocidas += 1 }
	override method ofrecerTributos(planeta) {
		planeta.construirMurallas()
		planeta.construirMurallas()
	}
	method esUtilPara(planeta) = planeta.necesitaReforzarse()
}

class Docente inherits Persona {
	var property cursosDados = 0
	override method inteligencia() = super() + cursosDados * 2
	override method esDestacada() = cursosDados > 3
	override method ofrecerTributos(planeta) { planeta.fundarUnMuseo() }
	override method valor() = super() + 5
	method esUtilPara(planeta) = !planeta.esCulto()
}

class Soldado inherits Persona {
	const armas = #{}
	override method potencia() = super() + armas.sum({arma => arma.potenciaOtorgada(self)})
	override method ofrecerTributos(planeta) { 
		planeta.construirMurallas()
		planeta.construirMurallas()
		planeta.construirMurallas()
		planeta.construirMurallas()
		planeta.construirMurallas()
	}
	method esUtilPara(planeta) = planeta.potenciaReal() < 40
}

class Tecnico inherits Persona {
	
	const property publicaciones = #{}
	method aniadirPublicacion(publicacion) { publicaciones.add(publicacion) }
	method removerPublicacion(publicacion) { publicaciones.remove(publicacion) }
	override method inteligencia() = super() + publicaciones.sum({pub => pub.inteligenciaAportada()})
	override method potencia() = super() + publicaciones.count({pub => pub.esUtil()})
	override method ofrecerTributos(planeta) { planeta.construirEdificio() }
	override method esDestacada() = super() and publicaciones.size() >= 3
	method sabeDelTema(tema) = publicaciones.any({pub => pub.tema() == tema})
	method materialSobreElTema(tema) = publicaciones.filter({pub => pub.tema() == tema})
	method materialMenosUtil() = publicaciones.min({pub => pub.inteligenciaAportada()})
	method pasarseMaterial(tecnicoA, tecnicoB) { 
		if (tecnicoB.publicaciones().notContains(tecnicoA.materialMenosUtil())) {
			tecnicoB.add(tecnicoA.materialMenosUtil())
			tecnicoA.remove(tecnicoA.materialMenosUtil())
		}
	}
	method esUtilPara(planeta) = planeta.habitantes().size() >= 3
}

class Agricultor inherits Persona {
	var property sabeSobreRiego
	var property aniosDeExperiencia
	override method inteligencia() {
		if (sabeSobreRiego) { return aniosDeExperiencia * 2 }
		else { return aniosDeExperiencia }
	}
	override method potencia() = 5
	override method ofrecerTributos(planeta) {}
	override method esDestacada() = super() or (sabeSobreRiego and aniosDeExperiencia >= 5)
	method acumularExperiencia(anios) { aniosDeExperiencia += anios }
	method esUtilPara(planeta) = true
}