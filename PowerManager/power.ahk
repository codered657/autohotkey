;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;   Power Manager Script 
;   
;   Description:
;       This script provides power management features,including the ability to
;       enable/disable devices
;
;   Keys:
;       Win+Z: Enable/disable power-hogging devices;
;
;   Revision History:
;       08/31/2012  Steven Okai     Initial revision.
;       09/01/2012  Steven Okai     Added Firewire to devices.
;                                   Added FaceTime camera entry in system devices.
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

; Keeps track of the current power mode
powerMode = 1 ;

; Win+Z
; Toggles power hogging devices on/off
#z::

    if (powerMode = 1)
    {
        Run devcon disable "USB\VID_05AC&PID_8242&REV_0016" ,, hide         ; Disable Apple IR Receiver
        Run devcon disable "USB\VID_05AC&PID_8509&REV_0516&MI_00" ,, hide  ; Disable FaceTime Camera
        Run devcon disable "USB\VID_05AC&PID_8509&REV_0516&MI_02" ,, hide  ; and its entry under system devices
        Run devcon disable "PCI\VEN_14E4&DEV_16BC&SUBSYS_000014E4&REV_10" ,, hide  ; Disable Broadcom SD Host Controller
        Run devcon disable "HDAUDIO\FUNC_01&VEN_1013&DEV_4206&SUBSYS_106B1C00&REV_1003" ,, hide ; Disable Cirrus Logic CS4206A
        Run devcon disable "USB\VID_05AC&PID_821A&REV_0037" ,, hide; Disable Apple Broadcom Built-in Bluetooth
        Run devcon disable "IDE\CdRomMATSHITA_DVD-R___UJ-898_________________HE13____" ,, hide ; Disable Matshita DVD-R
        Run devcon disable "PCI\VEN_14E4&DEV_16B4&SUBSYS_16B414E4&REV_10" ,, hide ; Disable Broadcom NetXtreme Gigabit Ethernet
        Run devcon disable "PCI\VEN_11C1&DEV_5901&SUBSYS_590011C1&REV_08" ,, hide ; Disable IEEE 1394 (Firewire)

        ; Change the power mode
        powerMode = 0 ;
        
        ; Print message
        MsgBox, 0, Power Manager, Entering low power mode.
        
    } else {
        Run devcon enable "USB\VID_05AC&PID_8242&REV_0016" ,, hide         ; Enable Apple IR Receiver
        Run devcon enable "USB\VID_05AC&PID_8509&REV_0516&MI_00" ,, hide  ; Enable FaceTime Camera
        Run devcon enable "USB\VID_05AC&PID_8509&REV_0516&MI_02" ,, hide ; and its entry under system devices
        Run devcon enable "PCI\VEN_14E4&DEV_16BC&SUBSYS_000014E4&REV_10" ,, hide  ; Enable Broadcom SD Host Controller
        Run devcon enable "HDAUDIO\FUNC_01&VEN_1013&DEV_4206&SUBSYS_106B1C00&REV_1003" ,, hide ; Enable Cirrus Logic CS4206A
        Run devcon enable "IDE\CdRomMATSHITA_DVD-R___UJ-898_________________HE13____" ,, hide ; Enable Matshita DVD-R
        Run devcon enable "PCI\VEN_14E4&DEV_16B4&SUBSYS_16B414E4&REV_10" ,, hide ; Enable Broadcom NetXtreme Gigabit Ethernet
        Run devcon enable "PCI\VEN_11C1&DEV_5901&SUBSYS_590011C1&REV_08" ,, hide ; Enable IEEE 1394 (Firewire)
        
        ; Change the power mode
        powerMode = 1 ;
        
        ; Print message
        MsgBox, 0, Power Manager, Entering high power mode.
        
    }

return
