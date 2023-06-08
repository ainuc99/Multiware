云固件代码架构
=============

## 函数库 ##

云固件提供了多个函数库来简化multiware主程序的业务逻辑。这些函数库包括BootLib，DiskLib，VirtualDiskLib等。

### MwBootLib ###

BootLib提供了云固件的虚拟磁盘启动相关函数。对接的上层可以是BootUI主界面、InstallUI主界面和VirtualDisk命令行。

BootLib屏蔽了VD启动过程中的具体逻辑，包括：
- 查找VD文件
- 分析VD文件
- 解析VD中的磁盘分区结构
- 查找VD中的ESP分区
- 重建包含ESP的内存盘
- 启动内存盘

BootLib也需要处理针对Windows平台、Linux平台等操作系统内UEFI启动管理器对VD启动支持不足的问题提供解决代码。
- 通过RT传递VD文件及路径名称、磁盘分区、磁盘格式等信息
- 解决Ubuntu系统ESP分区下GRUB配置信息不完整

### MwDiskLib ###

DiskLib提供对物理磁盘和虚拟磁盘的读写和解析函数。对物理磁盘或者两者通用的函数不使用特定前缀，对虚拟磁盘的函数冠以Vd前缀。

### MwVirtualDiskLib ###

VirtualDiskLib提供了对多种虚拟磁盘镜像文件的具体实现代码，并通过VD.c提供了统一的接口，上层VD调用程序无须了解底层具体实现逻辑。

目前支持VHD格式的Fixed、Dynamic两种格式。Difference格式后续提供支持。

## 驱动程序 ##

云固件驱动程序提供独立的DXE级别的程序来辅助云固件前端实现安装和运行功能。目前包含NtfsDxe和VirtualDiskDxe两个驱动程序。

### NtfsDxe ###

实现NTFS磁盘格式的读写功能。目前内置的UEFI BIOS通常不包含NTFS驱动或者只包含NTFS只读驱动，云固件需要对NTFS分区进行写操作，因此需要引入本读写驱动来替代内置的非完整功能驱动。

### VirtualDiskDxe ###

本驱动提供了对虚拟磁盘镜像文件的DiskIo/2、BlockIo/2规范支持，配合VirtualDisk.efi程序，可实现完整的磁盘功能。

VirtualDiskDxe.efi仅在特定情况下提供给用户使用。

## 工具集 ##

TBD