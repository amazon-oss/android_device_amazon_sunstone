#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/amazon/sunstone',
    'hardware/amazon',
    'hardware/mediatek',
    'hardware/mediatek/libmtkperf_client',
]

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
}

blob_fixups: blob_fixups_user_type = {
    ('vendor/bin/hw/android.hardware.keymaster@4.0-service.optee', 'vendor/lib64/libkeymaster4-v30.so',
     'vendor/lib64/libkeymaster4support-v30.so', 'vendor/lib64/libkeymaster_messages-v30.so',
     'vendor/lib64/libkeymaster_portable-v30.so', 'vendor/lib64/libpuresoftkeymasterdevice-v30.so',
     'vendor/lib64/libsoft_attestation_cert-v30.so'): blob_fixup()
        .replace_needed('libkeymaster4.so', 'libkeymaster4-v30.so')
        .replace_needed('libkeymaster4support.so', 'libkeymaster4support-v30.so')
        .replace_needed('libkeymaster_messages.so', 'libkeymaster_messages-v30.so')
        .replace_needed('libkeymaster_portable.so', 'libkeymaster_portable-v30.so')
        .replace_needed('libpuresoftkeymasterdevice.so', 'libpuresoftkeymasterdevice-v30.so')
        .replace_needed('libsoft_attestation_cert.so', 'libsoft_attestation_cert-v30.so'),
    ('vendor/lib/android.hardware.audio.common-util-v30.so', 'vendor/lib/android.hardware.audio.common@6.0-util-v30.so',
     'vendor/lib/hw/audio.primary.mt8188.so', 'vendor/lib/hw/fireos.hardware.audio@6.0-impl.so',
     'vendor/lib/libasp.so', 'vendor/lib/libaudioprimarydevicehalifclient.so', 'vendor/lib/libedgeflow_core.so',
     'vendor/lib/libtensorflowlite_c-v30.so'): blob_fixup()
        .replace_needed('android.hardware.audio.common-util.so', 'android.hardware.audio.common-util-v30.so')
        .replace_needed('android.hardware.audio.common@6.0-util.so', 'android.hardware.audio.common@6.0-util-v30.so')
        .replace_needed('libmedia_helper.so', 'libmedia_helper-v30.so')
        .replace_needed('libtensorflowlite_c.so', 'libtensorflowlite_c-v30.so'),
    'vendor/lib/libMtkOmxVdecEx.so': blob_fixup()
        .add_needed('libui_shim.so'),
    ('vendor/lib/libh264enc_sa.ca7.so', 'vendor/lib/libmp4enc_sa.ca7.so', 'vendor/lib/libthha.so',
     'vendor/lib/libvc1dec_sa.ca7.so', 'vendor/lib/libvcodec_oal.so', 'vendor/lib/libvp8dec_sa.ca7.so',
     'vendor/lib/libvp9dec_sa.ca7.so'): blob_fixup()
        .clear_symbol_version('__aeabi_memclr')
        .clear_symbol_version('__aeabi_memclr4')
        .clear_symbol_version('__aeabi_memcpy')
        .clear_symbol_version('__aeabi_memcpy4')
        .clear_symbol_version('__aeabi_memmove')
        .clear_symbol_version('__aeabi_memset')
        .clear_symbol_version('__gnu_Unwind_Find_exidx'),
    ('vendor/lib/libnvram.so', 'vendor/lib64/libnvram.so'): blob_fixup()
        .add_needed('libbase_shim.so'),
    'vendor/lib64/hw/hwcomposer.mt8188.so': blob_fixup()
        .sig_replace('00 20 80 52 bc 6d 00 94 f9 03 00 aa', '00 a6 81 52'),
}  # fmt: skip

module = ExtractUtilsModule(
    'sunstone',
    'amazon',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
