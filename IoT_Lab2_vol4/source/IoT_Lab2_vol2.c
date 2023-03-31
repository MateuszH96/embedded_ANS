#include <stdio.h>
#include "board.h"
#include "peripherals.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "LPC55S69_cm33_core0.h"
#include "fsl_debug_console.h"
#include "wlan_mwm.h"
#include "lcd.h"
#include "back.h"
#include "cJSON.h"
#include "MCP23017.h"
/*******************************************************************************
 * Definitions
 ******************************************************************************/
/*-----------------------------------------------------------------------------
AP_SECURITY_MODE:
0 - Open
1 - WEP (Open mode)
2 - WEP (Shared mode)
3 - WPA-PSK
4 - WPA2-PSK
9 - WPA3-SAE
 ----------------------------------------------------------------------------*/
#define AP_SSID "C111"
#define AP_PASSPHRASE "abcdefabcdef987654321"
#define AP_SECURITY_MODE "4"
/*---------------------------------------------------------------------------*/
#define STR_BUFFER_LEN 128
#define CDE_BUFFER_LEN 64
/*---------------------------------------------------------------------------*/
#define N 16
/*******************************************************************************
 * Variables
 ******************************************************************************/
char g_bufferRX[RXD_BUFFER_LEN]={0}; // HTTP RX Buffer
char g_bufferTX[TXD_BUFFER_LEN]={0}; // HTTP TX Buffer
char g_sbuffer[STR_BUFFER_LEN]; // Text Buffer
/*******************************************************************************
 * Prototypes
 ******************************************************************************/
#ifndef MSEC_TO_TICK
#define MSEC_TO_TICK(msec) ((uint32_t)(msec) * (uint32_t)configTICK_RATE_HZ / 1000uL)
#endif
/*******************************************************************************
 * Code
 ******************************************************************************/
void main_task(void *pvParameters) {
	LCD_Puts(10, 30, "Connecting to WiFi...", 0xFF00);
	LCD_GramRefresh();
	wlan_init(AP_SSID, AP_PASSPHRASE , AP_SECURITY_MODE);
	LCD_Clear(0x0841);
	sprintf(g_sbuffer, "WiFi: %s", AP_SSID);
	LCD_Puts(10, 30, g_sbuffer, 0xFF00);
	LCD_GramRefresh();
	vTaskDelay(MSEC_TO_TICK(1000));
	uint8_t deviceID=9;
	char codebuffer[CDE_BUFFER_LEN]={0};
	char *contentData=NULL;
	int recvLen=0;
	int contLen=0;
	uint8_t value[N];
	uint16_t expanderOut=0;
	while (1) {
		LCD_Set_Bitmap((uint16_t*)back_160x128);
		LCD_Puts(10, 10, "LIGHT CONTROLLER", 0xFFFF);
		sprintf(g_sbuffer,"[ID:%02d]", deviceID);
		LCD_Puts(110, 10, g_sbuffer, 0x07E0);
		sprintf(g_bufferTX,"danielkrol.pwsztar.edu.pl/iot/lab/dev%02d/control.json", deviceID);
		http_GET(g_bufferTX, g_bufferRX);
		contentData=g_bufferRX;
		recvLen=strlen(g_bufferRX);
		http_head_parser(g_bufferRX, codebuffer, "Content-Length:");
		contLen=atoi(codebuffer);
		contentData=g_bufferRX+(recvLen-contLen);
		cJSON *root = cJSON_Parse(contentData);
		cJSON *arrayMain;
		cJSON *arrayItem;
		if(root==NULL) {
			LCD_Puts(10, 20, "JSON PARSING FAILURE", 0xFE00);
		} else {
			expanderOut=0;
			arrayMain = cJSON_GetObjectItem(root, "control");
			int n = cJSON_GetArraySize(arrayMain);
			for (int i = 0; i < n; i++) {
				arrayItem = cJSON_GetArrayItem(arrayMain, i);
				value[i] = arrayItem->valueint;
				if(n==N) {
					sprintf(g_sbuffer,"Out %02d:", i+1);
					if(i<8) {
						LCD_Puts(10, 40+i*10, g_sbuffer, 0xFFFF);
						value[i] ? LCD_Puts(55, 40+i*10, "ON", 0x07E0) : LCD_Puts(55, 40+i*10,
								"OFF", 0xF800);
					} else {
						LCD_Puts(90, 40+(i-8)*10, g_sbuffer, 0xFFFF);
						value[i] ? LCD_Puts(135, 40+(i-8)*10, "ON", 0x07E0) : LCD_Puts(135,
								40+(i-8)*10, "OFF", 0xF800);
					}
					expanderOut |= value[i] << i;
				}
			}
			if(n == N) {
				writeGPIOAB(expanderOut);
			}
			cJSON_Delete(root);
		}
		LCD_GramRefresh();
		vTaskDelay(MSEC_TO_TICK(500));
		sprintf(g_sbuffer,"[ID:%02d]", deviceID);
		LCD_Puts(110, 10, g_sbuffer, 0xFFFF);
		LCD_GramRefresh();
		vTaskDelay(MSEC_TO_TICK(500));
	}
}
/*
 * @brief Application entry point.
 */
int main(void) {
	/* Init board hardware. */
	BOARD_InitBootPins();
	BOARD_InitBootClocks();
	BOARD_InitBootPeripherals();
#ifndef BOARD_INIT_DEBUG_CONSOLE_PERIPHERAL
	/* Init FSL debug console. */
	BOARD_InitDebugConsole();
#endif
	LCD_Init(FLEXCOMM3_PERIPHERAL);
	LCD_Clear(0x0841);
	selectExpander(FLEXCOMM1_PERIPHERAL, 0x07);
	for(int i = 0; i < 16; i++) {
		pinMode(i, 0); //Output
	}
	if (xTaskCreate(main_task, "main_task", 350, NULL, MAIN_TASK_PRIORITY, NULL) != pdPASS) {
		PRINTF("Task creation failed!.\r\n");
		while (1)
			;
	}
	vTaskStartScheduler();
	while(1) {
	}
	return 0 ;
}
