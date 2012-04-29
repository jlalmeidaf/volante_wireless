// Controlling a servo position using a potentiometer (variable resistor) 
// by Michal Rinott <http://people.interaction-ivrea.it/m.rinott> 

#include <Servo.h> 
 
Servo myservo;  // create servo object to control a servo 
 
int potpin = 0;  // analog pin used to connect the potentiometer
int val;    // variable to read the value from the analog pin 
 
void setup() 
{ 
  Serial.begin(9600);
  myservo.attach(11);  // attaches the servo on pin 9 to the servo object 
  Serial.print("vai");
} 
 
void loop() 
{ 
  int grau[3] = {-1,-1,-1};
  int i = 0;
  while (Serial.available() > 0) {
      grau[i] = Serial.read();
      i++;
  }
  int grau_verdadeiro = 0;
  for(i = 2; i >= 0; i--) {
    if (grau[i] != -1) {
      grau_verdadeiro = grau_verdadeiro + pow(10,2)*grau[i];
    }
  }
  char* str = "";

  Serial.print(grau_verdadeiro);
  Serial.print("\n");
  
  myservo.write(val);                  // sets the servo position according to the scaled value 
  delay(150);                           // waits for the servo to get there 
} 
