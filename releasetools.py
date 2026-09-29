#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

import common


def AddImage(info, basename, dest):
    data = info.input_zip.read('IMAGES/' + basename)
    common.ZipWriteStr(info.output_zip, basename, data)
    info.script.AppendExtra(f'package_extract_file("{basename}", "{dest}");')


def FullOTA_InstallEnd(info):
    AddImage(info, 'dtbo.img', '/dev/block/by-name/dtbo')
    AddImage(info, 'vendor_boot.img', '/dev/block/by-name/vendor_boot')
