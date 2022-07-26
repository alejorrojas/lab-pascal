
Program AUDITCOM;

Type 

  Fecha = Record
    dia: 1 .. 31;
    mes: 1 .. 12;
    anio: 1950 .. 2022;
  End;

  Hora = Record
    hora: 1 .. 24;
    minutos: 1 .. 60;
    segundos: 1 .. 60 ;
  End;

  PAQUETE = Record
    Prot_Red: 1 .. 3;
    Prot_Transp: 1 .. 2;
    Puerto_Origen:  1 .. 65535;
    Puerto_Destino:  1 .. 65535;
    Horario: Hora;
    Dia:  Fecha;
    IPOrigen: integer;
    IPDestino: integer;
  End;


Var 
  regPaquete: PAQUETE;
  LAN_TRAFFIC: file Of PAQUETE;
  resRed: 1..3;
  resTransp: 1..2;
  contWeb, contFtp, contSmtp: integer;
  redWeb, redFtp, redSmtp: integer;
  totalWeb, totalFtp, totalSmtp: integer;

procedure Inicializar();
 begin
  assign(LAN_TRAFFIC, 'audit.dat'); 
  reset(LAN_TRAFFIC);
  read(LAN_TRAFFIC, regPaquete); 
  contWeb:= 0; 
  contFtp:= 0 ;
  contSmtp:= 0 ;
  redWeb:= 0 ;
  redFtp:= 0 ;
  redSmtp:= 0 ;
  totalWeb:= 0 ;
  totalFtp:= 0 ;
  totalSmtp:= 0 ;
  resRed:= regPaquete.Prot_Red;
  resTransp:= regPaquete.Prot_Transp;
end;

procedure CorteTransp();
  begin
    writeLn('Total de paquetes salientes a los protocolos web, ftp y smtp del protocolo de transporte: ', resTransp, ', de la red: ', resRed);
		writeLn('web: ', contWeb);
		writeLn('ftp: ', contFtp);
		writeLn('smtp: ', contSmtp);

			redWeb:= redWeb + contWeb;
			redFtp:= redFtp + contFtp;
			redSmtp:= redSmtp + contSmtp;

			contWeb:= 0 ;
			contFtp:= 0; 
			contSmtp:= 0 ;

			resTransp:= regPaquete.Prot_Transp;
  end;


procedure CorteRed();
  begin
    CorteTransp();
    writeLn('Total de paquetes salientes a los protocoles web, ftp y smtp de la red: ', resRed);
		writeLn('web: ', redWeb);
		writeLn('ftp: ', redFtp);
		writeLn('smtp: ', redSmtp);

    totalWeb:= totalWeb +  redWeb;
    totalFtp:= totalFtp +  redFtp;
    totalSmtp:= totalSmtp +  redSmtp;
		redWeb:= 0 ;
    redFtp:= 0 ;
    redSmtp:= 0 ;

		resRed:= regPaquete.Prot_Red;
  end;

procedure ProtocoloSeguridad();
  Var
    respuesta: char;
  begin
    writeLn('Dado que el paquete entrante pertenece a uno de los procotolos web, ftp o smtp se activo el protocolo de seguridad ante ataques');
		writeLn('Desea escanear el contenido del registro antes de seguir? S / N');
		readLn(respuesta);
    if respuesta = 'S' then
      begin
        writeLn(regPaquete.Prot_Red);
        writeLn(regPaquete.Prot_Transp);
        writeLn(regPaquete.Puerto_Origen);
        writeLn(regPaquete.Puerto_Destino);
        writeLn(regPaquete.IPOrigen);
        writeLn(regPaquete.IPDestino);
      end
    else if respuesta = 'N' then 
      begin
        writeLn('OK');
      end;

  end;

Begin
  Inicializar();

   while not eof(LAN_TRAFFIC) do 
    begin 
      //Verifico el corte
      if resRed <> regPaquete.Prot_Red then
         CorteRed()
      else if resTransp <> regPaquete.Prot_Transp then
          CorteTransp();        
    
      case regPaquete.Puerto_Destino of 
        21: contWeb := contWeb + 1;
			  80: contFtp := contFtp + 1;
			  25: contSmtp := contSmtp + 1;
      end;

      case regPaquete.Puerto_Origen of
         21: ProtocoloSeguridad();
         25: ProtocoloSeguridad();
         80: ProtocoloSeguridad();
      end;

     read(LAN_TRAFFIC, regPaquete); 
   end; 
   CorteRed();
   writeLn('Los totales generales de este archivo son: ');
   writeLn('web: ', totalWeb);
	 writeLn('ftp: ', totalFtp);
	 writeLn('smtp: ', totalSmtp);
   close(LAN_TRAFFIC); 
End.
