[Defines]
  PLATFORM_NAME                  = MultiwarePkg
  PLATFORM_GUID                  = 27f17954-7407-5c7f-815f-4312156617ab
  PLATFORM_VERSION               = 1.0.0
  DSC_SPECIFICATION              = 0x00010006
  SUPPORTED_ARCHITECTURES        = X64|IA32
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  OUTPUT_DIRECTORY               = Build/Multiware

[LibraryClasses]
  #
  # Entry Point Libraries
  #
  UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf
  ShellCEntryLib|ShellPkg/Library/UefiShellCEntryLib/UefiShellCEntryLib.inf
  UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf
  #
  # Common Libraries
  #
  BaseLib|MdePkg/Library/BaseLib/BaseLib.inf
  RegisterFilterLib|MdePkg/Library/RegisterFilterLibNull/RegisterFilterLibNull.inf
  BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
  UefiLib|MdePkg/Library/UefiLib/UefiLib.inf
  PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
  DebugPrintErrorLevelLib|MdePkg/Library/BaseDebugPrintErrorLevelLib/BaseDebugPrintErrorLevelLib.inf
  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  MemoryAllocationLib|MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  UefiRuntimeServicesTableLib|MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  ReportStatusCodeLib|MdePkg/Library/BaseReportStatusCodeLibNull/BaseReportStatusCodeLibNull.inf  
  UefiUsbLib|MdePkg/Library/UefiUsbLib/UefiUsbLib.inf
  TimerLib|MdePkg/Library/BaseTimerLibNullTemplate/BaseTimerLibNullTemplate.inf
  DevicePathLib|MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  PeCoffGetEntryPointLib|MdePkg/Library/BasePeCoffGetEntryPointLib/BasePeCoffGetEntryPointLib.inf
  PciLib|MdePkg/Library/BasePciLibCf8/BasePciLibCf8.inf
  PciCf8Lib|MdePkg/Library/BasePciCf8Lib/BasePciCf8Lib.inf
  SynchronizationLib|MdePkg/Library/BaseSynchronizationLib/BaseSynchronizationLib.inf
  UefiRuntimeLib|MdePkg/Library/UefiRuntimeLib/UefiRuntimeLib.inf
  HiiLib|MdeModulePkg/Library/UefiHiiLib/UefiHiiLib.inf
  UefiHiiServicesLib|MdeModulePkg/Library/UefiHiiServicesLib/UefiHiiServicesLib.inf
  PerformanceLib|MdeModulePkg/Library/DxePerformanceLib/DxePerformanceLib.inf
  HobLib|MdePkg/Library/DxeHobLib/DxeHobLib.inf
  FileHandleLib|MdePkg/Library/UefiFileHandleLib/UefiFileHandleLib.inf
  SortLib|MdeModulePkg/Library/UefiSortLib/UefiSortLib.inf
  ShellLib|ShellPkg/Library/UefiShellLib/UefiShellLib.inf
  CacheMaintenanceLib|MdePkg/Library/BaseCacheMaintenanceLib/BaseCacheMaintenanceLib.inf
  FileExplorerLib|MdeModulePkg/Library/FileExplorerLib/FileExplorerLib.inf

  #lbdebug
	DxeServicesLib|MdePkg/Library/DxeServicesLib/DxeServicesLib.inf

  !if $(TARGET) == RELEASE
    DebugLib|MdePkg/Library/BaseDebugLibNull/BaseDebugLibNull.inf
  !else
    !ifdef $(DEBUG_ON_SERIAL_PORT)
      CcProbeLib|MdePkg/Library/CcProbeLibNull/CcProbeLibNull.inf
      TdxLib|MdePkg/Library/TdxLib/TdxLib.inf
      IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsicSev.inf
      SerialPortLib|PcAtChipsetPkg/Library/SerialIoLib/SerialIoLib.inf
      DebugLib|MdePkg/Library/BaseDebugLibSerialPort/BaseDebugLibSerialPort.inf
    !else
      DebugLib|MdePkg/Library/UefiDebugLibConOut/UefiDebugLibConOut.inf
    !endif
  !endif

  IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
  DxeServicesLib|MdePkg/Library/DxeServicesLib/DxeServicesLib.inf
  DxeServicesTableLib|MdePkg/Library/DxeServicesTableLib/DxeServicesTableLib.inf
  S3BootScriptLib|MdeModulePkg/Library/PiDxeS3BootScriptLib/DxeS3BootScriptLib.inf

  #
  # Multiware Libraries
  #
  MwVirtualDiskLib|MultiwarePkg/Library/MwVirtualDiskLib/MwVirtualDiskLib.inf
  MwCommandLib|MultiwarePkg/Library/MwCommandLib/MwCommandLib.inf
  MwFileLib|MultiwarePkg/Library/MwFileLib/MwFileLib.inf
  MwDiskLib|MultiwarePkg/Library/MwDiskLib/MwDiskLib.inf
  MwBootLib|MultiwarePkg/Library/MwBootLib/MwBootLib.inf

[Components]
  MultiwarePkg/Applications/VdBoot/VdBoot.inf
  MultiwarePkg/Applications/RamDisk/RamDisk.inf
  MultiwarePkg/Applications/VirtualDisk/VirtualDisk.inf
#  MultiwarePkg/Applications/BootUI/BootUI.inf
  MultiwarePkg/Applications/Refind/refind.inf

  #
  # Use EDK2 RamDiskDxe.inf
  #
  MdeModulePkg/Universal/Disk/RamDiskDxe/RamDiskDxe.inf  
  MultiwarePkg/Drivers/VirtualDiskDxe/VirtualDiskDxe.inf

[PcdsFixedAtBuild]
  # Enable EDK2 debug features based on the TARGET configuration.
  # https://github.com/tianocore/tianocore.github.io/wiki/EDK-II-Debugging
  !if $(TARGET) == RELEASE
    # No debug code such as DEBUG() / ASSERT(). They will be removed.
    gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x0
    gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x0
  !else
    # Define DEBUG_ERROR | DEBUG_VERBOSE | DEBUG_INFO | DEBUG_WARN to enable
    # logging at those levels. Also, define DEBUG_PROPERTY_ASSERT_DEADLOOP_ENABLED
    # and such. Assertion failure will call CpuDeadLoop.
    gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x80400042
    gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x06
  !endif


!include StdLib/StdLib.inc