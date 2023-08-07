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
// Disables read remote device feature
#define MAX_ACL_CONNECTIONS   16
#define MAX_L2CAP_CHANNELS    64
#define BLE_VND_INCLUDED   TRUE
#define GATT_MAX_PHY_CHANNEL  10
// skips conn update at conn completion
#define BT_CLEAN_TURN_ON_DISABLED 1

#define AVDT_NUM_SEPS 35

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
