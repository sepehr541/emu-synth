module PL011Registers
    (
      rUARTDR,
      rUARTRSR,
      rUARTFR,
      rUARTILPR,
      rUARTIBRD,
      rUARTFBRD,
      rUARTLCRH,
      rUARTCR,
      rUARTIFLS,
      rUARTIMSC,
      rUARTRIS,
      rUARTMIS,
      rUARTICR,
      rUARTDMACR
    ) where

import Lib

rUARTDR :: Register
rUARTDR = Register "UARTDR" 0x0 RW
 [
  MultiBit "DATA"  0 7,
  SingleBit "FE" 8,
  SingleBit "PE" 9,
  SingleBit "BE" 10,
  SingleBit "OE" 11,
  MultiBit "-" 12 15
 ]
 
rUARTRSR :: Register
rUARTRSR = Register "UARTRSR" 0x4 RW
 [
  SingleBit "FE" 0,
  SingleBit "PE" 1,
  SingleBit "BE" 2,
  SingleBit "OE" 3,
  MultiBit "RESERVED" 4 7,
  MultiBit "UARTECR" 8 15
 ]
  
rUARTFR :: Register
rUARTFR = Register "UARTFR" 0x18 RO
 [
  SingleBit "CTS" 0,
  SingleBit "DSR" 1,
  SingleBit "DCD" 2,
  SingleBit "BUSY" 3,
  SingleBit "RXFE" 4,
  SingleBit "TXFF" 5,
  SingleBit "RXFF" 6,
  SingleBit "TXFE" 7,
  SingleBit "RI" 8,
  MultiBit "-" 9 15
 ]
 
 
rUARTILPR :: Register
rUARTILPR = Register "UARTILPR" 0x20 RW
 [
   MultiBit "ILPDVSR" 0 7
 ]
  
rUARTIBRD :: Register
rUARTIBRD = Register "UARTIBRD" 0x24 RW
 [
   MultiBit "BAUD_DIVINT" 0 15
 ]
  
rUARTFBRD :: Register
rUARTFBRD = Register "UARTFBRD" 0x28 RW
 [
   MultiBit "BAUD_DIVFRAC" 0 5
 ]
 
rUARTLCRH :: Register 
rUARTLCRH = Register "UARTLCRH" 0x2C RW
 [
   SingleBit "BRK" 0,
   SingleBit "PEN" 1,
   SingleBit "EPS" 2,
   SingleBit "STP2" 3,
   SingleBit "FEN" 4,
   MultiBit "WLEN" 5 6,
   SingleBit "SPS" 7,
   MultiBit "-" 8 15
 ]

 
rUARTCR :: Register
rUARTCR = Register "UARTCR" 0x30 RW
 [
   SingleBit "UARTEN" 0,
   SingleBit "SIREN" 1,
   SingleBit "SIRLP" 2,
   MultiBit "-" 3 6,
   SingleBit "LBE" 7,
   SingleBit "TXE" 8,
   SingleBit "RXE" 9,
   SingleBit "DTR" 10,
   SingleBit "RTS" 11,
   SingleBit "Out1" 12,
   SingleBit "Out2" 13,
   SingleBit "RTSEn" 14,
   SingleBit "CTSEn" 15
 ]
 
rUARTIFLS :: Register 
rUARTIFLS = Register "UARTIFLS" 0x34 RW
 [
   MultiBit "TXIFLSEL" 0 2,
   MultiBit "RXIFLSEL" 3 5,
   MultiBit "-" 6 15
 ]


rUARTIMSC :: Register
rUARTIMSC = Register "UARTIMSC" 0x38 RW
 [
   SingleBit "RIMIM" 0,
   SingleBit "CTSMIM" 1,
   SingleBit "DCDMIM" 2,
   SingleBit "DSRMIM" 3,
   SingleBit "RXIM" 4,
   SingleBit "TXIM" 5,
   SingleBit "RTIM" 6,
   SingleBit "FEIM" 7,
   SingleBit "PEIM" 8,
   SingleBit "BEIM" 9,
   SingleBit "OEIM" 10,
   MultiBit "-" 11 15
 ]


rUARTRIS :: Register
rUARTRIS = Register "UARTRIS" 0x3C RO
 [
   SingleBit "RIRMIS" 0,
   SingleBit "CTSRMIS" 1,
   SingleBit "DCDRMIS" 2,
   SingleBit "DSRRMIS" 3,
   SingleBit "RXRIS" 4,
   SingleBit "TXRIS" 5,
   SingleBit "RTRIS" 6,
   SingleBit "FERIS" 7,
   SingleBit "PERIS" 8,
   SingleBit "BERIS" 9,
   SingleBit "OERIS" 10,
   MultiBit "-" 11 15
 ]


rUARTMIS :: Register
rUARTMIS = Register "UARTMIS" 0x40 RO
 [
   SingleBit "RIMMIS" 0,
   SingleBit "CTSMMIS" 1,
   SingleBit "DCDMMIS" 2,
   SingleBit "DSRMMIS" 3,
   SingleBit "RXMIS" 4,
   SingleBit "TXMIS" 5,
   SingleBit "RTMIS" 6,
   SingleBit "FEMIS" 7,
   SingleBit "PEMIS" 8,
   SingleBit "BEMIS" 9,
   SingleBit "OEMIS" 10,
   MultiBit "-" 11 15
 ]


rUARTICR :: Register
rUARTICR = Register "UARTICR" 0x44 WO
 [
   SingleBit "RIMIC" 0,
   SingleBit "CTSMIC" 1,
   SingleBit "DCDMMIC" 2,
   SingleBit "DSRMIC" 3,
   SingleBit "RXIC" 4,
   SingleBit "TXIC" 5,
   SingleBit "RTIC" 6,
   SingleBit "FEIC" 7,
   SingleBit "PEIC" 8,
   SingleBit "BEIC" 9,
   SingleBit "OEIC" 10,
   MultiBit "-" 11 15
 ]


rUARTDMACR :: Register
rUARTDMACR = Register "UARTDMACR" 0x48 RW
 [
   SingleBit "RXDMAE" 0,
   SingleBit "TXDMAE" 1,
   SingleBit "DMAONERR" 2,
   MultiBit "-" 3 15
 ]
