################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/freertos-kernel/croutine.c \
../freertos/freertos-kernel/event_groups.c \
../freertos/freertos-kernel/list.c \
../freertos/freertos-kernel/queue.c \
../freertos/freertos-kernel/stream_buffer.c \
../freertos/freertos-kernel/tasks.c \
../freertos/freertos-kernel/timers.c 

C_DEPS += \
./freertos/freertos-kernel/croutine.d \
./freertos/freertos-kernel/event_groups.d \
./freertos/freertos-kernel/list.d \
./freertos/freertos-kernel/queue.d \
./freertos/freertos-kernel/stream_buffer.d \
./freertos/freertos-kernel/tasks.d \
./freertos/freertos-kernel/timers.d 

OBJS += \
./freertos/freertos-kernel/croutine.o \
./freertos/freertos-kernel/event_groups.o \
./freertos/freertos-kernel/list.o \
./freertos/freertos-kernel/queue.o \
./freertos/freertos-kernel/stream_buffer.o \
./freertos/freertos-kernel/tasks.o \
./freertos/freertos-kernel/timers.o 


# Each subdirectory must supply rules for building sources it contributes
freertos/freertos-kernel/%.o: ../freertos/freertos-kernel/%.c freertos/freertos-kernel/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DCPU_LPC55S69JBD100_cm33_core0 -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=1 -DPRINTF_FLOAT_ENABLE=1 -DSDK_OS_FREE_RTOS -DSERIAL_PORT_TYPE_UART=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\board" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\source" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\freertos\freertos-kernel\include" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\drivers" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\drivers\freertos" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\device" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\CMSIS" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\utilities" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\component\uart" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\component\serial_manager" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\component\lists" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\component\serial_mwm" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\freertos\freertos-kernel\portable\GCC\ARM_CM33_NTZ\non_secure" -I"C:\Users\mateu\OneDrive\Pulpit\MCU\IoT_Lab2_vol2\startup" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-freertos-2f-freertos-2d-kernel

clean-freertos-2f-freertos-2d-kernel:
	-$(RM) ./freertos/freertos-kernel/croutine.d ./freertos/freertos-kernel/croutine.o ./freertos/freertos-kernel/event_groups.d ./freertos/freertos-kernel/event_groups.o ./freertos/freertos-kernel/list.d ./freertos/freertos-kernel/list.o ./freertos/freertos-kernel/queue.d ./freertos/freertos-kernel/queue.o ./freertos/freertos-kernel/stream_buffer.d ./freertos/freertos-kernel/stream_buffer.o ./freertos/freertos-kernel/tasks.d ./freertos/freertos-kernel/tasks.o ./freertos/freertos-kernel/timers.d ./freertos/freertos-kernel/timers.o

.PHONY: clean-freertos-2f-freertos-2d-kernel

