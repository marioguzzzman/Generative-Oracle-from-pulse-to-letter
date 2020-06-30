void sensores (){

  int valor = analogRead(pin_entrada);
  int valor2 = analogRead(pin_entrada2);
  
  if(estado == false){
    if(valor < umbral_bajo && valor2 < umbral_bajo ){
      //recien hay alguien
      estado = true;
      Serial.println(0);
      //Serial.write(0);
    }
  }
  else{//estado false
    if(valor > umbral_alto && valor2 > umbral_bajo ){
      //recien hay alguien
      estado = false;
      Serial.println(1);
      // Serial.write(1);
    }
  }
}
