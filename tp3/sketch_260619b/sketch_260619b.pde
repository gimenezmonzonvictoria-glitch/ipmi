PImage image;

float rotacion = 0;
float escala = 1;

void setup() {

  size(800, 400);

  image = loadImage("cuadrado.jpg");

  rectMode(CENTER);
  noFill();
}

void draw() {

  background(165);

  image(image, 0, 0, 400, 400);

  // Fondo
  fill(165);
  noStroke();
  rectMode(CORNER);
  rect(400, 0, 400, 400);

  dibujarObra();
}


void dibujarObra() {

  float centroX = 600;
  float centroY = 200;

  float tam = calcularTamano();

  for (int anillo = 0; anillo < 4; anillo++) {

    float radio;

    if (anillo == 0) {
      radio = 35;
    } else if (anillo == 1) {
      radio = 85;
    } else if (anillo == 2) {
      radio = 130;
    } else {
      radio = 175;
    }

    int cantidad = 16 + anillo * 8;

    for (int i = 0; i < cantidad; i++) {

      float angulo = TWO_PI / cantidad * i;

      float x = centroX + cos(angulo + rotacion) * radio;
      float y = centroY + sin(angulo + rotacion) * radio;

      pushMatrix();

      translate(x, y);

      rotate(angulo + PI/4 + rotacion);

      if (i % 2 == 0) {
        stroke(245);
      } else {
        stroke(35);
      }

      strokeWeight(2);

      rect(0, 0, tam * escala, tam * escala);

      popMatrix();
    }
  }
}


float calcularTamano() {

  float d = dist(mouseX, mouseY, 600, 200);

  return map(d, 0, 300, 16, 20);
}

void mousePressed() {

  rotacion += random(0.03, 0.08);
}

void keyPressed() {

  if (keyCode == RIGHT) {

    escala += 0.05;

  } else if (keyCode == LEFT) {

    escala -= 0.05;
  }

  if (escala < 0.8) {
    escala = 0.8;
  }

  if (escala > 1.4) {
    escala = 1.4;
  }
}
