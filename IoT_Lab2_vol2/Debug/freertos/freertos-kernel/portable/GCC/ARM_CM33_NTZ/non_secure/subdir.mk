################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/port.c \
../freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/portasm.c 

C_DEPS += \
./freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/port.d \
./freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/portasm.d 

OBJS += \
./freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/port.o \
./freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/portasm.o 


# Each subdirectory must supply rules for building sources it contributes
freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/%.o: ../freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/%.c freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DCPU_LPC55S69JBD100_cm33_core0 -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=1 -DPRINTF_FLOAT_ENABLE=1 -DSDK_OS_FREE_RTOS -DSERIAL_PORT_TYPE_UART=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\board" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\source" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\freertos\freertos-kernel\include" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\drivers" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\drivers\freertos" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\device" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\CMSIS" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\utilities" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\component\uart" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\component\serial_manager" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\component\lists" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\component\serial_mwm" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\freertos\freertos-kernel\portable\GCC\ARM_CM33_NTZ\non_secure" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\startup" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-freertos-2f-freertos-2d-kernel-2f-portable-2f-GCC-2f-ARM_CM33_NTZ-2f-non_secure

clean-freertos-2f-freertos-2d-kernel-2f-portable-2f-GCC-2f-ARM_CM33_NTZ-2f-non_secure:
	-$(RM) ./freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/port.d ./freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/port.o ./freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/portasm.d ./freertos/freertos-kernel/portable/GCC/ARM_CM33_NTZ/non_secure/portasm.o

.PHONY: clean-freertos-2f-freertos-2d-kernel-2f-portable-2f-GCC-2f-ARM_CM33_NTZ-2f-non_secure

