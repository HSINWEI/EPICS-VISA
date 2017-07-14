# VISAdrv - EPICS asyn driver interface to National Instruments VISA library

The module creates an equivalent to the drvAsynSerialPortConfigure() command called drvAsynVISAPortConfigure()
which can be used to connect to serial devices served by National Instruments VISA. If the device is a
serial device then asynSetOption() etc. can be used as normal. You can also use drvAsynVISAPortConfigure() to
access National Instruments GPIB 488.2 devices such as GPIB/ENET 100

To add this module to an existing driver then you need to follow some of the steps taken in the
VISAdrvTestApp directory. You will need to (see VISAdrvTestApp/src/build.mak): 

Add    VISAdrv.dbd   to the _DBD list 

Add    VISAdrv  to the _LIBS list 

You should also add the line 

    include $(TOP)/visa_lib.mak

To link against the system VISA library (this is only strictly needed for static builds)


Then to configure the driver in the IOC at boot time (see iocsBoot/iocVISAdrvtest/st.cmd) use a command like:

    # local serial port (NI MAX name)
    drvAsynVISAPortConfigure("L0", "ASRL5::INSTR")

    # local serial port (alias)
    drvAsynVISAPortConfigure("L0", "COM5")

    # GPIB device added to local device list 
    drvAsynVISAPortConfigure("L0", "GPIB0::3::INSTR")

    # Remote System: GPIB device added to remote PC and served from there using NI VISA Server 
    drvAsynVISAPortConfigure("L0", "visa://remotecomputer/GPIB0::3::INSTR")


where L0 is you asyn port name followed by the local or remote VISA name of your device (see NI Measurement and Automation explorer if you don't know the name)

