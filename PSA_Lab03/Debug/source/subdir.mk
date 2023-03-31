################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/PSA_Lab03.c \
../source/semihost_hardfault.c 

C_DEPS += \
./source/PSA_Lab03.d \
./source/semihost_hardfault.d 

OBJS += \
./source/PSA_Lab03.o \
./source/semihost_hardfault.o 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.c source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DPRINTF_ADVANCED_ENABLE=1 -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DCPU_LPC55S69JBD100_cm33_core0 -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -DSERIAL_PORT_TYPE_UART=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\mateu\OneDrive\Pulpit\MCU\PSA_Lab03\board" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\PSA_Lab03\source" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\PSA_Lab03\drivers" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\PSA_Lab03\device" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\PSA_Lab03\CMSIS" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\PSA_Lab03\utilities" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\PSA_Lab03\component\uart" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\PSA_Lab03\component\serial_manager" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\PSA_Lab03\component\lists" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\PSA_Lab03\startup" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-source

clean-source:
	-$(RM) ./source/PSA_Lab03.d ./source/PSA_Lab03.o ./source/semihost_hardfault.d ./source/semihost_hardfault.o

.PHONY: clean-source

