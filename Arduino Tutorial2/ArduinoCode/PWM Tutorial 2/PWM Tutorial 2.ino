void setup()
{

  /* add setup code here */
	//pinMode(7, OUTPUT);
	analogReference(DEFAULT);
	Serial.begin(9600);
}

void loop()
{
	int value;

  /* add main program code here */
	value = analogRead(0);
	//Serial.println(value);
	value = map(value, 0, 1023, 0, 255);
	value = constrain(value, 0, 255);
	analogWrite(7, value);
	Serial.println(value);
}