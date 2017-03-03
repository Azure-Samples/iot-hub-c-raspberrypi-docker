#Copyright (c) Microsoft. All rights reserved.
#Licensed under the MIT license. See LICENSE file in the project root for full license information.

cmake_minimum_required(VERSION 2.8.11)

if (CMAKE_C_COMPILER_ID STREQUAL "GNU")
  set (CMAKE_C_FLAGS "--std=c99 -g ${CMAKE_C_FLAGS}")
endif()

set(azure_IoT_Sdk_c $ENV{AZURE_IOT_SDK})
include_directories(${azure_IoT_Sdk_c}/c-utility/inc
                    ${azure_IoT_Sdk_c}/iothub_client/inc)
link_directories(${azure_IoT_Sdk_c}/cmake/iotsdk_linux/serializer
                  ${azure_IoT_Sdk_c}/cmake/iotsdk_linux/iothub_client
                  ${azure_IoT_Sdk_c}/cmake/iotsdk_linux/c-utility
                  ${azure_IoT_Sdk_c}/cmake/iotsdk_linux/umqtt)

add_executable(iot main.c)
target_link_libraries(iot wiringPi
                          serializer
                          iothub_client
                          iothub_client_mqtt_transport
                          umqtt
                          aziotsharedutil
                          ssl
                          crypto
                          curl
                          pthread
                          m
                          ssl
                          crypto)