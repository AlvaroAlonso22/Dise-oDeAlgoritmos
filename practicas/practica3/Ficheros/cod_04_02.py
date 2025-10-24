class Parcial():
    
    def __init__(self, fich):
        self.candidatos = []
        self.seleccionados = set()
        self.universo = set()
        
        with open(fich) as f:
            for linea in f:
                datos = list(map(int, linea.split(":")[1].strip().split()))
                self.candidatos.append(set(datos[1:]))
                self.universo.update(datos[1:])
        
    def __repr__(self):
        return str(sorted([i for i in self.seleccionados]))
    
    def es_completa(self):
        cubiertas = set()
        for i in self.seleccionados:
            cubiertas.update(self.candidatos[i])
        return cubiertas == self.universo
    
    def coste(self):
        return len(self.seleccionados)
    
    def amplía(self):
        cubiertas = set()
        for i in self.seleccionados:
            cubiertas.update(self.candidatos[i])
        
        for idx in range(len(self.candidatos)):
            if idx not in self.seleccionados:
                aporte = self.candidatos[idx] - cubiertas
                if aporte:
                    nueva = self._clonar()
                    nueva.seleccionados.add(idx)
                    yield nueva
    
    def _clonar(self):
        nueva = Parcial.__new__(self.__class__)
        nueva.candidatos = self.candidatos
        nueva.universo = self.universo
        nueva.seleccionados = self.seleccionados.copy()
        return nueva



class Parcial_ct(Parcial):
    
    def cota(self):
        if self.es_completa():
            return self.coste()
        
        cubiertas = set()
        for i in self.seleccionados:
            cubiertas.update(self.candidatos[i])
        
        faltantes = self.universo - cubiertas
        
        cota_adicional = 0
        faltantes_temp = faltantes.copy()
        candidatos_disponibles = [i for i in range(len(self.candidatos)) 
                                  if i not in self.seleccionados]
        
        while faltantes_temp and candidatos_disponibles:
            mejor_candidato = None
            max_cobertura = 0
            
            for candidato in candidatos_disponibles:
                cobertura = len(self.candidatos[candidato] & faltantes_temp)
                if cobertura > max_cobertura:
                    max_cobertura = cobertura
                    mejor_candidato = candidato
            
            if mejor_candidato is None:
                break
            
            cota_adicional += 1
            faltantes_temp -= self.candidatos[mejor_candidato]
            candidatos_disponibles.remove(mejor_candidato)
        
        return self.coste() + cota_adicional



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
            if aporte > nuevas:
                mejor, nuevas = idx, aporte
            elif aporte == nuevas and mejor is not None and idx < mejor:
                mejor = idx
