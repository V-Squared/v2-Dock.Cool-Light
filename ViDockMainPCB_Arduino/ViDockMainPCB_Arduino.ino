
#define RED_PIN     9    //define the RGB pin connect to the Arduino
#define BLUE_PIN    10
#define GREEN_PIN   11
#define TOP_PIN     3    //define the Top, Rear,Brag pin connect to Arduino
#define REAR_PIN   5
#define BRAG_PIN    6

#define NUM_BYTES   7

char led_color[NUM_BYTES] = {0,0,0,0,0,0,1 };
unsigned char R, G, B;
unsigned char L1,L2,L3;
unsigned char Mode=0;

void RGB(unsigned char r, unsigned char g, unsigned char b) {    //Send the value of RGB color to the LED
  analogWrite(RED_PIN, map(r,0,255,255,0)); 
  analogWrite(GREEN_PIN, map(g,0,255,255,0));
  analogWrite(BLUE_PIN, map(b,0,255,255,0)); 
  
}

void Brightness(unsigned char a,unsigned char b, unsigned char c){
    a=map(a,0,255,255,0);
    b=map(b,0,255,255,0);
    c=map(c,0,255,255,0);
    analogWrite(TOP_PIN,a);
   analogWrite(REAR_PIN,b);
   analogWrite(BRAG_PIN,c);
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(TOP_PIN,OUTPUT);
  pinMode(REAR_PIN,OUTPUT);
  pinMode(BRAG_PIN,OUTPUT);
  
  digitalWrite(TOP_PIN,LOW);
  digitalWrite(REAR_PIN,LOW);
  digitalWrite(BRAG_PIN,LOW);
  RGB(0,0,0);
}



void loop() {

  while(Serial.available() == 0);
    Serial.readBytes(led_color, NUM_BYTES);

    if(led_color[6]==1){
      R = (unsigned char)(led_color[0]);
    G = (unsigned char)(led_color[1]);
    B = (unsigned char)(led_color[2]);
      RGB(R, G, B);
    }else {
        //Brightness control
        L1=(unsigned char)(led_color[3]);
        L2=(unsigned char)(led_color[4]);
        L3=(unsigned char)(led_color[5]);
        Brightness(L1,L2,L3);
    }
 

/*

    for(int i=10;i<255;i=i+20){
      for(int j=10;j<255;j=j+20){
        for(int k=10;k<255;k=k+20){
            RGB(i,j,k);
            Brightness(k,255-k,k);
            delay(40);
        }
      }
    }
*/    
    
    /*
    RGB(120,200,40);
    for(int x=0;x<255;x++){ 
        Brightness(x,255-x,x);
        delay(20);
    }*/
   
}
