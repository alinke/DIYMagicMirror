
 // set pin numbers:
const int PotPin =  0;      // pin number of the pot
const int AlcoholSensorPin = 1;     // pin number of the alcohol sensor
const int buttonPin = 2;    // the pin that the pushbutton is attached to
const int readyLEDPin = 5;
const int waitLEDPin = 7;
const int blowLEDPin = 13;
const int level0LEDPin = 6;
const int level1LEDPin = 9;
const int level2LEDPin = 10;
const int level3LEDPin = 11;

const int baseline = 100;   
const int baselineDifference = 100;
const int blowTime = 5000; //number of seconds for the user to blow
const int level1 = 100;
const int level2 = 200;
const int level3 = 300;

int AlcoholSensorValue = 0;  // variable to store the value coming from the sensor
int AlcoholSensorDynamicBaseline = 0;  // variable to store the value coming from the sensor
int PotValue = 0;    // variable to store the value coming from the sensor
int buttonPushCounter = 0;   // counter for the number of button presses
int buttonState = 0;         // current state of the button
int lastButtonState = 0;     // previous state of the button
int flag = 0;

void setup() {
  // declare the ledPin as an OUTPUT:
  pinMode(readyLED, OUTPUT); 
  pinMode(blowLED, OUTPUT); 
  pinMode(level0LED, OUTPUT); 
  pinMode(level1LED, OUTPUT); 
  pinMode(level2LED, OUTPUT); 
  pinMode(level3LED, OUTPUT); 
  pinMode(buttonPin, INPUT); 
}

void loop() {


  AlcoholSensorValue = analogRead(AlcoholSensorPin);    //get value of alcohol sensor
  
   if (AlcoholSensorValue > (baseline + baselineDifference)) {
      digitalWrite(readyLEDPin, HIGH);
    } 
    else {
      digitalWrite(readyLEDPin,LOW); 
  }
  
  
  buttonState = digitalRead(buttonPin);

  // compare the buttonState to its previous state
  if (buttonState != lastButtonState) {  //and its ready, need to add this
    // if the state has changed, increment the counter
    
      buttonPushCounter++;
      Serial.println("on");
      Serial.print("number of button pushes:  ");
      Serial.println(buttonPushCounter, DEC);
      
      digitalWrite(waitLEDPin, HIGH);
      AlcoholSensorDynamicBaseline = analogRead(AlcoholSensorPin); 
      delay(2000);     
      digitalWrite(waitLEDPin, LOW);
      digitalWrite(blowLEDPin, HIGH);
      delay(blowTime);     
      digitalWrite(blowLEDPin, LOW);
      AlcoholSensorValue = analogRead(AlcoholSensorPin); 
      
      if (AlcoholSensorValue < (AlcoholSensorDynamicBaseline + level1)) {
      	 digitalWrite(level0LEDPin, HIGH); //turns the pin off later      	
      }
      
       if (AlcoholSensorValue > (AlcoholSensorDynamicBaseline + level1)) && (AlcoholSensorValue < (AlcoholSensorDynamicBaseline + level2)) {
          digitalWrite(level1LEDPin, HIGH); //turns the pin off later      	
      }
      
       if (AlcoholSensorValue > (AlcoholSensorDynamicBaseline + level2)) && (AlcoholSensorValue < (AlcoholSensorDynamicBaseline + level3)) {
          digitalWrite(level2LEDPin, HIGH); //turns the pin off later      	
      }
      
      if (AlcoholSensorValue > (AlcoholSensorDynamicBaseline + level3)) {
          digitalWrite(level3LEDPin, HIGH); //turns the pin off later      	
      }
      
      
    // save the current state as the last state, 
    //for next time through the loop
    
    digitalWrite(level0LEDPin, LOW);    
    digitalWrite(level1LEDPin, LOW);    
    digitalWrite(level2LEDPin, LOW);   
    digitalWrite(level3LEDPin, LOW);    
    
    
    lastButtonState = buttonState;
  }
  
}