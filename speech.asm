const int LED_PIN_1 = 2; // For Lights
const int LED_PIN_2 = 3; // For Fan (simulated)

void setup() {
  // Initialize LED pins as output
  pinMode(LED_PIN_1, OUTPUT);
  pinMode(LED_PIN_2, OUTPUT);

  // Initialize serial communication at 9600 baud rate
  Serial.begin(9600);
  Serial.println("Ready to receive commands...");

  // Ensure LEDs are off at start
  digitalWrite(LED_PIN_1, LOW);
  digitalWrite(LED_PIN_2, LOW);
}

void loop() {
  // Check if data is available in the serial buffer
  if (Serial.available() > 0) {
    // Read the incoming serial data until a newline character is received
    String command = Serial.readStringUntil('\n');
    command.trim(); // Remove any leading/trailing whitespace

    Serial.print("Received command: ");
    Serial.println(command);

    // Process commands
    if (command == "lights_on") {
      digitalWrite(LED_PIN_1, HIGH);
      Serial.println("Lights ON");
    } else if (command == "lights_off") {
      digitalWrite(LED_PIN_1, LOW);
      Serial.println("Lights OFF");
    } else if (command == "fan_on") {
      digitalWrite(LED_PIN_2, HIGH);
      Serial.println("Fan ON");
    } else if (command == "fan_off") {
      digitalWrite(LED_PIN_2, LOW);
      Serial.println("Fan OFF");
    } else if (command == "stop") {
      digitalWrite(LED_PIN_1, LOW);
      digitalWrite(LED_PIN_2, LOW);
      Serial.println("All devices OFF");
    } else {
      Serial.println("Unknown command.");
    }
  }
}

 
