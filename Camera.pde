class Camera //Simple orbit camera which rotates around, and looks at, a specific point x, y, z
{
  float x = 0;
  float y = 0;
  float z = 0;
  float derivedX = 0;
  float derivedY = 0;
  float derivedZ = 0;
  float radius = 80;
  float eyeX = 0.0f;
  float eyeY = 0.0f;
  float eyeZ = 0.0f;
  float centerX = 0.0f;
  float centerY = 0.0f;
  float centerZ = 0.0f;
  float theta = 0.0f;
  float phi = 0.0f;
  float lookAtTargetX = 0;
  float lookAtTargetY = 0;
  float lookAtTargetZ = 0;
  ArrayList<PVector> objectArray = new ArrayList<PVector>();

  void Update() //Called every frame from the draw() function, calculates values to pass to the camera() function
  {
    
    //Make the phi and theta
    phi = map(mouseX, 0, width-1, 0, 360);
    theta = map(mouseY, 0, height-1, 0, 179);
    
    //Calculate the derived x, y, and z values
    derivedX = radius * cos(phi) * sin(theta);
    derivedY = radius * cos(theta);
    derivedZ = radius * sin(theta) * sin(phi);
    
    
    //Assign my cameraPositions
    cameraPosition.x = lookAtTargetX + derivedX;
    cameraPosition.y = lookAtTargetY + derivedY;
    cameraPosition.z = lookAtTargetZ + derivedZ;
    
    //Assign the Eye variables that will be used in calling camera()
    eyeX = cameraPosition.x;
    eyeY = cameraPosition.y;
    eyeZ = cameraPosition.z;
    
    //Assign the center variables that will be used in calling camera()
    centerX = lookAtTargetX;
    centerY = lookAtTargetY;
    centerZ = lookAtTargetZ;
    
    //Call camera
    camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, 0.0, 1.0, 0.0); //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
    
    //Need to calculate camera(eyeX, eyeY, eyeZ, centerX, centerY, and centerZ) in this function
    //eyeX, eyeY, and eyeZ will just be the current location of the camera in the 3d plane
    //However, eyeX, eyeY, eyeZ will be calculated from:
    //derivedX = R * cos(ϕ) * sin(ϴ)
    //derivedY = R * cos(ϴ)
    //derivedZ = R * sin(ϴ) * sin(ϕ)
    //cameraPosition.x = lookatTarget.x + derivedX;
    //cameraPosition.y = lookatTarget.y + derivedY;
    //cameraPosition.z = lookatTarget.z + derivedZ;
    //eyeX = cameraPosition.x
    //eyeY = cameraPosition.y
    //eyeZ = cameraPosition.z
    //And centerX, centerY, and centerZ will be calculated from:
    //centerX = lookatTarget.x
    //centerY = lookatTarget.y
    //centerZ = lookatTarget.z
    //centerX, centerY, and centerZ will change when a person hits space bar for the camera to look at a different model, cycleTarget will control those values, and update calls camera with them
  }

  void CycleTarget(int spaceBarCount) //Move to the next target in the list, wrapping around to the first, once the end is reached
  {
    lookAtTargetX = objectArray.get(spaceBarCount).x;
    lookAtTargetY = objectArray.get(spaceBarCount).y;
    lookAtTargetZ = objectArray.get(spaceBarCount).z;
  }

  void Zoom(float mouseWheelCount) //Move toward or away from the look at target by using the scroll wheel 
  {
      if (mouseWheelCount == 1.0)
      {
        radius = radius + 2;
      }
      else if (mouseWheelCount == -1.0)
      {
        radius = radius - 2;
      }
  }
  
   void AddLookAtTarget(PVector targetVector) //Add a target to the list of positions to cycle through
  {
    objectArray.add(targetVector);
  }
}
