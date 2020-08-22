ifneq ($(filter OFFICIAL CI,$(TWICE_BUILD_TYPE)),)
PRODUCT_PACKAGES += \
    Updates
endif
