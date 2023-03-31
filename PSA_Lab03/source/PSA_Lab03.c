#include <stdio.h>
#include "board.h"
#include "peripherals.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "LPC55S69_cm33_core0.h"
#include "fsl_debug_console.h"
void motorsPower(int8_t chA, int8_t chB) {
	if(chA > 0) {
		GPIO_PinWrite(BOARD_INITMOTORSPINS_A1_GPIO, BOARD_INITMOTORSPINS_A1_PORT, BOARD_INITMOTORSPINS_A1_PIN, 1);
		GPIO_PinWrite(BOARD_INITMOTORSPINS_A2_GPIO, BOARD_INITMOTORSPINS_A2_PORT, BOARD_INITMOTORSPINS_A2_PIN, 0);
	} else {
		GPIO_PinWrite(BOARD_INITMOTORSPINS_A1_GPIO, BOARD_INITMOTORSPINS_A1_PORT, BOARD_INITMOTORSPINS_A1_PIN, 0);
		GPIO_PinWrite(BOARD_INITMOTORSPINS_A2_GPIO, BOARD_INITMOTORSPINS_A2_PORT, BOARD_INITMOTORSPINS_A2_PIN, 1);
	}
	if(chB > 0) {
		GPIO_PinWrite(BOARD_INITMOTORSPINS_B1_GPIO, BOARD_INITMOTORSPINS_B1_PORT, BOARD_INITMOTORSPINS_B1_PIN, 1);
		GPIO_PinWrite(BOARD_INITMOTORSPINS_B2_GPIO, BOARD_INITMOTORSPINS_B2_PORT, BOARD_INITMOTORSPINS_B2_PIN, 0);
	} else {
		GPIO_PinWrite(BOARD_INITMOTORSPINS_B1_GPIO, BOARD_INITMOTORSPINS_B1_PORT, BOARD_INITMOTORSPINS_B1_PIN, 0);
		GPIO_PinWrite(BOARD_INITMOTORSPINS_B2_GPIO, BOARD_INITMOTORSPINS_B2_PORT, BOARD_INITMOTORSPINS_B2_PIN, 1);
	}
	chA = (chA < 0) ? - chA : chA;
	chB = (chB < 0) ? - chB : chB;
	CTIMER_UpdatePwmDutycycle(CTIMER2_PERIPHERAL, CTIMER2_PWM_PERIOD_CH, CTIMER2_PWM_A_CHANNEL, chA);
	CTIMER_UpdatePwmDutycycle(CTIMER2_PERIPHERAL, CTIMER2_PWM_PERIOD_CH, CTIMER2_PWM_B_CHANNEL, chB);
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
	PRINTF("Run\n\r");
	int8_t pwmDuty = 0;
	bool dir = true;
	while(1) {
		if(dir) {
			pwmDuty++;
			if(pwmDuty >100) {
				pwmDuty = 100;
				dir = false;
			}
		} else {
			pwmDuty--;
			if(pwmDuty < -100) {
				pwmDuty = -100;
				dir = true;
			}
		}
		PRINTF("Motors [%d%%]\n\r", pwmDuty);
		motorsPower(pwmDuty, pwmDuty);
		// Simple delay
		for(volatile int i=0; i<1000000; i++)
			;
	}
	return 0 ;
}
