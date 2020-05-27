
class Enunciados //Clase Bolita
{
  //atributos
  PImage enunciado;
  int id2;
  int x;
  int y; 
  //Constructor
  Enunciados (int _id2 ) {
    id2 = _id2;
   
    enunciado = loadImage("enunciado" + id2 + ".png");//leo la imagen  

  }

  ////metodos
  void dibuja () {
    int a;
    //image(imagen,x,y);
  }
}

