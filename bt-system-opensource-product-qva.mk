-include vendor/qcom/opensource/commonsys/packages/modules/Bluetooth/qva_bt.mk

# Set max connected audio devices as 1
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.maxconnectedaudiodevices=1
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.gatt.over_bredr.enabled=false
# Enable Hid Host (BR/EDR) and HOGP
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.profile.hid.host.enabled=true
# Set start timeout default value as 4000ms
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.gd.start_timeout=4000

ifeq ($(BOARD_HAVE_DUAL_BLUETOOTH), true)
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.dual_bt=true \
    persist.bluetooth.dual_adapter_mode=true

PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.profile.hfp.ag.enabled=true \
    bluetooth.profile.a2dp.source.enabled=true \
    bluetooth.profile.avrcp.target.enabled=true
else
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.dual_bt=false \
    persist.bluetooth.dual_adapter_mode=false

ifeq ($(TARGET_BOARD_TYPE),auto)
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.profile.hfp.ag.enabled=false \
    bluetooth.profile.a2dp.source.enabled=false \
    bluetooth.profile.avrcp.target.enabled=false
endif
endif

# Set LE inquiry scan duty cycle to 1/10
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.core.le.inquiry_scan_window=16 \
    bluetooth.core.le.inquiry_scan_interval=160