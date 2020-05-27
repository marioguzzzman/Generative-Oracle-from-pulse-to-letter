
class Complementos //Clase Bolita
{
  //atributos
  PImage complemento;
  int id3;
  int x;
  int y; 
  
  //Constructor
  Complementos (int _id3 ) {
    id3 = _id3;
   
    complemento = loadImage("complmento" + id3 + ".png");//leo la imagen  

  }

  ////metodos
  void dibuja () {
    int a;
    //image(imagen,x,y);
  }
}

