/* ORACULO GENERATIVO - MARIO ALBERTO GUZMÁN CERDIO- 
 
 marioguzzzman@gmail.com
 
 MAESTRÍA EN TECNOLOGÍA Y ESTÉTICA DE LAS ARTES ELECTRÓNICAS
 
 2014 */


//------------ ARDUINO
import processing.serial.*;
import org.firmata.*;
Serial myPort; 
boolean hay_alguien = false;

//------------ TEXTO
Verbos verbo [];//objetos del tipo Bolita
int cantidadverbos = 30;
int target = 0;

Enunciados enunciado [];//objetos del tipo Bolita
int cantidaden = 30;
int target2 = 0;

Complementos complemento [];//objetos del tipo Bolita
int cantidadcom = 30;
int target3 = 0;

//------------ VISUALIZACIÓN
Objeto o[];

int largo= 1360; 
int alto = 768;

PGraphics lienzo; 
PGraphics proceso;
boolean figura = false;

//PImage imagen;
PImage fondo;

float transparencia = 200;
int cantidad = 5000;
float probabilidadDispersion = 1;
float probCambioColor = 15;
float amortigua = 0.952;
float diametro = 100;

//--------------------------------------

void setup() {

  //size(imagen.width, imagen.height );
  // size(1280, 800);
  size(largo, alto);

  //------------SENSOR
  // println(Serial.list());
  //String portName = Serial.list()[5];
  //myPort = new Serial(this, "/dev/tty.usbmodem621", 9600);
  // mac nueva
  myPort = new Serial(this, "/dev/tty.usbmodem1411", 9600);
  //windows
  //myPort = new Serial(this, Serial.list()[0], 9600);

  //------------ INICIO TEXTO
  verbo = new Verbos [cantidadverbos];//iniico clase
  for ( int i=0; i<cantidadverbos; i++ ) {
    verbo[i] = new Verbos(i);//inicio cada objeto
  }
  enunciado = new Enunciados [cantidaden];//iniico clase
  for ( int j=0; j<cantidaden; j++ ) {
    enunciado[j] = new Enunciados(j);//inicio cada objeto
  }
  complemento = new Complementos [cantidadcom];//iniico clase
  for ( int e=0; e<cantidadcom; e++ ) {
    complemento[e] = new Complementos(e);//inicio cada objeto
  }

  //------------ INICIO VISUALIZACIÓN
  //imagen = loadImage( "imagen_base1.jpg" );
  fondo = loadImage( "fondo1.jpg" );

  o = new Objeto[ cantidad];
  for ( int i=0; i<cantidad; i++ ) {
    o[i] = new Objeto();
  }

  background(0);
  smooth();
  noStroke();
  frameRate(30);
}
//--------------------------------------

void draw() {

  //------------ ARDUINO
  if ( myPort.available() > 0) {  // If data is available,
    int llego = myPort.read();         // read it and store it in val
    //int llego = 0;         // read it and store it in val
    //if (keyPressed) {
    if (llego == 1 || keyPressed) {

      hay_alguien = true;    

      //------------ TEXTO
      target = int(random(0, cantidadverbos));
      target = constrain(target, 0, cantidadverbos-1);

      target2 = int(random(0, cantidaden));
      target2 = constrain(target2, 0, cantidaden-1);

      target3 = int(random(0, cantidadcom));
      target3 = constrain(target3, 0, cantidadcom-1);

      println("llego: " + llego);
      println("arduino: " + myPort.read());

      println("verbo: " + target);
      println("enunciado: " + target2);
      println("complemento: " + target3);
    } else {
      if (llego == 0 ) {

        hay_alguien  = false;
        println("se fue: " + llego);
      }
    }
  }// cierra llego


    //------------ VISUALIZACIÓN
  if (hay_alguien == true) {
    //background(255);
    verbo[target].dibuja();
    enunciado [target2].dibuja();
    for ( int i=0; i<cantidad; i++ ) {
      //o[i].mover( imagen );
      o[i].mover(verbo[target].verbo, enunciado[target2].enunciado, complemento[target3].complemento );
    }

    for ( int i=0; i<cantidad; i++ ) {
      o[i].dibujar( lienzo );
    }
  } else {
    fill (0, 10);
    rect (0, 0, largo, alto);
  }
}
//--------------------------------------

//void mousePressed() {
//  save("particula_ej_1.jpg");
//}

