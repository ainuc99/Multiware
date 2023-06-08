/** @file
 Multiware Disk Library

 Copyright © 2023 LU WEIFENG (wave.lu@gmail.com). All Rights Reserved.

**/

#ifndef _MW_DISK_LIB_H
#define _MW_DISK_LIB_H

/* DiskPartition.c */
UINTN showpart(IN VOID *startaddr);
BOOLEAN IsGptDisk(IN VOID *DiskStartAddr);
EFI_STATUS EFIAPI DumpGptHeader(IN VOID *DiskStartAddr);
EFI_STATUS EFIAPI DumpGptPartitions(IN VOID *DiskStartAddr);
EFI_STATUS EFIAPI FindSystemPartition(IN VOID *DiskStartAddr,
                                      OUT UINT64 *StartingLBA,
                                      OUT UINT64 *EndingLBA);
EFI_STATUS EFIAPI LoadVirtualDiskGpt(IN EFI_FILE_HANDLE VDHandle,
                                     OUT VOID **DiskStartAddr);
EFI_STATUS CleanGptPartition(IN VOID *DiskStartAddr);
EFI_STATUS UpdateGptHeader(IN VOID *DiskStartAddr, EFI_LBA LastLBA);
EFI_STATUS FillBackupGptData(IN VOID *DiskStartAddr, EFI_LBA LastLBA);
#endif // MW_DISK_LIB_H
