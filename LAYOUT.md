云固件磁盘布局
=============

云固件在非固化到BIOS时，支持三种磁盘模式，其中第一种布局即标准模式为内置硬盘布局，外置U盘（SSD移动硬盘）为第二种布局，第三种布局为安装U盘。这三种布局按照使用目的，存在不同的磁盘及文件设计布局。以下按照不同类型分别进行描述。

## 标准模式（内置硬盘布局） ##

IA32，X64，AArch使用相同的文件名，在部署时选择对应的版本，在单个系统上不存在两种不同的运行模式。

标准模式下，启动硬盘分成两个分区，包括ESP启动分区和VDs存储分区，用户可根据需要在VDs分区后划分DATA分区用来存储跨镜像的数据。

ESP分区大小原则上不超过100M，足够用来存储云固件启动程序。VDs分区根据需要可以调整大小，由于标准镜像一般按照256G大小进行创建，因此VDs分区一般情况下不应该小于256G。

### ESP分区 ###

以下文件使用X64为例

```
EFI - BOOT
      |     - BOOTX64.efi
    - MULTIWARE
      |     - MW.efi
      |     - MW.config
      |     - icons
      |       |     - func_reset.png
      |       |     - func_shutdown.png
      |       ...
      |       \     - mouse.png
      |     - drivers
      |       |     - ntfs.efi
      |       \     - RamDiskDxe.efi
      |     - tools
      |       |     - shell.efi
      |     - images
      |       |     - background.png
      |       ...
      \       \     - selection_big.png
```

### VDs分区 ###

```
mw.config
00000001 
    |    - menu.config
    |    - icon.png
    ...
    \    - xxxx.vhd
10101010 
    |    - menu.config
    |    - icon.png
    ...
    \    - xxxx.vhd
...
ffffffff 
    |    - menu.config
    |    - icon.png
    ...
    \    - xxxx.vhd
```

## 移动模式（外置U盘） ##

## 安装模式（安装U盘） ##