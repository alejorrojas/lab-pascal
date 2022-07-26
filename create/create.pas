
Program CreateAuditFile;

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


Begin
  Assign(LAN_TRAFFIC,'audit.dat');
  Rewrite(LAN_TRAFFIC);
  With regPaquete do 
  begin 
    Prot_Red:= 1;
	Prot_Transp:= 1;
	Puerto_Origen:=  65;
	Puerto_Destino:=  535;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1236;
	IPDestino:= 1238;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 1;
	Prot_Transp:= 1;
	Puerto_Origen:=  21;
	Puerto_Destino:=  80;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 1;
	Prot_Transp:= 1;
	Puerto_Origen:=  25;
	Puerto_Destino:=  80;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 1;
	Prot_Transp:= 1;
	Puerto_Origen:=  21;
	Puerto_Destino:=  80;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 1;
	Prot_Transp:= 2;
	Puerto_Origen:=  80;
	Puerto_Destino:=  21;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 1;
	Prot_Transp:= 2;
	Puerto_Origen:=  65;
	Puerto_Destino:=  25;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 2;
	Prot_Transp:= 1;
	Puerto_Origen:=  21;
	Puerto_Destino:=  80;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 2;
	Prot_Transp:= 1;
	Puerto_Origen:=  80;
	Puerto_Destino:=  80;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 2;
	Prot_Transp:= 1;
	Puerto_Origen:=  25;
	Puerto_Destino:=  21;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 2;
	Prot_Transp:= 1;
	Puerto_Origen:=  69;
	Puerto_Destino:=  82;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 2;
	Prot_Transp:= 1;
	Puerto_Origen:=  21;
	Puerto_Destino:=  21;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 3;
	Prot_Transp:= 1;
	Puerto_Origen:=  21;
	Puerto_Destino:=  80;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 3;
	Prot_Transp:= 1;
	Puerto_Origen:=  80;
	Puerto_Destino:=  21;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 3;
	Prot_Transp:= 1;
	Puerto_Origen:=  21;
	Puerto_Destino:=  25;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 3;
	Prot_Transp:= 2;
	Puerto_Origen:=  58;
	Puerto_Destino:=  15;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 3;
	Prot_Transp:= 2;
	Puerto_Origen:=  25;
	Puerto_Destino:=  21;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  With regPaquete do 
  begin 
    Prot_Red:= 3;
	Prot_Transp:= 2;
	Puerto_Origen:=  99;
	Puerto_Destino:=  80;
	Horario.hora:= 15;
	Horario.minutos:= 30;
	Horario.segundos:= 60;
	Dia.dia:= 5;
	Dia.mes:= 7;
	Dia.anio:= 2022;
	IPOrigen:= 1238;
	IPDestino:= 1236;
  end; 
    Write(LAN_TRAFFIC, regPaquete);  
  Close(LAN_TRAFFIC);
end.