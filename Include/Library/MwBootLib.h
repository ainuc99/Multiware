/** @file
 Multiware Virtual Disk Boot Library

 Copyright © 2023 LU WEIFENG (wave.lu@gmail.com). All Rights Reserved.

**/

#ifndef _MW_BOOT_LIB_H
#define _MW_BOOT_LIB_H

#include <Library/MwVdLib.h>

#define VD_STORAGE_KEY_FILENAME L"\\vd.config"

/* VirtualDiskStorage.c */
EFI_STATUS LocateVirtualDiskStorageVolume(EFI_FILE_HANDLE *VDStorageHandle);

/* VirtualDiskBoot.c */
EFI_STATUS MwBoot(VOID);
EFI_STATUS BootVirtualDiskESP(VOID);
EFI_STATUS MwMakeBootDisk(IN VDISK *pVDisk);
VOID VirtualDiskBoot(IN CHAR16 *VdFileName);
EFI_STATUS MwBootEnding(IN OUT VDISK *pVDisk);

#endif // MW_BOOT_LIB_H
