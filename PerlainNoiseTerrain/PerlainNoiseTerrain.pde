int cols, rows;
int scl = 20; //scale
int w = 600;
int h = 600;   
float [][] terrain;
float flying = 0;
void setup(){
 size(600,600,P3D); //P3D sets up a 3D environment 
  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];
  float yoff = flying;
  for(int y =0; y < rows; y++){
   beginShape(TRIANGLE_STRIP);
   float xoff = 0;
  for(int x = 0; x < cols; x++){ 
     terrain[x][y] = map(noise(x,y),0,1,-100,100);
     xoff +=.1;
   }
   yoff +=.1;
  }
}

void draw(){
 background(0);
 stroke(random(255), random(255), random(255));;
 noFill();
 translate(width/2,height/2); //make everything relative to the middle corrdinates of the window
 rotateX(PI/3); //rotate the plane along the X axis by 60 degrees
 translate(-width/2,-height/2); //Flip the image 180 degrees so that you can see it correctly    
 for(int y =0; y < rows-1; y++){
   beginShape(TRIANGLE_STRIP);
  for(int x = 0; x < cols; x++){
     vertex(x*scl,y*scl,terrain[x][y]);
     vertex(x*scl,(y+1)*scl,terrain[x][y+1]);
   } 
    endShape();
 }

}    


// perlin noise is just a smooth distribution of random values
//
//Use a triangular mesh strip then we are going to extrude some of them so that it looks like a mountain a key variable value is going to be what is the height and width of those squares
