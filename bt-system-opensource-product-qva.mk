ifneq "$(wildcard vendor/qcom/opensource/commonsys/packages/modules/Bluetooth)" ""
include vendor/qcom/opensource/commonsys/packages/modules/Bluetooth/qva_bt.mk
endif

# Set max connected audio devices as 1
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.maxconnectedaudiodevices=1
