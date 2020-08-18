# Define Var
CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

# Twice Version
TWICE_PLATFORM_VERSION := 1.0
TWICE_VERSION_PROP := $(TWICE_PLATFORM_VERSION)

# Twice Official Release
ifeq ($(TWICE_OFFICIAL), true)
   LIST = $(shell cat vendor/twice/twice.devices | awk '{ print $$1 }')

    ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
	IS_OFFICIAL=true
	TWICE_BUILD_TYPE := OFFICIAL
    endif
    ifneq ($(IS_OFFICIAL), true)
	TWICE_BUILD_TYPE := UNOFFICIAL
    endif

# Type of zip
ifeq ($(CURRENT_BUILD_TYPE), nogapps)
     TWICE_BUILD_ZIP_TYPE := VANILLA
else ifeq ($(CURRENT_BUILD_TYPE), gapps)
     TWICE_BUILD_ZIP_TYPE := GAPPS
else
    ifeq ($(CURRENT_BUILD_TYPE),)
	$(warning "Twice vendor: CURRENT_BUILD_TYPE is undefined, assuming nogapps")
    else
	$(warning "Twice vendor: Incorrect value for CURRENT_BUILD_TYPE, forcing nogapps")
    endif
    TWICE_BUILD_ZIP_TYPE := VANILLA
    CURRENT_BUILD_TYPE := nogapps
endif

# Set all versions
TWICE_DATE_YEAR := $(shell date -u +%Y)
TWICE_DATE_MONTH := $(shell date -u +%m)
TWICE_DATE_DAY := $(shell date -u +%d)
TWICE_DATE_HOUR := $(shell date -u +%H)
TWICE_DATE_MINUTE := $(shell date -u +%M)
TWICE_BUILD_DATE_UTC := $(shell date -d '$(TWICE_DATE_YEAR)-$(TWICE_DATE_MONTH)-$(TWICE_DATE_DAY) $(TWICE_DATE_HOUR):$(TWICE_DATE_MINUTE) UTC' +%s)
TWICE_BUILD_DATE := $(TWICE_DATE_YEAR)$(TWICE_DATE_MONTH)$(TWICE_DATE_DAY)-$(TWICE_DATE_HOUR)$(TWICE_DATE_MINUTE)

TARGET_PRODUCT_SHORT := $(subst aosp_,,$(TWICE_BUILD))

TWICE_VERSION := TwiceOS-$(TWICE_BUILD)-$(TWICE_PLATFORM_VERSION)-$(TWICE_BUILD_DATE)-$(TWICE_BUILD_TYPE)-$(TWICE_BUILD_ZIP_TYPE)

TWICE_PROPERTIES := \
    org.twice.version=$(TWICE_VERSION_PROP) \
    org.twice.version.display=$(TWICE_VERSION) \
    org.twice.build_date=$(TWICE_BUILD_DATE) \
    org.twice.build_date_utc=$(TWICE_BUILD_DATE_UTC) \
    org.twice.build_type=$(TWICE_BUILD_TYPE) \
    org.twice.ziptype=$(TWICE_BUILD_ZIP_TYPE)

