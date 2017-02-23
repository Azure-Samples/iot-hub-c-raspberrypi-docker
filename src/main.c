/*
* IoT Hub Raspberry Pi C Blink - Microsoft Sample Code - Copyright (c) 2016 - Licensed MIT
*/

#include <stdio.h>
#include <stdbool.h>
#include <wiringPi.h>
#include <wiringPiSPI.h>

const int MAX_BLINK_TIMES = 20;
const int RED_LED_PIN = 7;

int main(int argc, char *argv[])
{
    int blinkNumber = 0;

    wiringPiSetup();
    pinMode(RED_LED_PIN, OUTPUT);

    while (MAX_BLINK_TIMES > blinkNumber++)
    {
        printf("[Device] #%d Blink LED \n", blinkNumber);
        digitalWrite(RED_LED_PIN, HIGH);
        delay(100);
        digitalWrite(RED_LED_PIN, LOW);
        delay(2000);
    }

    return 0;
}
