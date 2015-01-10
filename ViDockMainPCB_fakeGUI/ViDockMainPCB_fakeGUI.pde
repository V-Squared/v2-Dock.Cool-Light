import processing.serial.*;
import controlP5.*;

ControlP5 cp5;
ColorPicker cp;    //The Color Picker
ControlTimer timer;  //The Timer
Textlabel timerLable;  //The lable for the timer to show the time
//Slider slider;

//The parameter about the GUI
int topInterstice=0;
int buttonNum=4;
int topButtonWidth=70;
int topButtonHeight=20;
int topButtonGap=2;
//Color Picker parameter
int colorPickerPositionX=60;
int colorPickerPositionY=10;
//Timer parameter
int timerPositionX=300;
int timerPositionY=30;
//Slider parameter
int sliderValue = 255;
int sliderPositionX=80;
int sliderPositionY=100;


color bgColor =color(20);

void setup(){
  size(360,500);
  frameRate(30);
  background(bgColor);
  noStroke();
  
  cp5 =new ControlP5(this);
  
  //Initilize the timer and the timerLable
  timer =new ControlTimer();
  timer.setSpeedOfTime(1);
  
  timerLable =new Textlabel(cp5,"--",100,100);

  //The textArea showed in Custom tabs
  Textarea customTextArea;
     
 Group pLg1 = cp5.addGroup("pLg1")    //Page Light Group 1
      .setPosition(0,50)
      .setWidth(360)
      .setBackgroundHeight(140)
      .setLabel("Color control")
      .setBackgroundColor(color(255,50));
      
         cp =cp5.addColorPicker("picker")
               .setPosition(colorPickerPositionX,colorPickerPositionY)
               .setColorValue(color(125,125,125,125))
               .setGroup(pLg1); //To set the initinal Value of the Color Picker,which can be used many time during the running processing.
               
         cp5.getTooltip()
           .setColorBackground(150)
           .setColorLabel(100)
           .setPositionOffset(10,10)
           .setWidth(50)
           .register("picker"," Choose your color.")
           .setDelay(100)
           ;
      
      //Setup the slider
        cp5.addSlider("Brightness")
           .setPosition(sliderPositionX,sliderPositionY)
           .setSize(200,20)
           .setRange(0,200)
           .setValue(128)
           .setGroup(pLg1)
           ;
           
           
     cp5.getTooltip()
       .setColorBackground(150)
       .setColorLabel(100)
       .setPositionOffset(10,10)
       .setWidth(50)
       .register("Brightness"," Brightness Control.")
       .setDelay(100)
       ;

Group pLg2 = cp5.addGroup("pLg2")
                .setPosition(0,240)
                .setWidth(360)
                .setBackgroundHeight(50)
                .setBackgroundColor(color(255,50))
                .setLabel("On/Off");
                
      cp5.addButton("Front")
         .setValue(0)
         .setPosition(40,10)
         .setSize(50,30)
         .setGroup(pLg2);  
      cp5.addButton("Top")
         .setValue(0)
         .setPosition(160,10)
         .setSize(50,30)
         .setGroup(pLg2);
      cp5.addButton("Brag")
         .setValue(0)
         .setPosition(260,10)
         .setSize(50,30)
         .setGroup(pLg2);
         
    cp5.getTooltip()
       .setColorBackground(150)
       .setColorLabel(100)
       .setPositionOffset(10,10)
       .setWidth(50)
       .register("Front","Tun the Front light On/OFF.")
       .register("Top","Tun the Top light On/OFF.")
       .register("Brag","Tun the Brag light On/OFF.")
       .setDelay(100)
       ;
        
Group pLg3 = cp5.addGroup("pLg3")
                .setPosition(0,320)
                .setWidth(360)
                .setBackgroundHeight(100)
                .setBackgroundColor(color(255,50))
                .setLabel("Behavior");
 
     cp5.addRadioButton("TopBehavior")
        .setPosition(40,30)
        .setSize(40,20)
        .addItem("Awake",0)
        .addItem("Hotter",1)
        .setGroup(pLg3);
        
     cp5.addRadioButton("FrontBehavior")
        .setPosition(160,30)
        .setSize(40,20)
        .addItem("Asleep",0)
        .addItem("Glow Blue",1)
        .setGroup(pLg3);
        
     cp5.addRadioButton("BragBehavior")
        .setPosition(260,30)
        .setSize(40,20)
        .addItem("Powered",0)
        .addItem("Dim Red",1)
        .setGroup(pLg3);
        
Group pTg1 = cp5.addGroup("pTg1")
                .setPosition(0,50)
                .setWidth(360)
                .setBackgroundHeight(160)
                .setBackgroundColor(color(255,50))
                .setLabel("Temperture1");
                
Group pTg2 = cp5.addGroup("pTg2")
                .setPosition(0,240)
                .setWidth(360)
                .setBackgroundHeight(160)
                .setBackgroundColor(color(255,50))
                .setLabel("Temperture2");
                
//Tab Custom
  customTextArea=cp5.addTextarea("cText")
                    .setPosition(10,40)
                    .setSize(340,400)
                    .setFont(createFont("arial",18))
                    .setLineHeight(20)
                    .setColor(color(128))
                    .setColorBackground(color(255,100))
                    .setColorForeground(color(255,100))
                    .setText("This Software is available in Open Source\n"
                     +"ViDock Control application is available on GitHub."
                     +"You can pick between two IDE: Processing and Eclipse. Processing offers the much lower entry barrier."
                     +" Processing offers the much lower entry barrier. Even you never programmed before, following our Tutorials will allow you to modify ViDock Control."
                     +"Eclipse is way more powerful and meant for experienced programmers.\n"
                     +"\n"
                     +"This tab is meant to contain your functions\n"
                     +"To make adding your functions easy, just drop them onto this panel.\n"
                     +"\n"
                     +"Adding functions is easy\n"
                     +"We have complete tutorials on how to add your custom functions in software and in hardware\n"
                     +"\n"
                     +"Re-purpose existing ports\n"
                     +"ViDock I/O Board has lots of ports which you may be able to re-purpose to provide the hardware function you need: Two analog in for Thermal Sensors, 12V PWM out and Digital in for fans."
                     +"3 PWM and 2 Digital outs for Cool Lights port. Two Digital GPIO in the GPIO port (General Purpose Input Output)\n"
                     +"\n"
                     +"Add additional ports\n"
                     +"You can add a lot of additional ports easy enough thanks to the powerful Architecture of V2R, which is an Open Source Architecture based on Arduino and which makes adding additional Arduinos to an Arduino Network very easy."
                     +"An Example is the PCIe Aux Monitor board."
                     +"It connects with V2O cable to the ViDock I/O Board."
                     +"It contains its own Arduino and thus can add a lot of I/O Pins of all sorts."
                     +"We have complete tutorials on how to add more boards and how to access them through the ViDock Control Software.\n"
                      );

/*
Create the 5 tabs and move the controller to the tabs accordingly
*/

     cp5.tab("default")
        .setLabel("Overview")    //Overview Tab
        .setWidth(60)
        .setHeight(25)
        .setId(0)
        ;
        
      cp5.tab("Light")
        .setLabel("Light")      //Light Tab
        .setWidth(60)
        .setHeight(25)
        .setId(1)
        ;
        
      cp5.tab("Temperature")
        .setLabel("Temperature")  //Temperture Tab
        .setWidth(60)
        .setHeight(25)
        .setId(2)
        ;
        
     cp5.tab("Power")
        .setLabel("Power")        //Power Tab
        .setWidth(60)
        .setHeight(25)
        .setId(3)
        ;
        
     cp5.tab("Custom")
        .setLabel("Custom")      //Custom Tab
        .setWidth(60)
        .setHeight(25)
        .setId(4)
        ;
        
    cp5.tab("Config")
        .setLabel("Config")      //Configuration Tab
        .setWidth(20)
        .setHeight(25)
        .setId(5)
        .hide()
        ;
        
      cp5.group("pLg1").moveTo("Light");
      cp5.group("pLg2").moveTo("Light");
      cp5.group("pLg3").moveTo("Light");
      cp5.group("pTg1").moveTo("Temperature");
      cp5.group("pTg2").moveTo("Temperature");
      
      cp5.group("cText").moveTo("Custom");
      
        

}
//The ControlP5 control Even
public void controlEvent(ControlEvent theEvent) {
  //println(theEvent.getController().getName());
  
  if(theEvent.isFrom(cp)) {      //If the Event comes from Color Picker,do Print out the selected color
    int r = int(theEvent.getArrayValue(0));
    int g = int(theEvent.getArrayValue(1));
    int b = int(theEvent.getArrayValue(2));
    int a = int(theEvent.getArrayValue(3));
    color col = color(r,g,b,a);
    println("event\talpha:"+a+"\tred:"+r+"\tgreen:"+g+"\tblue:"+b+"\tcol"+col);
  }
  
}
//Key press detectived
void keyPressed() {
  switch(key) {
    case('1'):    //Open the color Picker
    cp.open();    
    break;
    case('2'):    //Close the color Picker
    cp.close();
    break;
  }
}
// color information from ColorPicker 'picker' are forwarded to the picker(int) function
void picker(int col) {
  println("picker\talpha:"+alpha(col)+"\tred:"+red(col)+"\tgreen:"+green(col)+"\tblue:"+blue(col)+"\tcol"+col);
}

//The function relatived to the top Buttons
public void Overview(int theValue){
  println("Overview"+theValue);
}
public void Light(int theValue){
  println("Light"+theValue);
}
public void Temperture(int theValue){
  println("Temperture"+theValue);
}
public void Power(int theValue){
  println("Power"+theValue);
}
public void Custom(int theValue){
  println("Custom"+theValue);
}

void draw(){
  background(bgColor);
  timerLable.setValue(timer.toString());
  timerLable.draw(this);
  //timerLable.setPosition(timerPositionX,timerPositionY);
  timerLable.setPosition(timerPositionX,timerPositionY);
}

