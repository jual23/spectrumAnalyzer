import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput song;
FFT fft;
 
int maxband = 100;
 
 
void setup()
{
  size(1366, 768);

  minim = new Minim(this);
  song = minim.getLineIn();
  fft = new FFT(1024, song.sampleRate());
 
}
 
 

void draw()
{
  
  
 
  background(255);
  fft.forward(song.mix);
  stroke(10,200, 255, 108);
  strokeWeight(2);
  text (maxband,10,20);

int in = 0;

  for(int i = 0; i <= maxband;i++)
  {
 
    stroke(21,237, 140, 108);fill (50,179, 74, 255);
    if (fft.getBand(i) > 20) {stroke(219,15, 182, 108); fill (219,15, 182, 255);}
    if (fft.getBand(i) >45) {stroke(219,15, 15, 108); fill (219,15, 15, 255);}
                
                       
rect (in, 680,(width/maxband), -fft.getBand(i)*8);
in = in + (width/maxband);
 }
fill (0); 
  
  
in = 0 ; 
if ( maxband <= 100)
{
for(int i = 0; i < maxband;i++)  

{
int x = (2*in +(width/maxband))/2;     
  int y = 700;
  
  pushMatrix();
  translate(x,y);
  rotate(PI/2);
  translate(-x,-y);
  text(fft.indexToFreq (i), x,y);
  popMatrix(); 
  
  
in = in + (width/maxband);

}
}



else if (maxband > 100 && maxband <= 200)
{

for(int i = 0; i < maxband;i=i+5)  

{
  
int x = in +(width/maxband);     
  int y = 700;
  
  pushMatrix();
  translate(x,y);
  rotate(PI/2);
  translate(-x,-y);
  text(fft.indexToFreq (i), x,y);
  popMatrix(); 


  
in = in + (width/maxband)*5;

}
}


else if (maxband > 200 && maxband <= 300)
{
  for(int i = 0; i < maxband;i=i+10)  

{

int x = in +(width/maxband);     
  int y = 700;
  
  pushMatrix();
  translate(x,y);
  rotate(PI/2);
  translate(-x,-y);
  text(fft.indexToFreq (i), x,y);
  popMatrix(); 


  
in = in + (width/maxband)*10;
}
}

else if (maxband > 300 && maxband <= 400)
{
 for(int i = 0; i < maxband;i=i+15)  

{ 
  

int x = in +(width/maxband);     
  int y = 700;
  
  pushMatrix();
  translate(x,y);
  rotate(PI/2);
  translate(-x,-y);
  text(fft.indexToFreq (i), x,y);
  popMatrix();  
  
  
in = in + (width/maxband)*15;
}
}


else if (maxband > 400 && maxband <= 500)
{
 for(int i = 0; i < maxband;i=i+20)  

{ 
  
int x = in +(width/maxband);     
  int y = 700;
  
  pushMatrix();
  translate(x,y);
  rotate(PI/2);
  translate(-x,-y);
  text(fft.indexToFreq (i), x,y);
  popMatrix();  
  
  
in = in + (width/maxband)*20;
}
}



}  



void stop() {
  song.close();
  minim.stop();

  super.stop();
}




void keyPressed() {

 if (keyPressed) {
    if (key == 'w' || key == 'W') {
      if (maxband < 500) {maxband = maxband + 50;}
        else { maxband = maxband;}
          
    }

 if (key == 's' || key == 'S') {

   if (maxband >= 100) {maxband = maxband - 50;}
   else { maxband = maxband;} 
      
    }


 }
   
}  


