/*
* IoT Hub Raspberry Pi C Blink - Microsoft Sample Code - Copyright (c) 2016 - Licensed MIT
*/

#include <stdio.h>
#include <stdbool.h>
#include <wiringPi.h>
#include <wiringPiSPI.h>

extern int setenv(const char *, const char *, int);

const int MAX_BLINK_TIMES = 20;
const int RED_LED_PIN = 7;

int main(int argc, char *argv[])
{
    // Below line of code is for debugging only.
    // GPIO access requires sudo privilege. Setting environment variable WIRINGPI_GPIOMEM
    // to 1 can bypass this sudo requirement.
    setenv("WIRINGPI_GPIOMEM", "1", 1);

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
