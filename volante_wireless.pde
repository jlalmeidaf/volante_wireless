// Controlling a servo position using a potentiometer (variable resistor) 
// by Michal Rinott <http://people.interaction-ivrea.it/m.rinott> 

#include <Servo.h> 
 
Servo myservo;  // create servo object to control a servo 
 
int potpin = 0;  // analog pin used to connect the potentiometer
//int val;    // variable to read the value from the analog pin 
int grau[3] = {0,0,0};
void setup() 
{ 
  Serial.begin(9600);
  myservo.attach(11);  // attaches the servo on pin 9 to the servo object 
  Serial.print("vai");
} 

void loop() 
{ 
  int val = 0, i = 2;
   
  if (Serial.available()) {
    for(int j = 0; j < 3; j++){
      grau[j] = 0;
    }
    while (Serial.available() > 0) {
        val = Serial.read();
        val = val - '0';
        grau[i] = val;
        i--;
    }
    if(i == 0) {
     grau[0] = grau[1];
     grau[1] = grau[2];
     grau[2] = 0;
    }
    
  }
  int valor_grau = 0;
  valor_grau =  grau[0]*pow(10,0)+ grau[1]*pow(10,1)+ grau[2]*pow(10,2);
/*  for(int k=0; k<3; k++){

     valor_grau = valor_grau + grau[k]*pow(10,k);
  }
*/
  Serial.print(valor_grau);
  Serial.print("\n");
  
  myservo.write(valor_grau);                  // sets the servo position according to the scaled value 
  delay(150);                           // waits for the servo to get there 
} 

