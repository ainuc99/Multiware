/** @file
 Multiware Virtual Disk Library

 Copyright © 2023 LU WEIFENG (wave.lu@gmail.com). All Rights Reserved.

**/

#ifndef _MW_VD_LIB_H
#define _MW_VD_LIB_H

#include <Uefi.h>
#include <Library/BaseLib.h>
#include <Library/FileHandleLib.h>

typedef struct VDISK
{
  /** Virtual Disks Volume Handle*/
  EFI_FILE_HANDLE RootHandle;
  /** Virtual Disk Image file name. */
  CHAR16 *Filename;
  /** The mode to open the file. */
  UINT64 OpenMode;
  /** Only valid for EFI_FILE_MODE_CREATE, in which case these are the attribute bits for the newly created file. */
  UINT64 OpenAttributes;
  /** Image file handle **/
  EFI_FILE_HANDLE FileHandle;
  /** Total size of the image. */
  UINT64 FileSize;
  /** Virtual Disk type */
  UINT8 VDType;
  /** Virtual Disk private data */
  VOID *PrivateData;
} VDISK;

/* VD.c */
EFI_STATUS VdOpen(IN VDISK *VDisk);
EFI_STATUS VdClose(IN VDISK *VDisk);
EFI_STATUS VdDump(IN VDISK *VDisk);
EFI_STATUS VdRead(IN VDISK *VDisk,
                   IN EFI_LBA Lba,
                   IN UINTN BufferSize,
                   IN OUT VOID *Buffer);
EFI_STATUS VdIoRead(IN VDISK *VDisk,
                        IN EFI_LBA Lba,
                        IN UINTN BufferSize,
                        IN OUT VOID *Buffer);

#endif // MW_VD_LIB_H
