ifneq "$(wildcard vendor/qcom/opensource/commonsys/packages/modules/Bluetooth)" ""
include vendor/qcom/opensource/commonsys/packages/modules/Bluetooth/qva_bt.mk
endif

# Set max connected audio devices as 1
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.maxconnectedaudiodevices=1

PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.profile.hid.host.enabled=true

ifeq ($(BOARD_HAVE_DUAL_BLUETOOTH), true)
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.dual_bt=false \
    persist.bluetooth.dual_adapter_mode=true

PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.profile.a2dp.source.enabled=false \
    bluetooth.profile.avrcp.target.enabled=false
endif
