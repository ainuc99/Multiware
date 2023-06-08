#ifndef _MWCOMMANDLIB_H_
#define _MWCOMMANDLIB_H_

#include <Uefi.h>

INTN
GetArgcArgvFromLoadedImage(
    EFI_HANDLE ImageHandle,
    CHAR16 **ResultArgv[]);

#endif