PImage miImage;

float rotacion = 0;
float escala = 1;

color claro;
color oscuro;


void setup() {

  size(800,400);

  miImage = loadImage("cuadrado.jpg");

  rectMode(CENTER);
  noFill();

  claro = color(245);
  oscuro = color(35);
}

void draw() {

  background(165);

  if(miImage != null){
    image(miImage,0,0,400,400);
  }

  noStroke();
  fill(165);
  rectMode(CORNER);
  rect(400,0,400,400);
  rectMode(CENTER);

  dibujarObra();

  fill(0);
  textSize(15);
 
}

void dibujarObra(){

  pushMatrix();

  translate(600,200);

  rotate(rotacion);

  float tam = calcularTamano();

  for(int anillo=0; anillo<4; anillo++){
 

    float radio = 35 + anillo*40;

    int cantidad = 14 + anillo*7;

    for(int i=0;i<cantidad;i++){

      float angulo = TWO_PI/cantidad*i;

      float x = cos(angulo)*radio;
      float y = sin(angulo)*radio;

      pushMatrix();

      translate(x,y);

      rotate(angulo + PI/4);

      if(i%2==0){
        stroke(claro);
      }else{
        stroke(oscuro);
      }

      strokeWeight(2);

      rect(0,0,tam*escala,tam*escala);

      popMatrix();

    }

  }

  popMatrix();

}

float calcularTamano(){

  float d = dist(mouseX,mouseY,600,200);

  return map(d,0,300,14,22);

}

void mousePressed(){

  rotacion += radians(15);


}

void keyPressed(){

  if(keyCode==RIGHT){
    escala +=0.05;
  }

  if(keyCode==LEFT){
    escala -=0.05;
  }

  escala = constrain(escala,0.8,1.4);

  if(key==' '){

    claro = color(random(180,255));
    oscuro = color(random(0,80));

  }

  if(key=='r' || key=='R'){

    rotacion = 0;
    escala = 1;
   
    claro = color(245);
    oscuro = color(35);

  }

}
