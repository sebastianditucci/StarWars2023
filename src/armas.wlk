class Pistolete {
	var property largo
	method potenciaOtorgada(soldado) {
		if (soldado.edad() > 30) { return largo * 3 }
		else { return largo * 2 }
	}
}

class Espadon {
	var property peso
	method potenciaOtorgada(soldado) {
		if (soldado.edad() < 40) { return peso / 2 }
		else { return 6 }
	}
}