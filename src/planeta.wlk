import galaxia.*

class Planeta {
	const property habitantes = #{}
	var property cantidadMuseos = 0
	var longitudTotalDeMurallas = 0
	var property cantidadEdificios = 0
	method aniadirHabitante(habitante) { habitantes.add(habitante) }
	method removerHabitante(habitante) { habitantes.remove(habitante) }
	method delegacionDiplomatica() = habitantes.filter({hab => hab.esDestacada()})
	method valorInicialDeDefensa() = habitantes.count({hab => hab.potencia() >= 30})
	method esCulto() = cantidadMuseos >= 2 and habitantes.all({hab => hab.inteligencia() >= 10})
	method potenciaReal() = habitantes.sum({hab => hab.potencia()})
	method construirMurallas() { longitudTotalDeMurallas += 1 }
	method fundarUnMuseo() { cantidadMuseos += 1 }
	method construirEdificio() { cantidadEdificios += 1 }
	method potenciaAparente() = habitantes.max({hab => hab.potencia()}) * habitantes.size()
	method necesitaReforzarse() = self.potenciaAparente() >= self.potenciaReal() * 2
	method recibirTributos() { habitantes.forEach({hab => hab.ofrecerTributos(self)}) }
	method habitantesValiosos() = habitantes.filter({hab => hab.valor() >= 40})
	method apaciguarAPlaneta(planeta) { self.habitantesValiosos().forEach({hab => hab.ofrecerTributos(planeta)}) }
	method indiceDeConstruccion() = longitudTotalDeMurallas + cantidadMuseos * 30 + cantidadEdificios * 10
	method esCopado() = self.esCulto() and habitantes.size() > 4
	method estaBienDefendido() = self.valorInicialDeDefensa() + galaxia.nivelBasicoEnergia() >= 8
	method habitantesUtiles() = habitantes.filter({hab => hab.esUtilPara(self)})
}