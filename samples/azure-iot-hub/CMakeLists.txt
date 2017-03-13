#Copyright (c) Microsoft. All rights reserved.
#Licensed under the MIT license. See LICENSE file in the project root for full license information.

cmake_minimum_required(VERSION 2.8.11)

if (CMAKE_C_COMPILER_ID STREQUAL "GNU")
  set (CMAKE_C_FLAGS "--std=c99 -g ${CMAKE_C_FLAGS}")
endif()

include_directories($ENV{SYSROOT}/usr/include/azureiot/inc)

add_executable(azure-blink main.c)
target_link_libraries(azure-blink wiringPi
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