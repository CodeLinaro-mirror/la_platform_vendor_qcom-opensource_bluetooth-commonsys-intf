#ANT
ifeq ($(TARGET_FWK_SUPPORTS_FULL_VALUEADDS), true)
ifeq ($(BOARD_ANT_WIRELESS_DEVICE), "vfs-prerelease")
PRODUCT_PACKAGES += AntHalService
PRODUCT_PACKAGES += libantradio
PRODUCT_PACKAGES += antradio_app
else
PRODUCT_PACKAGES += AntHalService-Soong
PRODUCT_PACKAGES += com.dsi.ant@1.0
endif
endif #TARGET_FWK_SUPPORTS_FULL_VALUEADDS

#BT
ifeq ($(BOARD_HAVE_BLUETOOTH_QCOM),true)
PRODUCT_PACKAGES += Bluetooth

ifneq ($(TARGET_BOARD_TYPE),auto)
# Set supported Bluetooth profiles to enabled
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.profile.a2dp.source.enabled=false \
    bluetooth.profile.avrcp.target.enabled=false \
    bluetooth.profile.avrcp.controller.enabled=true \
    bluetooth.profile.hfp.ag.enabled=false \
    bluetooth.profile.gatt.enabled=true \
    bluetooth.profile.hid.host.enabled=true \
    bluetooth.profile.hid.device.enabled=false \
    bluetooth.profile.map.server.enabled=false \
    bluetooth.profile.opp.enabled=true \
    bluetooth.profile.pan.nap.enabled=false \
    bluetooth.profile.pan.panu.enabled=true \
    bluetooth.profile.pbap.server.enabled=false \
    bluetooth.profile.bas.client.enabled=false \
    bluetooth.profile.a2dp.sink.enabled=true \
    bluetooth.profile.hfp.hf.enabled=true \
    bluetooth.profile.map.client.enabled=true \
    bluetooth.profile.pbap.client.enabled=true \
    bluetooth.device_id.vendor_id=0x001D

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    bluetooth.profile.sap.server.enabled=false \
    bluetooth.profile.pbap.sim.enabled=false \
    bluetooth.hfp.codec_aptx_voice.enabled=false \
    bluetooth.hfp.swb.aptx.power_management.enabled=false \
    ro.bluetooth.leaudio_offload.supported=false \
    bluetooth.device.class_of_device=26,4,8 \
    persist.bluetooth.leaudio_offload.disabled=true \
    persist.bluetooth.leaudio.allow.multiple.context=false \
    persist.bluetooth.leaudio.bypass_allow_list=false \
    bluetooth.leaudio.dual_bidirection_swb.supported=false \
    persist.bluetooth.leaudio.notify.idle.during.call=false \
    persist.vendor.bluetooth.haltest=false

# Set max connected audio devices as 1
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.maxconnectedaudiodevices=1
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.gatt.over_bredr.enabled=false

ifneq ($(TARGET_HAS_LOW_RAM), true)
PRODUCT_PACKAGES += Xpan
PRODUCT_PACKAGES += privapp-permission-xpan.xml
endif #TARGET_HAS_LOW_RAM

endif #TARGET_BOARD_TYPE

ifeq ($(TARGET_FWK_SUPPORTS_FULL_VALUEADDS), true)
ifneq ($(TARGET_BOARD_TYPE),auto)
TARGET_USE_QTI_BT_STACK := false
endif

ifeq ($(TARGET_USE_QTI_BT_STACK),true)
# BT Related Libs
PRODUCT_PACKAGES += libbluetooth_qti
PRODUCT_PACKAGES += libbluetooth_qti_jni
PRODUCT_PACKAGES += bt_logger
PRODUCT_PACKAGES += libbt-logClient
PRODUCT_PACKAGES += libbtconfigstore
PRODUCT_PACKAGES += vendor.qti.hardware.btconfigstore@1.0
PRODUCT_PACKAGES += vendor.qti.hardware.btconfigstore@2.0
PRODUCT_PACKAGES += com.qualcomm.qti.bluetooth_audio@1.0
PRODUCT_PACKAGES += vendor.qti.hardware.bluetooth_audio@2.0

ifeq ($(TARGET_USE_BT_DUN),true)
PRODUCT_PACKAGES += vendor.qti.hardware.bluetooth_dun-V1.0-java
PRODUCT_PACKAGES += BluetoothExt
endif #TARGET_USE_BT_DUN

PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/commonsys/packages/apps/Bluetooth
PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/commonsys/system/bt/conf
PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/commonsys/system/bt/main

PRODUCT_PACKAGE_OVERLAYS += vendor/qcom/opensource/commonsys-intf/bluetooth/overlay/qva
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := vendor/qcom/opensource/commonsys-intf/bluetooth/build/qva/config

# BT Related Test app & Tools
PRODUCT_PACKAGES_DEBUG += btsnoop
PRODUCT_PACKAGES_DEBUG += gatt_tool_qti_internal
PRODUCT_PACKAGES_DEBUG += l2cap_coc_tool
PRODUCT_PACKAGES_DEBUG += l2test_ertm
PRODUCT_PACKAGES_DEBUG += rfc

ifneq ($(TARGET_HAS_LOW_RAM), true)
PRODUCT_PACKAGES_DEBUG += BTTestApp
endif #TARGET_HAS_LOW_RAM

else
#PRODUCT_SOONG_NAMESPACES += packages/modules/Bluetooth/android/app
#PRODUCT_PACKAGE_OVERLAYS += vendor/qcom/opensource/commonsys-intf/bluetooth/overlay/generic
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := vendor/qcom/opensource/commonsys-intf/bluetooth/build/generic/config
endif #TARGET_USE_QTI_BT_STACK

else
#PRODUCT_PACKAGE_OVERLAYS += vendor/qcom/opensource/commonsys-intf/bluetooth/overlay/generic
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := vendor/qcom/opensource/commonsys-intf/bluetooth/build/generic/config
endif #TARGET_FWK_SUPPORTS_FULL_VALUEADDS

endif #BOARD_HAVE_BLUETOOTH_QCOM

#FM
ifeq ($(BOARD_HAVE_QCOM_FM), true)
ifeq ($(TARGET_FWK_SUPPORTS_FULL_VALUEADDS), true)
PRODUCT_PACKAGES += libqcomfm_jni
PRODUCT_PACKAGES += libfmjni
PRODUCT_PACKAGES += fm_helium
PRODUCT_PACKAGES += libfm-hci
PRODUCT_PACKAGES += FM2
PRODUCT_PACKAGES += qcom.fmradio
PRODUCT_BOOT_JARS += qcom.fmradio
PRODUCT_PACKAGES += vendor.qti.hardware.fm@1.0
# system prop for fm
PRODUCT_PROPERTY_OVERRIDES += vendor.hw.fm.init=0
endif #TARGET_FWK_SUPPORTS_FULL_VALUEADDS
endif #BOARD_HAVE_QCOM_FM

#WIPOWER
ifeq ($(BOARD_USES_WIPOWER),true)
ifeq ($(TARGET_FWK_SUPPORTS_FULL_VALUEADDS), true)
#WIPOWER, wbc
PRODUCT_PACKAGES += wbc_hal.default
PRODUCT_PACKAGES += com.quicinc.wbc
PRODUCT_PACKAGES += com.quicinc.wbc.xml
PRODUCT_PACKAGES += com.quicinc.wbcservice
PRODUCT_PACKAGES += com.quicinc.wbcservice.xml
PRODUCT_PACKAGES += libwbc_jni
PRODUCT_PACKAGES += com.quicinc.wipoweragent
PRODUCT_PACKAGES += com.quicinc.wbcserviceapp
endif #TARGET_FWK_SUPPORTS_FULL_VALUEADDS
endif #BOARD_USES_WIPOWER
