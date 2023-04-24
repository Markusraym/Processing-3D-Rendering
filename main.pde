Camera cameraPosition;
PShape triangle1;
PShape triangle2;
PShape triangle3;
PShape triangle4;
PShape triangle5;
PShape triangle6;
PShape triangle7;
PShape triangle8;
PShape triangle9;
PShape triangle10;
PShape triangle11;
PShape triangle12;
PShape monster;
PShape wireFrameMonster;
int spaceBarCount = 0;


void setup()
{
  cameraPosition = new Camera();
  size(1600, 1000, P3D);
  makeVertices(); //Makes all the vertices necessary for the 2 cubes and rectangle
  monster = loadShape("monster.obj");
  wireFrameMonster = loadShape("monster.obj");
  PVector tinyCube = new PVector(110, 0, 0);
  PVector mediumCube = new PVector(100, 0, 0);
  PVector bigCube = new PVector (90, 0, 0);
  PVector halfscaleMonster = new PVector(0, 0, 0);
  PVector wireFrameMonsterVector = new PVector(-75, 0, 0);
  PVector triangleFans = new PVector(50, 0, 0);
  cameraPosition.AddLookAtTarget(tinyCube);
  cameraPosition.AddLookAtTarget(mediumCube);
  cameraPosition.AddLookAtTarget(bigCube);
  cameraPosition.AddLookAtTarget(halfscaleMonster);
  cameraPosition.AddLookAtTarget(wireFrameMonsterVector);
  cameraPosition.AddLookAtTarget(triangleFans);
}

void draw()
{
  background(50);
  perspective(radians(50.0f), width/(float)height, 0.1, 1000);
  cameraPosition.Update();

  for (float i = -100; i < 100; i++) //Makes the grid
  {
    stroke(255);
    if (i % 10 == 0)
    {
      line(-100, 0, i, 100, 0, i);  //line(x1, y1, z1, x2, y2, z2)
      line(i, 0, -100, i, 0, 100);
    }
  }
  callShapes(); //Calls all the shapes to be drawn

  polygon(60, 0, 20); //Call the two triangle fans 
  polygon(40, 0, 6);
}

void polygon(float x, float y, int npoints) {
  float angle = 360 / npoints;
  beginShape(TRIANGLE_FAN);
  colorMode(HSB);
  for (float i = 0; i < 360; i += angle)
  {
    stroke(0);
    float sx = x + cos(radians(i)) * 10;
    float sy = y + sin(radians(i)) * 10;
    fill(i, 360, 360);
    vertex(sx, sy);
  }
  endShape();
  colorMode(RGB);
}

void mouseWheel(MouseEvent event) //Detect if the mousewheel has been moved, and calls Zoom() to adjust the radius level accordingly
{
  float e = event.getCount();
  cameraPosition.Zoom(e);
}

void keyPressed()
{
  if (key == 32)
  {
    spaceBarCount++;
    if (spaceBarCount == 6)
    {
      spaceBarCount = 0;
    }
    cameraPosition.CycleTarget(spaceBarCount);
  }
}

void callShapes() //This function calls all of the shapes to be drawn
{
  //Tiny cube
  pushMatrix();
  translate(110, 0, 0);
  shape(triangle1);
  shape(triangle2);
  shape(triangle3);
  shape(triangle4);
  shape(triangle5);
  shape(triangle6);
  shape(triangle7);
  shape(triangle8);
  shape(triangle9);
  shape(triangle10);
  shape(triangle11);
  shape(triangle12);
  popMatrix();

  //Medium cube
  pushMatrix();
  translate(100, 0, 0);
  scale(5, 5, 5);
  shape(triangle1);
  shape(triangle2);
  shape(triangle3);
  shape(triangle4);
  shape(triangle5);
  shape(triangle6);
  shape(triangle7);
  shape(triangle8);
  shape(triangle9);
  shape(triangle10);
  shape(triangle11);
  shape(triangle12);
  popMatrix();

  //Large rectangle
  pushMatrix();
  translate(90, 0, 0);
  scale(10, 20, 10);
  shape(triangle1);
  shape(triangle2);
  shape(triangle3);
  shape(triangle4);
  shape(triangle5);
  shape(triangle6);
  shape(triangle7);
  shape(triangle8);
  shape(triangle9);
  shape(triangle10);
  shape(triangle11);
  shape(triangle12);
  popMatrix();

  //Spawn in the half sized monster
  pushMatrix();
  scale(.5, .5, .5);
  scale(-1); //Flips the monster over cause for some reason it spawns in upside down
  shape(monster);
  popMatrix();

  //Spawn in the wireframe monster
  pushMatrix();
  scale(-1);
  translate(75, 0, 0);
  wireFrameMonster.setStrokeWeight(4.0f);
  wireFrameMonster.setStroke(true);
  wireFrameMonster.setFill(color(50, 50, 50, 0));
  shape(wireFrameMonster);
  popMatrix();
}

void makeVertices() //This function, called in setup(), prepares all the vertices/shapes for it to be drawn in draw()
{
  //Side 1
  triangle1 = createShape();
  triangle1.beginShape();
  triangle1.fill(765, 0, 130);
  triangle1.vertex(-.5, .5, .5);
  triangle1.vertex(-.5, -.5, .5);
  triangle1.vertex(.5, .5, .5);
  triangle1.endShape();
  triangle2 = createShape();
  triangle2.beginShape();
  triangle2.fill(0, 255, 0);
  triangle2.vertex(0.5, 0.5, 0.5);
  triangle2.vertex(0.5, -0.5, 0.5);
  triangle2.vertex(-0.5, -0.5, 0.5);
  triangle2.endShape();
  //Side 2
  triangle3 = createShape();
  triangle3.beginShape();
  triangle3.fill(255, 0, 0);
  triangle3.vertex(-0.5, 0.5, 0.5);
  triangle3.vertex(-0.5, -0.5, 0.5);
  triangle3.vertex(-0.5, -0.5, -0.5);
  triangle3.endShape();
  triangle4 = createShape();
  triangle4.beginShape();
  triangle4.fill(255, 255, 0);
  triangle4.vertex(-0.5, -0.5, -0.5);
  triangle4.vertex(-0.5, 0.5, -0.5);
  triangle4.vertex(-0.5, 0.5, 0.5);
  triangle4.endShape();
  //Side 3
  triangle5 = createShape();
  triangle5.beginShape();
  triangle5.fill(148, 0, 211);
  triangle5.vertex(0.5, -0.5, -0.5);
  triangle5.vertex(0.5, 0.5, -0.5);
  triangle5.vertex(-0.5, -0.5, -0.5);
  triangle5.endShape();
  triangle6 = createShape();
  triangle6.beginShape();
  triangle6.fill(255, 127, 0);
  triangle6.vertex(0.5, 0.5, -0.5);
  triangle6.vertex(-0.5, -0.5, -0.5);
  triangle6.vertex(-0.5, 0.5, -0.5);
  triangle6.endShape();
  //Side 4
  triangle7 = createShape();
  triangle7.beginShape();
  triangle7.fill(0, 0, 255);
  triangle7.vertex(0.5, 0.5, 0.5);
  triangle7.vertex(0.5, -0.5, 0.5);
  triangle7.vertex(0.5, -0.5, -0.5);
  triangle7.endShape();
  triangle8 = createShape();
  triangle8.beginShape();
  triangle8.fill(255, 127, 0);
  triangle8.vertex(0.5, 0.5, 0.5);
  triangle8.vertex(0.5, -0.5, -0.5);
  triangle8.vertex(0.5, 0.5, -0.5);
  triangle8.endShape();
  //Side 5 (top)
  triangle9 = createShape();
  triangle9.beginShape();
  triangle9.fill(0, 255, 0);
  triangle9.vertex(-0.5, -0.5, 0.5);
  triangle9.vertex(-0.5, -0.5, -0.5);
  triangle9.vertex(0.5, -0.5, 0.5);
  triangle9.endShape();
  triangle10 = createShape();
  triangle10.beginShape();
  triangle10.fill(75, 0, 130);
  triangle10.vertex(-0.5, -0.5, -0.5);
  triangle10.vertex(0.5, -0.5, -0.5);
  triangle10.vertex(0.5, -0.5, 0.5);
  triangle10.endShape();
  //Side 6 (bottom)
  triangle11 = createShape();
  triangle11.beginShape();
  triangle11.fill(255, 0, 0);
  triangle11.vertex(-0.5, 0.5, 0.5);
  triangle11.vertex(-0.5, 0.5, -0.5);
  triangle11.vertex(0.5, 0.5, 0.5);
  triangle11.endShape();
  triangle12 = createShape();
  triangle12.beginShape();
  triangle12.fill(255, 255, 0);
  triangle12.vertex(-0.5, 0.5, -0.5);
  triangle12.vertex(0.5, 0.5, -0.5);
  triangle12.vertex(0.5, 0.5, 0.5);
  triangle12.endShape();
}
