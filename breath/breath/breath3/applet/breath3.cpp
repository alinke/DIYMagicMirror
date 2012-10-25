#include "WaveHC.h"
#include "WaveUtil.h"

#include "WProgram.h"
void setup();
void loop();
void speaknum(char c);
void error_P(const char *str);
void sdErrorCheck(void);
void playcomplete(char *name);
void playfile(char *name);
SdReader card;    // This object holds the information for the card
FatVolume vol;    // This holds the information for the partition on the card
FatReader root;   // This holds the information for the volumes root directory
FatReader file;   // This object represent the WAV file for a pi digit or period
WaveHC wave;      // This is the only wave (audio) object, since we will only play one at a time
/*
 * Define macro to put error messages in flash memory
 */
#define error(msg) error_P(PSTR(msg))

 // set pin numbers:
const int PotPin =  4;              // pin number of the pot
const int AlcoholSensorPin = 1;     // pin number of the alcohol sensor

const int buttonPin = 16;          // the pin that the pushbutton is attached to
const int readyLEDPin = 17;
//const int blowLEDPin = 18;
//const int waitLEDPin = 19;

const int level0LEDPin = 6;
const int level1LEDPin = 7;
const int level2LEDPin = 8;
const int level3LEDPin = 9;
const int LEDonTime = 5000;        // how long to leave the LEDs on after the breathalyzer has finished, then turn off after this time

const int baseline = 100;   
const int baselineDifference = 100;
const int blowTime = 5000; //number of milliseconds for the user to blow
const int level1 = 100;  //few drinks threwhold
const int level2 = 200;  //buzzed threshold
const int level3 = 300;  //drunk threshold

int AlcoholSensorValue = 0;  // variable to store the value coming from the sensor
int AlcoholSensorDynamicBaseline = 0;  // variable to store the value coming from the sensor
int initialPot = 0;     //initial value of the pot to set the mode initially
int currentPot = 0;    // current value of the pot
int changePot = 0;             //used for the Potchange
int buttonPushCounter = 0;   // counter for the number of button presses
int initialButtonState = 0;         // initial state of the switch
int currentButtonState = 0;     // current state of the switch
int playingFlag = 0;         // is the breathalyzer working, if yes then need to wait until its done before starting again
int mode = 0;               //mode for the character sounds
int range = 0;
int ready = 0;

void setup() {
  
    // set up Serial library at 9600 bps
  Serial.begin(9600);           
  
  if (!card.init()) {
    error("Card init. failed!");
  }
  if (!vol.init(card)) {
    error("No partition!");
  }
  if (!root.openRoot(vol)) {
    error("Couldn't open dir");
  }

  PgmPrintln("Files found:");
  root.ls();
  
  // declare the Pins
  pinMode(readyLEDPin, OUTPUT); 
 // pinMode(blowLEDPin, OUTPUT); 
 // pinMode(waitLEDPin, OUTPUT); 
  pinMode(level0LEDPin, OUTPUT); 
  pinMode(level1LEDPin, OUTPUT); 
  pinMode(level2LEDPin, OUTPUT); 
  pinMode(level3LEDPin, OUTPUT); 
  pinMode(buttonPin, INPUT); 
  
  initialButtonState = digitalRead(buttonPin);
  Serial.println("initial switch value= " + initialButtonState);
  
  ///***** set the char mode based on the pot position
  initialPot = analogRead(PotPin);  
  Serial.println("initial pot value= " + initialPot);
   
  range = map(initialPot, 0, 1024, 0, 3);
  Serial.println("initial pot range is: " + range);
  switch (range) {
  case 0:    // your hand is on the sensor
    mode = 0;
    Serial.println("initial mode set to 0: princess");
    break;
  case 1:    // your hand is close to the sensor
    mode = 1;
    Serial.println("initial mode set to 1: pirate");
    break;
  case 2:    // your hand is a few inches from the sensor
    mode = 2;
    Serial.println("initial mode set to 2: halloween");
    break;
  case 3:    // your hand is nowhere near the sensor
    mode = 3;
    Serial.println("initial mode set to 3: insult");
    break;
  }   
}

void loop() {

  /// ******** need to see if the alcohol sensor is ready / resetted *****
  AlcoholSensorValue = analogRead(AlcoholSensorPin);    //get value of alcohol sensor
  delay(50); //not sure if we need this but keep for now
  Serial.println("Alcohol Sensor Value from Beginning of Loop: " + AlcoholSensorValue);
  
  int deleteme = baseline + baselineDifference;
  Serial.println("baseline + baselineDifferent= " + deleteme);
  
   if (AlcoholSensorValue < baseline + baselineDifference) {  //the baseline difference is here because the MQ-3 alcohol sensor takes awhile to reset back to the original baseline so you can use this to get close enough so you don't have to wait so long to take the next reading
     digitalWrite(readyLEDPin, HIGH);
     Serial.println("Alcohol Sensor Ready");
     ready = 1;
    } 
   else {
     digitalWrite(readyLEDPin,LOW); 
     ready = 0;
  }
  //**********************************************************************

  //************ Now check if the button was pushed **********************  
  currentButtonState = digitalRead(buttonPin);
  Serial.println("Current Switch State: " + currentButtonState);
  // compare the buttonState to its previous state
  if (initialButtonState != currentButtonState && ready == 0 && playingFlag == 0) { //if button switched and alcohol sensor ready and not already playing
      playingFlag = 1;
      buttonPushCounter++;
      Serial.println("Switch was changed and Breathalyzer started...");
      Serial.print("number of button pushes:  ");
      Serial.println(buttonPushCounter, DEC);
      
      //digitalWrite(waitLEDPin, HIGH);
      AlcoholSensorDynamicBaseline = analogRead(AlcoholSensorPin); //now lets get the baseline alcohol sensor value before the person blows
      Serial.println("alcohol sensor value before blowing, alcohol dynamic baseine: " + analogRead(AlcoholSensorPin));      
      
      switch (mode) {
              case 0:   
              playcomplete("wait0.wav");              
              break;
              case 1:     
              playcomplete("wait1.wav");      
              break;
              case 2:     
              playcomplete("wait2.wav"); 
              break;
              case 3:    
              playcomplete("wait3.wav"); 
              break;
          }    	
      delay(2000);     
      //digitalWrite(waitLEDPin, LOW);
      //digitalWrite(blowLEDPin, HIGH);
      switch (mode) {
              case 0:   
              playcomplete("blow0.wav");              
              break;
              case 1:     
              playcomplete("blow1.wav");      
              break;
              case 2:     
              playcomplete("blow2.wav"); 
              break;
              case 3:    
              playcomplete("blow3.wav"); 
              break;
          }    	
      delay(blowTime);     //default blow time is 5 seconds
      //digitalWrite(blowLEDPin, LOW);
      AlcoholSensorValue = analogRead(AlcoholSensorPin);   //now lets get the baseline alcohol sensor value after the person blows
      Serial.println("alcohol sensor value after blowing: " + analogRead(AlcoholSensorPin));   
      
      if (AlcoholSensorValue < AlcoholSensorDynamicBaseline + level1) {  //if the baseline + the level1 threshold is less, then no alcohol
      	 digitalWrite(level0LEDPin, HIGH); //turns the pin off later   
            switch (mode) {
                case 0:    // your hand is on the sensor
                Serial.println("princess mode 0 no alcohol");    
                playcomplete("nothing0.wav");              
                break;
                case 1:    // your hand is close to the sensor
                Serial.println("pirate mode 1 no alcohol");   
                playcomplete("nothing1.wav");      
                break;
                case 2:    // your hand is a few inches from the sensor
                Serial.println("pirate mode 2 no alcohol");    
                playcomplete("nothing2.wav"); 
                break;
                case 3:    // your hand is nowhere near the sensor
                Serial.println("insult mode 3 no alcohol");   
                playcomplete("nothing3.wav"); 
                break;
            }    	
      }
      
       if (AlcoholSensorValue > AlcoholSensorDynamicBaseline + level1 && AlcoholSensorValue < AlcoholSensorDynamicBaseline + level2) {
          digitalWrite(level1LEDPin, HIGH); //turns the pin off later     
           switch (mode) {
                case 0:    // your hand is on the sensor
                Serial.println("princess mode 0 few drinks");    
                playcomplete("few0.wav");              
                break;
                case 1:    // your hand is close to the sensor
                Serial.println("pirate mode 1 few drinks");   
                playcomplete("few1.wav");      
                break;
                case 2:    // your hand is a few inches from the sensor
                Serial.println("halloween mode 2 few drinks");    
                playcomplete("few2.wav"); 
                break;
                case 3:    // your hand is nowhere near the sensor
                Serial.println("insult mode 3 few drinks");   
                playcomplete("few3.wav"); 
                break;
            }    	 	
      }
      
       if (AlcoholSensorValue > AlcoholSensorDynamicBaseline + level2 && AlcoholSensorValue < AlcoholSensorDynamicBaseline + level3) {
          digitalWrite(level2LEDPin, HIGH); //turns the pin off later      	
           switch (mode) {
                case 0:    // your hand is on the sensor
                Serial.println("princess mode 0 buzzed");    
                playcomplete("buzzed0.wav");              
                break;
                case 1:    // your hand is close to the sensor
                Serial.println("pirate mode 1 buzzed");   
                playcomplete("buzzed1.wav");      
                break;
                case 2:    // your hand is a few inches from the sensor
                Serial.println("halloween mode 2 buzzed");    
                playcomplete("buzzed2.wav"); 
                break;
                case 3:    // your hand is nowhere near the sensor
                Serial.println("insult mode 3 buzzed");   
                playcomplete("buzzed3.wav"); 
                break;
            }    	 	
      }
      
      if (AlcoholSensorValue > AlcoholSensorDynamicBaseline + level3) {
          digitalWrite(level3LEDPin, HIGH); //turns the pin off later      
           switch (mode) {
                case 0:    // your hand is on the sensor
                Serial.println("princess mode 0 drunk");    
                playcomplete("drunk0.wav");              
                break;
                case 1:    // your hand is close to the sensor
                Serial.println("pirate mode 1 drunk");   
                playcomplete("drunk1.wav");      
                break;
                case 2:    // your hand is a few inches from the sensor
                Serial.println("halloween mode 2 drunk");    
                playcomplete("drunk2.wav"); 
                break;
                case 3:    // your hand is nowhere near the sensor
                Serial.println("insult mode 3 drunk");   
                playcomplete("drunk3.wav"); 
                break;
            }    	 		
      }
      
    delay(LEDonTime);  //how long to leave the LEDs on before turning them off, default 5s    
    digitalWrite(level0LEDPin, LOW);    
    digitalWrite(level1LEDPin, LOW);    
    digitalWrite(level2LEDPin, LOW);   
    digitalWrite(level3LEDPin, LOW);        
    
    initialButtonState = currentButtonState;  //set this for the next button change
    playingFlag = 0;                          //now we're done so set this so the breahtalyzer can go again
  } //**************************************************end this if statement
  
  //************ now let's check if the pot has changed  
  currentPot = analogRead(PotPin);  
  changePot = abs(currentPot - initialPot); //see if the char select knob has been turned far enough
  Serial.println("absolute pot value change is: " + changePot); //remove this later, just for debugging
  
  if (changePot > 75) {        // this means the pot knob was turned
    initialPot = currentPot;   //now reset the baseline pot value
    delay (500);
    
    range = map(analogRead(PotPin), 0, 1023, 0, 3);  //split into 4
  
    switch (range) {
    case 0:    
      if (mode !=0) {                  //don't want to change to the same mode we were already on
        //play the char select sound
        mode = 0;
        Serial.println("princess mode change 0");
        playcomplete("mode0.wav"); 
      }  
      break;
    case 1:    
      if (mode !=1) {                  //don't want to change to the same mode we were already on
        //play the char select sound
        mode = 1;
        Serial.println("pirate mode change 1");
        playcomplete("mode1.wav"); 
      }  
      break;
    case 2:    
      if (mode !=2) {                  //don't want to change to the same mode we were already on
        //play the char select sound
        mode = 2;
        Serial.println("halloween mode change 2");
        playcomplete("mode2.wav"); 
      }  
      break;
    case 3:    
      if (mode !=3) {                  //don't want to change to the same mode we were already on
        //play the char select sound
        mode = 3;
        Serial.println("insult mode change 3");
        playcomplete("mode3.wav"); 
      }  
      break;
    }   //end case statement    
  } //******************************** end pot check ******************************* 
  
  
  
  
} //end loop

/////////////////////////////////// HELPERS

char filename[13];

void speaknum(char c)  //not using this one
{
  uint8_t i=0;
  
  // copy flash string for 'period' to filename
  strcpy_P(filename, PSTR("P.WAV"));
  
  if ('0' <= c && c <= '9') {
    // digit - change 'P' to digit
    filename[0] = c;
    i = 1;
  } 
  else if (c != '.') {
    // error if not period
    return;
  }
  playcomplete(filename);
}
/*
 * print error message and halt
 */
void error_P(const char *str)
{
  PgmPrint("Error: ");
  SerialPrint_P(str);
  sdErrorCheck();
  while(1);
}
/*
 * print error message and halt if SD I/O error
 */
void sdErrorCheck(void)
{
  if (!card.errorCode()) return;
  PgmPrint("\r\nSD I/O error: ");
  Serial.print(card.errorCode(), HEX);
  PgmPrint(", ");
  Serial.println(card.errorData(), HEX);
  while(1);
}
/*
 * Play a file and wait for it to complete
 */
void playcomplete(char *name) {
  playfile(name);
  while (wave.isplaying);
  
  // see if an error occurred while playing
  sdErrorCheck();
}
/*
 * Open and start playing a WAV file
 */
void playfile(char *name) 
{
  if (wave.isplaying) {// already playing something, so stop it!
    wave.stop(); // stop it
  }
  if (!file.open(root, name)) {
    PgmPrint("Couldn't open file ");
    Serial.print(name); 
    return;
  }
  if (!wave.create(file)) {
    PgmPrintln("Not a valid WAV");
    return;
  }
  // ok time to play!
  wave.play();
}

int main(void)
{
	init();

	setup();
    
	for (;;)
		loop();
        
	return 0;
}

