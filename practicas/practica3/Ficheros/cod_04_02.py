class Parcial():
    
    def __init__(self, fich):
        self.candidatos = []          # Lista de listas de habilidades de cada candidato
        self.seleccionados = set()    # Índices de los candidatos seleccionados
        self.universo = set()         # Todas las habilidades requeridas
        
        # Leer archivo y poblar candidatos
        with open(fich) as f:
            for linea in f:
                datos = list(map(int, linea.split(":")[1].strip().split()))
                self.candidatos.append(set(datos[1:]))
                self.universo.update(datos[1:])
        
    def __repr__(self):
        return str([i for i in self.seleccionados])
    
    def es_completa(self):
        cubiertas = set()
        for i in self.seleccionados:
            cubiertas.update(self.candidatos[i])
        return cubiertas == self.universo
    
    def coste(self):
        return len(self.seleccionados)

class Parcial_ct(Parcial):
    def cota(self):
        return self.coste()


class Parcial_vrz(Parcial):
    def amplía_voraz(self):
        cubiertas = set()
        for i in self.seleccionados:
            cubiertas.update(self.candidatos[i])
        
        mejor, nuevas = None, -1
        for idx, habilidades in enumerate(self.candidatos):
            if idx in self.seleccionados:
                continue
            aporte = len(habilidades - cubiertas)
            if aporte > nuevas:                   # opción: para desempate, menor índice
                mejor, nuevas = idx, aporte
            elif aporte == nuevas and mejor is not None and idx < mejor:
                mejor = idx
        
        if mejor is not None:
            self.seleccionados.add(mejor)

