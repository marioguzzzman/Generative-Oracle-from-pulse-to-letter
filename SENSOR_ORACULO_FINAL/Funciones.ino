void punto (){
  dato(300, 800);
}

void linea (){
  dato(600, 800);
}

void dato (int _tiempo, int _espera){
  digitalWrite(pin, HIGH);
  digitalWrite(pin2, HIGH);

  for(int i = 0 ; i < _tiempo; i++){
    sensores ();
    if(estado == false){
      digitalWrite(pin, LOW);
      digitalWrite(pin2, LOW);

      break;
    }
    delay(1);
  }

  digitalWrite(pin, LOW);
  digitalWrite(pin2, LOW);

  espera(_espera);
}

void espera(int _tiempo){
  for(int i = 0 ; i < _tiempo; i++){
    sensores ();
    if(estado == false){
      digitalWrite(pin, LOW);
      digitalWrite(pin2, LOW);


      break;
    }
    delay(1);
  }
}



