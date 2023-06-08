/** @file
 Multiware File Library

 Copyright © 2023 LU WEIFENG (wave.lu@gmail.com). All Rights Reserved.

**/

#ifndef _MW_FILE_LIB_H
#define _MW_FILE_LIB_H

/* OpenVirtualDiskFile.c */
EFI_STATUS OpenVirtualDiskFile(IN CHAR16 *FName,
                               OUT EFI_FILE_HANDLE *VirtualDiskHandle);

#endif // MW_FILE_LIB_H
