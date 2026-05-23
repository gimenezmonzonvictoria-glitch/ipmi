PImage portada;

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;

// ---------------- FUENTES ----------------

PFont fuenteTitulo;
PFont fuenteTexto;

// ---------------- VARIABLES ----------------

int pantalla = 0;

int tiempoPantalla = 0;

// DURACION DE CADA ESCENA

int duracion = 19000;

// ANIMACIONES

float moverCaja = -650;

float alphaFondo = 0;

int letrasMostradas = 0;

int velocidadTexto = 2;

// BOTON

float xBoton = 220;
float yBoton = 390;

float anchoBoton = 200;
float altoBoton = 50;

// INICIO

boolean iniciar = false;

// =====================================================
// SETUP
// =====================================================

void setup() {

  size(640, 480);

  smooth();

  // ---------------- IMAGENES ----------------

  portada = loadImage("portada2.jpg");

  img1 = loadImage("inicio.jpg");

  img2 = loadImage("plaga.jpg");

  img3 = loadImage("odio.jpg");

  img4 = loadImage("llegada.jpg");

  img5 = loadImage("ayuda1.jpg");

  img6 = loadImage("nopagan.jpg");

  img7 = loadImage("losniños.jpg");

  img8 = loadImage("miedo.jpg");

  img9 = loadImage("portada3.jpg");

  // ---------------- FUENTES ----------------

  fuenteTitulo = loadFont("Georgia-Bold-32.vlw");

  fuenteTexto = loadFont("ArialMT-20.vlw");

  tiempoPantalla = millis();
}

// =====================================================
// DRAW
// =====================================================

void draw() {

  background(0);

  // ---------------- PORTADA ----------------

  if (iniciar == false) {

    pantallaInicio();
  }

  // ---------------- HISTORIA ----------------

  else {

    cambiarPantallas();

    if (pantalla == 1) {

      escena(img1,
        "Había una vez un pueblo llamado Hamelín donde todos vivían felices y tranquilos.");
    }

    else if (pantalla == 2) {

      escena(img2,
        "Un día, el pueblo de Hamelín comenzó a llenarse de ratas. Había tantas que entraban en las casas, rompían cosas y se comían toda la comida. Los habitantes estaban muy asustados porque no podían detener la plaga.");
    }

    else if (pantalla == 3) {

      escena(img3,
        "Las personas del pueblo vivían con miedo y desesperación. Las ratas aparecían en cada rincón y ya nadie podía dormir tranquilo. Hamelín dejó de ser un lugar feliz.");
    }

    else if (pantalla == 4) {

      escena(img4,
        "Entonces llegó un flautista misterioso vestido con ropa colorida. Él prometió ayudar a todos y eliminar las ratas del pueblo. A cambio, pidió una recompensa por su trabajo.");
    }

    else if (pantalla == 5) {

      escena(img5,
        "El flautista comenzó a tocar una melodía con su flauta mágica. Todas las ratas lo siguieron por las calles hasta desaparecer lejos del pueblo. Los habitantes quedaron sorprendidos y felices.");
    }

    else if (pantalla == 6) {

      escena(img6,
        "Cuando el problema terminó, los habitantes no quisieron darle la recompensa prometida. El flautista se sintió engañado y muy enojado por la injusticia del pueblo.");
    }

    else if (pantalla == 7) {

      escena(img7,
        "Enojado, el flautista tocó otra melodía y todos los niños comenzaron a seguirlo.");
    }

    else if (pantalla == 8) {

      escena(img8,
        "Desde ese día jamás volvieron a ver a los niños y Hamelín quedó lleno de tristeza.");
    }

    else if (pantalla == 9) {

      escena(img9,
        "La leyenda del Flautista de Hamelín jamás fue olvidada.");

      botonReiniciar();
    }
  }
}

// =====================================================
// ESCENA GENERAL
// =====================================================

void escena(PImage img, String texto) {

  // IMAGEN QUIETA

  image(img, 0, 0, width, height);

  // SOMBRA OSCURA

  fill(0, 90);

  rect(0, 0, width, height);

  // ANIMACIONES

  animaciones();

  // CAJA MODERNA

  fill(15, 15, 15, alphaFondo);

  stroke(255, 60);

  strokeWeight(2);

  rect(moverCaja + 30, 300, 580, 150, 28);

  noStroke();

  // TEXTO

  fill(255);

  textAlign(LEFT, TOP);

  textFont(fuenteTexto);

  textSize(20);

  // EFECTO LETRAS

  if (letrasMostradas > texto.length()) {

    letrasMostradas = texto.length();
  }

  String textoVisible =
    texto.substring(0, letrasMostradas);

  text(textoVisible,
    moverCaja + 60,
    325,
    520,
    120);
}

// =====================================================
// ANIMACIONES
// =====================================================

void animaciones() {

  // CAJA ENTRA SUAVE

  if (moverCaja < 0) {

    moverCaja += 10;
  }

  // FADE

  if (alphaFondo < 190) {

    alphaFondo += 5;
  }

  // TEXTO VIDEOJUEGO

  if (frameCount % velocidadTexto == 0) {

    letrasMostradas++;
  }
}

// =====================================================
// CAMBIAR PANTALLAS
// =====================================================

void cambiarPantallas() {

  if (pantalla < 9 &&
    millis() - tiempoPantalla > duracion) {

    pantalla++;

    tiempoPantalla = millis();

    reiniciarAnimaciones();
  }
}

// =====================================================
// REINICIAR ANIMACIONES
// =====================================================

void reiniciarAnimaciones() {

  moverCaja = -650;

  alphaFondo = 0;

  letrasMostradas = 0;
}

// =====================================================
// PORTADA
// =====================================================

void pantallaInicio() {

  image(portada, 0, 0, width, height);

  fill(0, 170);

  rect(0, 0, width, height);

  fill(255);

  textAlign(CENTER);

  textFont(fuenteTitulo);

  textSize(36);

  text("EL FLAUTISTA DE HAMELIN",
    width/2,
    140);

  textFont(fuenteTexto);

  textSize(20);

  text("Una antigua leyenda alemana",
    width/2,
    190);

  // BOTON

  if (mouseX > xBoton &&
    mouseX < xBoton + anchoBoton &&
    mouseY > yBoton &&
    mouseY < yBoton + altoBoton) {

    fill(180, 70, 70);
  }

  else {

    fill(120, 40, 40);
  }

  rect(xBoton, yBoton,
    anchoBoton,
    altoBoton,
    20);

  fill(255);

  textSize(24);

  text("INICIAR",
    width/2,
    423);
}

// =====================================================
// BOTON REINICIAR
// =====================================================

void botonReiniciar() {

  if (mouseX > xBoton &&
    mouseX < xBoton + anchoBoton &&
    mouseY > yBoton &&
    mouseY < yBoton + altoBoton) {

    fill(60, 120, 200);
  }

  else {

    fill(40, 80, 160);
  }

  rect(xBoton, yBoton,
    anchoBoton,
    altoBoton,
    20);

  fill(255);

  textAlign(CENTER);

  textSize(24);

  text("REINICIAR",
    width/2,
    423);
}

// =====================================================
// CLICK
// =====================================================

void mouseClicked() {

  // INICIAR

  if (iniciar == false) {

    if (mouseX > xBoton &&
      mouseX < xBoton + anchoBoton &&
      mouseY > yBoton &&
      mouseY < yBoton + altoBoton) {

      iniciar = true;

      pantalla = 1;

      tiempoPantalla = millis();

      reiniciarAnimaciones();
    }
  }

  // REINICIAR

  else if (pantalla == 9) {

    if (mouseX > xBoton &&
      mouseX < xBoton + anchoBoton &&
      mouseY > yBoton &&
      mouseY < yBoton + altoBoton) {

      pantalla = 1;

      tiempoPantalla = millis();

      reiniciarAnimaciones();
    }
  }
}
