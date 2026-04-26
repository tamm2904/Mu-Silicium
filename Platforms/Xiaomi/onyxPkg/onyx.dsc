##
#  Copyright (c) Microsoft Corporation. SPDX-License-Identifier: BSD-2-Clause-Patent
##
[Defines]
  PLATFORM_NAME                  = onyx
  PLATFORM_GUID                  = 7A3F8B2E-D419-4C1A-9E87-2F6345B78CDA
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/onyxPkg
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = RELEASE|DEBUG
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = onyxPkg/onyx.fdf
  USE_CUSTOM_DISPLAY_DRIVER      = 0

  # 0 = SM8635
  SOC_TYPE                       = 0

[PcdsFixedAtBuild]
  # DDR Start Address
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000

  # UEFI Stack Addresses
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0xA760D000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000

  # Device GUID
  gSiliciumPkgTokenSpaceGuid.PcdDeviceGuid|{ 0x7A, 0x3F, 0x8B, 0x2E, 0xD4, 0x19, 0x4C, 0x1A, 0x9E, 0x87, 0x2F, 0x63, 0x45, 0xB7, 0x8C, 0xDA }

  # SmBios
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemManufacturer|"Xiaomi"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemModel|"Redmi Turbo 4 Pro"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemRetailModel|"onyx"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemRetailSku|"Redmi_Turbo_4_Pro_onyx"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosBoardModel|"Redmi Turbo 4 Pro"

  # Simple Frame Buffer (1.5K display, same as peridot/Poco F6)
  gSiliciumPkgTokenSpaceGuid.PcdFrameBufferWidth|1220
  gSiliciumPkgTokenSpaceGuid.PcdFrameBufferHeight|2712
  gSiliciumPkgTokenSpaceGuid.PcdFrameBufferColorDepth|32

  # Platform Pei
  gQcomPkgTokenSpaceGuid.PcdPlatformType|"LA"
  gQcomPkgTokenSpaceGuid.PcdScheduleInterfaceAddr|0xA703FD38
  gQcomPkgTokenSpaceGuid.PcdDtbExtensionAddr|0xA703F0E8

  # Dynamic RAM Start Address
  gSiliciumPkgTokenSpaceGuid.PcdRamPartitionBase|0xE6440000

  # SD Card Slot
  gQcomPkgTokenSpaceGuid.PcdInitCardSlot|FALSE

[LibraryClasses]
  MemoryMapLib|onyxPkg/Library/MemoryMapLib/MemoryMapLib.inf
  ConfigurationMapLib|onyxPkg/Library/ConfigurationMapLib/ConfigurationMapLib.inf
  AcpiDeviceUpdateLib|SiliciumPkg/Library/AcpiDeviceUpdateLibNull/AcpiDeviceUpdateLibNull.inf

!include PalawanPkg/PalawanPkg.dsc.inc
