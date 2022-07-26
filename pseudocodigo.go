La empresa AUDIT.COM necesita realizar estadísticas sobre la captura de datos de la red de su
cliente NO_RULES SRL.Para ello cuenta con un archivo donde se han almacenado registros de
todos los paquetes del tráfico de la red desde las 08:00 hasta las 15:00hs de los días4,5y6de
Julio del 2022.
LAN_TRAFFIC ordenado por Prot_Red, Prot_Transp
Prot_Red | Prot_Transp | Puerto_Origen | Puerto_ Destino | Horario | Dia | IPOrigen | IPDestino 
Se necesita:
-Desarrollar un informe estadístico de totales de paquetes enviados(salientes) a los
puertos destino: web(80), ftp(21) y smtp(25) por Prot_Red, Prot_Transp, calcular también
los totales generales.(¿Cuántos paquetes se han enviados a cada uno de los protocolos
mencionados?)
-Mostrar mensajes por pantalla cuando el paquete sea recibido (entrante) a  los protocolos:
web(80),ftp(21) y smtp(25).Indicando que existe una posibilidad de escaneo para
ataques. Imprimir todos los datos del registro.

Accion Pascal es 
	Ambiente 
		Fecha = registro
			dia: N(2)
			mes: N(2)
			año: N(4)
		finRegistro

		Hora = registro
			hora: N(2)
			minutos: N(2)
			segundos: N(2)
		finRegistro

		PAQUETE = registro
			Prot_Red: 1..3
			Prot_Transp: 1..2
			Puerto_Origen:  1..65535
			Puerto_Destino:  1..65535
			Horario: Hora
			Dia:  Fecha
			IPOrigen: AN(15)
			IPDestino: AN(15)
		finRegistro


		LAN_TRAFFIC: archivo de PAQUETE ordenado por Prot_Red, Prot_Transp
		regPaquete: PAQUETE

		conjProtocolos: (80, 21, 25)
		resRed: 1..3
		resTransp: 1..2
		contWeb, contFtp, contSmtp: N(6)
		redWeb, redFtp, redSmtp: N(4);
		totalWeb, totalFtp, totalSmtp: N(4);
		

		Procedimiento Inicializar() es
			Abrir E/(LAN_TRAFFIC); Leer(LAN_TRAFFIC, regPaquete)
			contWeb:= 0 
			contFtp:= 0 
			contSmtp:= 0 
			redWeb:= 0 
			redFtp:= 0 
			redSmtp:= 0 
			totalWeb:= 0 
			totalFtp:= 0 
			totalSmtp:= 0 
			resRed:= regPaquete.Prot_Red
			resTransp:= regPaquete.Prot_Transp
		finProcedimiento

		Procedimiento CorteRed() es
			CorteTransp()
			Escribir("Total de paquetes salientes a los protocoles web, ftp y smtp de la red: ", resRed)
			Escribir("web: ", redWeb)
			Escribir("ftp: ", redSmtp)
			Escribir("smtp: ", redSmtp)

			totalWeb:= totalWeb +  redWeb
    		totalFtp:= totalFtp +  redFtp
    		totalSmtp:= totalSmtp +  redSmtp
			redWeb:= 0 
    		redFtp:= 0 
    		redSmtp:= 0 

			resRed:= regPaquete.Prot_Red
		finProcedimiento

		Procedimiento CorteTransp() es
			Escribir("Total de paquetes salientes a los protocolos web, ftp y smtp del protocolo de transporte", resTransp, "de la red: ", resRed)
			Escribir("web: ", contWeb)
			Escribir("ftp: ", contFtp)
			Escribir("smtp: ", contSmtp)

			redWeb:= redWeb + contWeb
			redFtp:= redFtp + contFtp
			redSmtp:= redSmtp + contSmtp

			contWeb:= 0 
			contFtp:= 0 
			contSmtp:= 0 

			resTransp:= regPaquete.Prot_Transp
		finProcedimiento

		Procedimiento ProcotoloSeguridad() es
			Ambiente 
				respuesta: ("si", "no")
			Algoritmo
				Escribir("Dado que el paquete entrante pertenece a uno de los procotolos web, ftp o smtp
						  se activo el protocolo de seguridad ante ataques")
				Escribir("Desea escanear el contenido del registro antes de seguir? si / no")
				Leer(respuesta)
			
				Si respuesta = "si" entonces
					Escribir(regPaquete.Prot_Red)
					Escribir(regPaquete.Prot_Transp)
					Escribir(regPaquete.Puerto_Origen)
					Escribir(regPaquete.Puerto_Destino)
					Escribir(regPaquete.Horario)
					Escribir(regPaquete.Dia)
					Escribir(regPaquete.IPOrigen)
					Escribir(regPaquete.IPDestino)
				finSi
		finProcedimiento

	Algoritmo

		Inicializar()
		Mientras NFDA(LAN_TRAFFIC) hacer
			//Ver corte
			Si resRed <> regPaquete.Prot_Red entonces
				CorteRed()
			sino
				Si resTransp <> regPaquete.Prot_Transp entonces
					CorteTransp()
				finSi
			finSi

			//Tratamos el archivo
			Segun regPaquete.Puerto_Destino hacer
				80: contWeb:= contWeb + 1 
				21: contFtp:= contFtp + 1 
				25:	contSmtp:= contSmtp + 1 
			finSegun

			Si regPaquete.Puerto_Origen en conjProcotolos entonces
				ProcotoloSeguridad()
			finSi

			//Avanzo
			Leer(LAN_TRAFFIC, regPaquete)
		finMientras
		CorteRed()
		Escribir("Los totales generales de este archivo son: ");
		Escribir("web: ", totalWeb);
		Escribir("ftp: ", totalFtp);
		Escribir("smtp: ", totalSmtp);

finAccion
