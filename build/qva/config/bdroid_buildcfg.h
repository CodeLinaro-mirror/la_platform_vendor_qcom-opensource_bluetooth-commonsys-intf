/*
 *  Copyright (c) 2013, The Linux Foundation. All rights reserved.
 *  Not a Contribution.
 *
 * Copyright (C) 2012 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _BDROID_BUILDCFG_H
#define _BDROID_BUILDCFG_H
#define BTM_DEF_LOCAL_NAME   "QCOM-BTD"
#define BTA_DISABLE_DELAY 1000 /* in milliseconds */
#define BTA_SKIP_BLE_READ_REMOTE_FEAT TRUE
#define BLE_PERIPHERAL_MODE_SUPPORT   TRUE
#define BLE_PERIPHERAL_DISPLAYONLY    TRUE
#define BLE_DELAY_REQUEST_ENC         TRUE
#define BLE_LOCAL_PRIVACY_ENABLED     FALSE
#define BLE_VND_INCLUDED              TRUE
#define BLE_DYNAMIC_LATENCY_ENABLED   FALSE

#define MAX_L2CAP_CHANNELS    14
// skips conn update at conn completion
#define BTA_BLE_SKIP_CONN_UPD  FALSE

#define BTA_DM_COD {0x00, BTM_COD_MAJOR_WEARABLE, BTM_COD_MINOR_WRIST_WATCH}

#define BTA_AR_INCLUDED               TRUE
#define A2D_INCLUDED                  TRUE
#define AVDT_INCLUDED                 TRUE
#define AVCT_INCLUDED                 TRUE
#define AVRC_INCLUDED                 TRUE
#define PAN_NAP_DISABLED              TRUE

#define BTA_DM_PM_SNIFF_MAX      2048
#define BTA_DM_PM_SNIFF_MIN      1024
#define BTA_DM_PM_SNIFF_ATTEMPT  4
#define BTA_DM_PM_SNIFF_TIMEOUT  1

#define GAP_TRANSPORT_SUPPORTED       GATT_TRANSPORT_LE
#define GATTP_TRANSPORT_SUPPORTED     GATT_TRANSPORT_LE

#define BTM_DEFAULT_SCAN_TYPE         BTM_SCAN_TYPE_STANDARD


#define AVRC_TG_FEATURES (BTRC_FEAT_METADATA | BTRC_FEAT_ABSOLUTE_VOLUME)

#define AVRC_TG_EVENTS (BTRC_EVT_PLAY_STATUS_CHANGED | \
                        BTRC_EVT_TRACK_CHANGE | BTRC_EVT_AVAL_PLAYER_CHANGE | \
                        BTRC_EVT_ADDR_PLAYER_CHANGE | BTRC_EVT_UIDS_CHANGED)

/* HFP HF CLIENT features */
#define BTHF_CLIENT_FEAT_ECNR  0x00000001 /* Echo cancellation and/or noise reduction */
#define BTHF_CLIENT_FEAT_CLI   0x00000004 /* Caller ID presentation capability */
#define BTHF_CLIENT_FEAT_VOL   0x00000010 /* Remote volume control */
#define BTHF_CLIENT_FEAT_ECS   0x00000020 /* Enhanced Call Status */
#define BTHF_CLIENT_FEAT_CODEC 0x00000080 /* Codec Negotiation */
#define BTHF_CLIENT_FEAT_S4    0x00000200 /* ESCO S4 link setting */

#define BTIF_HF_CLIENT_FEATURES    \
    (BTHF_CLIENT_FEAT_ECNR | \
     BTHF_CLIENT_FEAT_CLI | BTHF_CLIENT_FEAT_VOL | \
     BTHF_CLIENT_FEAT_ECS | BTHF_CLIENT_FEAT_CODEC | \
     BTHF_CLIENT_FEAT_S4)

/* HFP HF features*/
#define BTIF_HF_FEATURES                   \
    (BT_AG_FEAT_ECNR | BT_AG_FEAT_REJECT |  \
     BT_AG_FEAT_ECS | BT_AG_FEAT_EXTERR |   \
     BT_AG_FEAT_HF_IND | BT_AG_FEAT_ESCO |  \
     BT_AG_FEAT_UNAT | BT_AG_FEAT_CODEC)

#endif
