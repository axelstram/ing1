import random

class Suelo():
	def __init__(self):
		self.durezas = ["Alta", "Intermedia", "Baja"]
		self.porosidades = ["Alta", "Intermedia", "Baja"]
		
		tipoSuelo = random.randint(0,2)

		self.dureza = self.durezas[tipoSuelo]
		self.porosidad = self.porosidades[tipoSuelo]
		self.tipo = tipoSuelo

class Parametros():
	def __init__(self, sentidoInicio, velocidadInicio, tiempoInicio, sentidoFin, velocidadFin, tiempoFin):
		self.sentidoInicio = sentidoInicio 
		self.velocidadInicio = velocidadInicio
		self.tiempoInicio = tiempoInicio
		self.sentidoFin = sentidoFin
		self.velocidadFin = velocidadFin
		self.tiempoFin = tiempoFin

class BrazoRobotico():
	def __init__(self):
		pass

	def girar(self, parametros):
		tiempoInicio = parametros.tiempoInicio
		while tiempoInicio > 0:
			print('Girando en sentido %s a %d rpm por %d minutos más' %(parametros.sentidoInicio, parametros.velocidadInicio, tiempoInicio))
			tiempoInicio -= 1

		tiempoFin = parametros.tiempoFin
		while tiempoFin > 0:
			print('Girando en sentido %s a %d rpm por %d minutos más' %(parametros.sentidoFin, parametros.velocidadFin, tiempoFin))
			tiempoFin -= 1
			
		print('Muestra extraída')

class LunaRover():
	def __init__(self):
		self.brazoRobotico = BrazoRobotico()

	def inspeccionarSuelo(self):
		return Suelo()

	def decidirParametros(self, suelo):
		if suelo.dureza == "Alta":
			return Parametros(sentidoInicio="clockwise", velocidadInicio= 150, tiempoInicio= 10, 
							  sentidoFin= "counter clockwise", velocidadFin= 150, tiempoFin= 10)
		elif suelo.dureza == "Intermedia":
			return Parametros(sentidoInicio="counter clockwise", velocidadInicio= 100, tiempoInicio= 5, 
							  sentidoFin= "clockwise", velocidadFin= 100, tiempoFin= 5)
		else:
			return Parametros(sentidoInicio="clockwise", velocidadInicio= 150, tiempoInicio= 5, 
							  sentidoFin= "counter clockwise", velocidadFin= 100, tiempoFin= 10)

	def girarBrazoRobotico(self):
		suelo = self.inspeccionarSuelo()
		print("Encontré suelo tipo %d" %suelo.tipo)

		parametros = self.decidirParametros(suelo)
		self.brazoRobotico.girar(parametros)

if __name__ == "__main__":
	lunaRover = LunaRover()
	lunaRover.girarBrazoRobotico()
