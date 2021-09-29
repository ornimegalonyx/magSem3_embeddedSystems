#include "xsysmon.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xuartlite.h"
#include "xil_printf.h"
#include "stdio.h"

#define UARTLITE_DEVICE_ID XPAR_UARTLITE_0_DEVICE_ID
#define UARTLITE_BASEADDR XPAR_UARTLITE_0_BASEADDR

#define SYSMON_DEVICE_ID XPAR_SYSMON_0_DEVICE_ID
#define SYSMON_BASEADDR XPAR_SYSMON_0_BASEADDR

#define BUFFER_SIZE 1

XUartLite UartLite;
XSysMon SysMonInst;

int main(void) {
  int Status;
  XSysMon_Config* ConfigPtr;
  u32 TempRawData;
  float TempData;
  XSysMon* SysMonInstPtr = &SysMonInst;
  u8 buffer[BUFFER_SIZE];

  ConfigPtr = XSysMon_LookupConfig(SYSMON_DEVICE_ID);
  if (ConfigPtr == NULL) {
    return XST_FAILURE;
  }
  XSysMon_CfgInitialize(SysMonInstPtr, ConfigPtr,
    ConfigPtr->BaseAddress);
  Status = XSysMon_SelfTest(SysMonInstPtr);
  if (Status != XST_SUCCESS) {
    return XST_FAILURE;
  }

  Status = XUartLite_Initialize(&UartLite, UARTLITE_DEVICE_ID);
  if (Status != XST_SUCCESS) {
    return XST_FAILURE;
  }
  Status = XUartLite_SelfTest(&UartLite);
  if (Status != XST_SUCCESS) {
    return XST_FAILURE;
  }

  while (1) {
    TempRawData = XSysMon_GetAdcData(SysMonInstPtr, XSM_CH_TEMP);
    TempData = XSysMon_RawToTemperature(TempRawData);
    buffer[0] = (u8)TempData;
    XUartLite_Send(&UartLite, buffer, BUFFER_SIZE);
  }
  return 0;
}
