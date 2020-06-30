// PRESENCIA
int valor;//valor sensor
int valor2;//valor sensor

const int pin_entrada = A0;//Pin de entrada analogica
const int pin_entrada2 = A1;//Pin de entrada analogica

//UMBRALES
int umbral_alto = 900;//umbrales de valores
int umbral_bajo = 700;

boolean estado = false;

int pin = 10;
int pin2 = 11;


void setup() {
  Serial.begin(9600);//puerto usb
  pinMode(pin_entrada, INPUT);   //entrada analogica
  pinMode(pin_entrada2, INPUT);
  pinMode(pin, OUTPUT);
  pinMode(pin2, OUTPUT);

}

void loop() {
  sensores ();

  presagio (); // .--. .-. . ... .- --. .. --- .-.-. PRESAGIO

}




