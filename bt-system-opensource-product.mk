#ANT
ifeq ($(TARGET_USE_WEAR_QC_BT_STACK), true)
ifeq ($(BOARD_ANT_WIRELESS_DEVICE), "vfs-prerelease")
PRODUCT_PACKAGES += AntHalService
PRODUCT_PACKAGES += libantradio
PRODUCT_PACKAGES += antradio_app
else
ifneq ($(TARGET_BOARD_PLATFORM),monaco)
PRODUCT_PACKAGES += AntHalService-Soong
PRODUCT_PACKAGES += com.dsi.ant@1.0
endif
endif
endif #TARGET_USE_WEAR_QC_BT_STACK

PRODUCT_PACKAGES_DEBUG += wearos_bluetooth_rfcomm_testapp
PRODUCT_PACKAGES_DEBUG += wearos_ble_testapp
# for RfCommTestApp implementation
SOONG_CONFIG_NAMESPACES += qc_bt_RfCommTestApp
SOONG_CONFIG_qc_bt_RfCommTestApp += aosp_or_qc_bt_RfCommTestApp
ifeq ($(TARGET_USE_WEAR_QC_BT_STACK),true)
SOONG_CONFIG_qc_bt_RfCommTestApp_aosp_or_qc_bt_RfCommTestApp := enabled
else
SOONG_CONFIG_qc_bt_RfCommTestApp_aosp_or_qc_bt_RfCommTestApp := disabled
endif

# for BletestApp implementation
SOONG_CONFIG_NAMESPACES += qc_bt_BleTestApp
SOONG_CONFIG_qc_bt_BleTestApp += qc_bt_enable_disable_BleTestApp
ifeq ($(TARGET_USE_WEAR_QC_BT_STACK),true)
SOONG_CONFIG_qc_bt_BleTestApp_qc_bt_enable_disable_BleTestApp := enabled
else
SOONG_CONFIG_qc_bt_BleTestApp_qc_bt_enable_disable_BleTestApp := disabled
endif
#BT
ifeq ($(BOARD_HAVE_BLUETOOTH_QCOM),true)
PRODUCT_PACKAGES += Bluetooth

ifneq ($(TARGET_BOARD_TYPE),auto)
# Set supported Bluetooth profiles to enabled
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.profile.a2dp.source.enabled=true \
    bluetooth.profile.avrcp.target.enabled=true \
    bluetooth.profile.avrcp.controller.enabled=true \
    bluetooth.profile.hfp.ag.enabled=true \
    bluetooth.profile.gatt.enabled=true \
    bluetooth.profile.hfp.hf.enabled=true
endif #TARGET_BOARD_TYPE

ifeq ($(TARGET_USE_WEAR_QC_BT_STACK), true)
TARGET_USE_QTI_BT_STACK := true

ifeq ($(BOARD_OPENSOURCE_DIR),)
    BOARD_OPENSOURCE_DIR := vendor/qcom/opensource
endif

SOONG_CONFIG_NAMESPACES += aosp_vs_qva
SOONG_CONFIG_aosp_vs_qva += aosp_or_qva
SOONG_CONFIG_aosp_vs_qva_aosp_or_qva := qva

ifeq ($(TARGET_USE_QTI_BT_STACK),true)
# BT Related Libs
PRODUCT_PACKAGES += libbluetooth_qti
PRODUCT_PACKAGES += libbluetooth_qti_jni
PRODUCT_PACKAGES += bt_logger
PRODUCT_PACKAGES += libbt-logClient
#PRODUCT_PACKAGES += libbtconfigstore
#PRODUCT_PACKAGES += vendor.qti.hardware.btconfigstore@1.0
#PRODUCT_PACKAGES += vendor.qti.hardware.btconfigstore@2.0
PRODUCT_PACKAGES += com.qualcomm.qti.bluetooth_audio@1.0
PRODUCT_PACKAGES += vendor.qti.hardware.bluetooth_audio@2.0

ifeq ($(TARGET_USE_BT_DUN),true)
PRODUCT_PACKAGES += vendor.qti.hardware.bluetooth_dun-V1.0-java
PRODUCT_PACKAGES += BluetoothExt
endif #TARGET_USE_BT_DUN

PRODUCT_SOONG_NAMESPACES += $(BOARD_OPENSOURCE_DIR)/commonsys/packages/apps/Bluetooth
PRODUCT_SOONG_NAMESPACES += $(BOARD_OPENSOURCE_DIR)/commonsys/system/bt/conf
PRODUCT_SOONG_NAMESPACES += $(BOARD_OPENSOURCE_DIR)/commonsys/system/bt/main


#PRODUCT_PACKAGE_OVERLAYS += $(BOARD_OPENSOURCE_DIR)/commonsys-intf/bluetooth/overlay/qva
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(BOARD_OPENSOURCE_DIR)/commonsys-intf/bluetooth/build/qva/config

# BT Related Test app & Tools
PRODUCT_PACKAGES_DEBUG += btsnoop
PRODUCT_PACKAGES_DEBUG += gatt_tool_qti_internal
PRODUCT_PACKAGES_DEBUG += l2cap_coc_tool
PRODUCT_PACKAGES_DEBUG += l2test_ertm
PRODUCT_PACKAGES_DEBUG += rfc

ifneq ($(TARGET_HAS_LOW_RAM), true)
PRODUCT_PACKAGES_DEBUG += BTTestApp
endif #TARGET_HAS_LOW_RAM

ifneq ($(TARGET_PRODUCT),sdm429w)
#adv audio
SOONG_CONFIG_NAMESPACES += bredr_vs_btadva
SOONG_CONFIG_bredr_vs_btadva += bredr_or_btadva
SOONG_CONFIG_NAMESPACES += fwk_bredr_vs_btadva
SOONG_CONFIG_fwk_bredr_vs_btadva += fwk_bredr_or_btadva

ifneq "$(wildcard vendor/qcom/proprietary/commonsys/bt/bt_adv_audio)" ""
    $(warning bt_adv_audio dir is present)
    SOONG_CONFIG_bredr_vs_btadva_bredr_or_btadva := btadva
    SOONG_CONFIG_fwk_bredr_vs_btadva_fwk_bredr_or_btadva := btadva
else
    $(warning bt_adv_audio dir is not present)
    SOONG_CONFIG_bredr_vs_btadva_bredr_or_btadva := bredr
    SOONG_CONFIG_fwk_bredr_vs_btadva_fwk_bredr_or_btadva := bredr
endif #ifneq "$(wildcard vendor/qcom/proprietary/commonsys/bt/bt_adv_audio)" ""
endif

else
PRODUCT_SOONG_NAMESPACES += packages/modules/Bluetooth/android/app
PRODUCT_PACKAGE_OVERLAYS += $(BOARD_OPENSOURCE_DIR)/commonsys-intf/bluetooth/overlay/generic
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(BOARD_OPENSOURCE_DIR)/commonsys-intf/bluetooth/build/generic/config
endif #TARGET_USE_QTI_BT_STACK

else
PRODUCT_SOONG_NAMESPACES += packages/modules/Bluetooth/android/app
#PRODUCT_PACKAGE_OVERLAYS += $(BOARD_OPENSOURCE_DIR)/commonsys-intf/bluetooth/overlay/generic
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(BOARD_OPENSOURCE_DIR)/commonsys-intf/bluetooth/build/generic/config
SOONG_CONFIG_aosp_vs_qva_aosp_or_qva := aosp
endif #TARGET_USE_WEAR_QC_BT_STACK

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
