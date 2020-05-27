class Objeto {
  
  float x, y;
  float d = random(1, 10);
  float direccion;
  float velocidad;
  float limite;
  
  color c;
  color c2;
  color c3;

  int largo= 1360;
  int alto = 768;
  int juntos;

//---------------------------

  Objeto( ) {
    //limite = width ;
    limite = largo ;
    x = random(limite);
    //y = random(height);
    y = random(alto);
    direccion = random(TWO_PI);
    //direccion = 0;
    velocidad = random(0.2, 5);
    //d = random(5,diametroLimite);
    c = color( random(255), transparencia );
  }
//------------------------------------------

//------------ TEXTO
  void mover(PImage verbo, PImage enunciado, PImage complemento) {

    if ( mousePressed ) {
      float angu = random(TWO_PI);
      float radio = random(diametro);
      x = mouseX + radio * cos( angu );    
      y = mouseY + radio * sin( angu );
    }

    colorMode(HSB);

    color c = verbo.get( int(x), int(y) );
    color c2 = enunciado.get( int(x), int(y) );
    color c3 = complemento.get( int(x), int(y) );

//------------ FONDO

    color d = fondo.get( int(x), int(y) );
    float valor = brightness(c);

    if ( random(100)<probCambioColor ) {
      this.c = color( hue(c), saturation(c), brightness(c), transparencia );
      this.c2 = color( hue(c2), saturation(c2), brightness(c2), transparencia );
      this.c3 = color( hue(c3), saturation(c3), brightness(c3), transparencia );
    }
    else if ( random(100)<20 ) {
      this.c = color( hue(d), saturation(d), brightness(d), transparencia  );
      this.c2 = color( hue(d), saturation(d), brightness(d), transparencia  );
      this.c3 = color( hue(d), saturation(d), brightness(d), transparencia  );
    }

    colorMode(RGB);


    //float newdir = map( valor , 0 , 255 , 0 , TWO_PI );

    float doblar = radians( map( valor, 255, 0, 0.2, 6 ) );
    direccion += doblar;

    //direccion = radians(map( valor, 0, 255, random(10,60), 130 ) );

    x += velocidad*cos(direccion);
    y += velocidad*sin(direccion);

    x = ( x>limite ? x-limite : x );
    //y = ( y>height ? y-height : y );
    y = ( y>alto ? y-alto : y );

    x = ( x<0 ? x+limite : x );
    //y = ( y<0 ? y+height : y );
    y = ( y<0 ? y+alto : y );
  }

//------------------------------------------ FONDO

  void dibujar( PGraphics lienzo ) {

    juntos = c + c2 + c3;
    stroke(juntos);

    noFill();
    //fill(c);
    //noStroke();
    if ( figura ) {
      ellipse(x, y, d, d);
      //rect(x,y,d,d);
    }
    else {
      point(x, y);
    }
  }
}

