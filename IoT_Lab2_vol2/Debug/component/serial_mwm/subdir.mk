################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../component/serial_mwm/serial_mwm.c \
../component/serial_mwm/serial_mwm_usart.c 

C_DEPS += \
./component/serial_mwm/serial_mwm.d \
./component/serial_mwm/serial_mwm_usart.d 

OBJS += \
./component/serial_mwm/serial_mwm.o \
./component/serial_mwm/serial_mwm_usart.o 


# Each subdirectory must supply rules for building sources it contributes
component/serial_mwm/%.o: ../component/serial_mwm/%.c component/serial_mwm/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DCPU_LPC55S69JBD100_cm33_core0 -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=1 -DPRINTF_FLOAT_ENABLE=1 -DSDK_OS_FREE_RTOS -DSERIAL_PORT_TYPE_UART=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\board" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\source" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\freertos\freertos-kernel\include" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\drivers" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\drivers\freertos" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\device" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\CMSIS" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\utilities" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\component\uart" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\component\serial_manager" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\component\lists" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\component\serial_mwm" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\freertos\freertos-kernel\portable\GCC\ARM_CM33_NTZ\non_secure" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\startup" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-component-2f-serial_mwm

clean-component-2f-serial_mwm:
	-$(RM) ./component/serial_mwm/serial_mwm.d ./component/serial_mwm/serial_mwm.o ./component/serial_mwm/serial_mwm_usart.d ./component/serial_mwm/serial_mwm_usart.o

.PHONY: clean-component-2f-serial_mwm

