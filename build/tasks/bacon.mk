# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2018 The PixelExperience Project
# Copyright (C) 2020 TwiceOS Project
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
# Build system colors
#
# PFX: Prefix "target C++:" in yellow
# INS: Module "Install:" output color (cyan for ics)
ifneq ($(BUILD_WITH_COLORS),0)
    include $(TOP_DIR)vendor/twice/build/core/colors.mk
endif

TWICE_TARGET_PACKAGE := $(PRODUCT_OUT)/$(TWICE_VERSION).zip

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(TWICE_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(TWICE_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(TWICE_TARGET_PACKAGE).md5sum
	@echo "Package Complete: $(TWICE_TARGET_PACKAGE)" >&2
	@echo -e ""
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_YLW}"                    		     `//       "${CL_YLW}
	@echo -e ${CL_YLW}"                               `-oydo       "${CL_YLW}
	@echo -e ${CL_YLW}"                    `````..::/+oyhhhd:      "${CL_YLW}
	@echo -e ${CL_YLW}"            `.:+oosssyyyyhdhhhhhhhhhy`      "${CL_YLW}
	@echo -e ${CL_YLW}"        `-+syhhhhhhhhhhhhhhhhhhhhhhs.       "${CL_YLW}
	@echo -e ${CL_YLW}"      .+yhhhhhhhhhhhhhhhhhhhhhhhhy/         "${CL_YLW}
	@echo -e ${CL_YLW}"     .shhhyssooohhhhhhhhhyhyyyso/-          "${CL_YLW}
	@echo -e ${CL_YLW}"   `ohho:.      hhhhhhhh````		       "${CL_YLW}
	@echo -e ${CL_YLW}"  .yhh-        +hhhhhhh.         `:++. `::` "${CL_YLW}
	@echo -e ${CL_YLW}" .hhd:        .dhhhhhd-         /hhhhho:dhd`"${CL_YLW}
	@echo -e ${CL_YLW}" shhd`        +hhhhhd/          .yhhhhhhhhs "${CL_YLW}
	@echo -e ${CL_YLW}" dhhh+       .dhhhhh+  `oshhs+`   yhhhhho:  "${CL_YLW}
	@echo -e ${CL_YLW}"`dhhhhy/-`   /hhhhhy  /dhhhhhhh`  -dhhhd    "${CL_YLW}
	@echo -e ${CL_YLW}" yhhhhhh+`   hhhhhd- .dhhy/hhhd-  -dhhhh    "${CL_YLW}
	@echo -e ${CL_YLW}"  +hdy/`     dhhhhy  /dhd/`hhhd`  /hhhd/    "${CL_YLW}
	@echo -e ${CL_YLW}"    .       .dhhhhy  -dhhoshhd-  `hhhhy     "${CL_YLW}
	@echo -e ${CL_YLW}"            `hhhhhy   yhhhhhy-  .yhhhy`     "${CL_YLW}
	@echo -e ${CL_YLW}"             +dhhhho-`-dhhhy-.:ohhhho       "${CL_YLW}
	@echo -e ${CL_YLW}"              /ydhhhhhhhsyhhhhhhhdy:        "${CL_YLW}
	@echo -e ${CL_YLW}"               `-/osos/.``/osyso+-`         "${CL_YLW}
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_YLW}"     ______         _           ____  _____ "${CL_YLW}
	@echo -e ${CL_YLW}"    /_  __/      __(_)_______  / __ \/ ___/ "${CL_YLW}
	@echo -e ${CL_CYN}"     / / | | /| / / / ___/ _ \/ / / /\__ \  "${CL_CYN}
	@echo -e ${CL_CYN}"    / /  | |/ |/ / / /__/  __/ /_/ /___/ /  "${CL_CYN}
	@echo -e ${CL_CYN}"   /_/   |__/|__/_/\___/\___/\____//____/   "${CL_CYN}
	@echo -e ${CL_RST}""${CL_RST}
