-include vendor/qcom/opensource/commonsys/packages/modules/Bluetooth/qva_bt.mk

# Set max connected audio devices as 1
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.maxconnectedaudiodevices=1
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.gatt.over_bredr.enabled=false
