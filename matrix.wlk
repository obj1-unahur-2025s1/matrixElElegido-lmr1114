object nave {
    const pasajeros = #{neo, morfeo, trinity}

    method cuantosPasajerosHay() = pasajeros.size()

    method pasajeroDeMayorVitalidad() = pasajeros.max({p => p.vitaulidad() })

    method pasajeroDeMenorVitalidad() = pasajeros.min({p => p.vitalidad()})

    method estaEquilibrada() = self.pasajeroDeMayorVitalidad() < self.pasajeroDeMenorVitalidad() * 2

    method estaElElegido() = pasajeros.any({p => p.esElElegido() })

    method chocar () {

        pasajeros.forEach({ //esto sirve como un "repetidor" pero con todos los elementos de la lista
            p => p.saltar()
        })
        pasajeros.clear()
    }

    method acelerar() {

        pasajeros.filter({ p => not p.esElElegido() }).forEach({p => p.saltar()})
        pasajeros.remove(neo)
    }
}

object neo {
    var energía = 100

    method esElElegido() = true

    method saltar() {
        energía = energía * 0.5
    }

    method vitalidad() = energía * 0.1

}

object morfeo {
    var vitalidad = 8
    var estaDescansado = true
    method esElElegido() = false

    method saltar() {
        estaDescansado = not estaDescansado
        vitalidad -= 1
        vitalidad = (vitalidad -1).max(0) //esto sirve para que el valor máximo de reducción sea 0

    }
    method vitalidad() = vitalidad
}

object trinity {

    method vitalidad() = 0

    method saltar () {

    }

    method esElElegido() = false

}