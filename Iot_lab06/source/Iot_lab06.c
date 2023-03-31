#include <stdio.h>
#include "board.h"
#include "peripherals.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "LPC55S69_cm33_core0.h"
#include "fsl_debug_console.h"
#include "stdbool.h"
#define BUFFER_SIZE 32
#define RED 0
#define GREEN 1
#define BLUE 2
uint8_t ringBuffer[BUFFER_SIZE]={0};
uint8_t data[BUFFER_SIZE]={0};
volatile bool readReady = false;
volatile uint32_t wr=0, rd=0;
uint32_t k=0;
volatile uint32_t g_systickCounter;
/* FLEXCOMM2_IRQn interrupt handler */
void FLEXCOMM2_FLEXCOMM_IRQHANDLER(void) {
	/* Place your code here */
	if(kUSART_RxFifoNotEmptyFlag & USART_GetStatusFlags(FLEXCOMM2_PERIPHERAL)){
		ringBuffer[wr++] = USART_ReadByte(FLEXCOMM2_PERIPHERAL);
		wr %= BUFFER_SIZE;
	}
}
void SysTick_Handler(void) {
	if (g_systickCounter) {
		g_systickCounter--;
	}
}
void delay_ms(uint32_t n) {
	g_systickCounter = n;
	while (g_systickCounter)
		;
}
uint32_t ringBufferRead(uint8_t *d) {
	uint32_t s = 0;
	if(rd != wr) {
		delay_ms(5);
		while (rd != wr) {
			d[s++] = ringBuffer[rd++];
			rd %= BUFFER_SIZE;
		}
	}
	return s;
}
void sendText(char *d){
	int s = strlen(d);
	USART_WriteBlocking(FLEXCOMM2_PERIPHERAL, (uint8_t*)d, s);
}
/*
 * @brief Application entry point.
 */
void blueLed(bool isOn){
	if(isOn){
		 GPIO_PinWrite(BOARD_INITLEDSPINS_LED_BLUE_GPIO, BOARD_INITLEDSPINS_LED_BLUE_PORT, BOARD_INITLEDSPINS_LED_BLUE_PIN, 0);
	}else{
		 GPIO_PinWrite(BOARD_INITLEDSPINS_LED_BLUE_GPIO, BOARD_INITLEDSPINS_LED_BLUE_PORT, BOARD_INITLEDSPINS_LED_BLUE_PIN, 1);
	}
}
void redLed(bool isOn){
	if(isOn){
			 GPIO_PinWrite(BOARD_INITLEDSPINS_LED_RED_GPIO, BOARD_INITLEDSPINS_LED_RED_PORT, BOARD_INITLEDSPINS_LED_RED_PIN, 0);
		}else{
			 GPIO_PinWrite(BOARD_INITLEDSPINS_LED_RED_GPIO, BOARD_INITLEDSPINS_LED_RED_PORT, BOARD_INITLEDSPINS_LED_RED_PIN, 1);
		}
}
void greenLed(bool isOn){
	if(isOn){
			 GPIO_PinWrite(BOARD_INITLEDSPINS_LED_GREEN_GPIO, BOARD_INITLEDSPINS_LED_GREEN_PORT, BOARD_INITLEDSPINS_LED_GREEN_PIN, 0);
		}else{
			 GPIO_PinWrite(BOARD_INITLEDSPINS_LED_GREEN_GPIO, BOARD_INITLEDSPINS_LED_GREEN_PORT, BOARD_INITLEDSPINS_LED_GREEN_PIN, 1);
		}
}
void turnOnLed(uint8_t led,bool isOn){
	switch(led){
	case RED:
		redLed(isOn);
	case GREEN:
		greenLed(isOn);
	case BLUE:
		blueLed(isOn);
	}
}
int main(void) {
	/* Init board hardware. */
	BOARD_InitBootPins();
	BOARD_InitBootClocks();
	BOARD_InitBootPeripherals();
#ifndef BOARD_INIT_DEBUG_CONSOLE_PERIPHERAL
	/* Init FSL debug console. */
	BOARD_InitDebugConsole();
#endif
	SysTick_Config(SystemCoreClock / 1000U); // 1 ms
	PRINTF("Run\r\n");
	char turnOffMess[] = "OK+LEDx:OFF";
	while(1) {
		k= ringBufferRead(data);
		if(k > 0) {
			bool statusRed=false;
			bool statusBlue=false;
			bool statusGreen=false;
			data[k] = 0;
			if(strcmp((char*)data, "OK+CONN")==0) {
				PRINTF("Connected\r\n");
			}
			if(strcmp((char*)data, "OK+LOST")==0) {
				PRINTF("Disconnect\r\n");
			}
			if(strcmp((char*)data, "LEDR+ON")==0) {
				statusRed=true;
				turnOffMess[6]='R';
				sendText("OK+LEDR:ON");
			}
			if(strcmp((char*)data, "LEDB+ON")==0) {
				statusBlue = true;
				turnOffMess[6]='B';
				sendText("OK+LEDB:ON");
			}
			if(strcmp((char*)data, "LEDG+ON")==0) {
				statusGreen = true;
				turnOffMess[6]='G';
				sendText("OK+LEDG:ON");
			}
			if(!statusRed && !statusBlue && !statusGreen){
				sendText(turnOffMess);
			}
			turnOnLed(RED,statusRed);
			turnOnLed(GREEN,statusGreen);
			turnOnLed(BLUE,statusBlue);
			k=0;
		}
	}
	return 0 ;
}
