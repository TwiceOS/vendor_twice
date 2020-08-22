# Twice Version
TWICE_PLATFORM_VERSION := 1.0

# Set all versions
TWICE_BUILD_TYPE ?= UNOFFICIAL

TWICE_DATE_YEAR := $(shell date -u +%Y)
TWICE_DATE_MONTH := $(shell date -u +%m)
TWICE_DATE_DAY := $(shell date -u +%d)
TWICE_DATE_HOUR := $(shell date -u +%H)
TWICE_DATE_MINUTE := $(shell date -u +%M)
TWICE_BUILD_DATE_UTC := $(shell date -d '$(TWICE_DATE_YEAR)-$(TWICE_DATE_MONTH)-$(TWICE_DATE_DAY) $(TWICE_DATE_HOUR):$(TWICE_DATE_MINUTE) UTC' +%s)
TWICE_BUILD_DATE := $(TWICE_DATE_YEAR)$(TWICE_DATE_MONTH)$(TWICE_DATE_DAY)-$(TWICE_DATE_HOUR)$(TWICE_DATE_MINUTE)

TARGET_PRODUCT_SHORT := $(subst aosp_,,$(TWICE_BUILD))

TWICE_VERSION := TwiceOS_$(TWICE_BUILD)-$(TWICE_PLATFORM_VERSION)-$(TWICE_BUILD_DATE)-$(TWICE_BUILD_TYPE)
TWICE_VERSION_PROP := ten

TWICE_PROPERTIES := \
    org.twice.version=$(TWICE_VERSION_PROP) \
    org.twice.version.display=$(TWICE_VERSION) \
    org.twice.build_date=$(TWICE_BUILD_DATE) \
    org.twice.build_date_utc=$(TWICE_BUILD_DATE_UTC) \
    org.twice.build_type=$(TWICE_BUILD_TYPE)
