#
# Copyright 2020 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH:= $(call my-dir)

# HAL module implemenation stored in
# hw/<POWERS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)

LOCAL_SRC_FILES := lights.c stock_lights_interface.c
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_MODULE := lights.hi6250
LOCAL_CFLAGS := -DLOG_TAG='"Meticulus Lights"'

ifneq ($(TARGET_PRODUCT),omni_hi6250)
ifneq ($(TARGET_PRODUCT),aosp_hi6250)
ifneq ($(TARGET_PRODUCT),pa_hi6250)
LOCAL_CFLAGS += -DLEDSMODE
endif
endif
else
# Debug for omni
LOCAL_CFLAGS += -DDEBUG
endif
include $(BUILD_SHARED_LIBRARY)
