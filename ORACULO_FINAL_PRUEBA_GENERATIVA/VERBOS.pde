
class Verbos //Clase Bolita
{
  //atributos
  PImage verbo;
  int id;
  int x;
  int y; 
  //Constructor
  Verbos (int _id ) {
    id = _id;
   
    verbo = loadImage("verbo" + id + ".png");//leo la imagen  

  }

  ////metodos
  void dibuja () {
    int a;
    //image(imagen,x,y);
  }
}

