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

offsetUARTDR :: Offset
offsetUARTDR = Offset 0x0


rUARTDR :: Register
rUARTDR = Register "UARTDR" offsetUARTDR RW
 [
  Field "DATA" (Range 0 7),
  Field "FE"   (Single 8),
  Field "PE"   (Single 9),
  Field "BE"   (Single 10),
  Field "OE"   (Single 11),
  Reserved (Range 12 15)
 ]
 
rUARTRSR :: Register
rUARTRSR = Register "UARTRSR" (Offset 0x4) RW
 [
  Field "FE"  (Single 0),
  Field "PE"  (Single 1),
  Field "BE"  (Single 2),
  Field "OE"  (Single 3),
  Field "RESERVED" (Range 4 7),
  Field "UARTECR" (Range 8 15)
 ]
  
rUARTFR :: Register
rUARTFR = Register "UARTFR" (Offset 0x18) RO
 [
  Field "CTS"  (Single 0),
  Field "DSR"  (Single 1),
  Field "DCD"  (Single 2),
  Field "BUSY" (Single 3),
  Field "RXFE" (Single 4),
  Field "TXFF" (Single 5),
  Field "RXFF" (Single 6),
  Field "TXFE" (Single 7),
  Field "RI"   (Single 8),
  Field "-"    (Range 9 15)
 ]
 
 
rUARTILPR :: Register
rUARTILPR = Register "UARTILPR" (Offset 0x20) RW
 [
   Field "ILPDVSR" (Range 0 7)
 ]
  
rUARTIBRD :: Register
rUARTIBRD = Register "UARTIBRD" (Offset 0x24) RW
 [
   Field "BAUD_DIVINT" (Range 0 15)
 ]
  
rUARTFBRD :: Register
rUARTFBRD = Register "UARTFBRD" (Offset 0x28) RW
 [
   Field "BAUD_DIVFRAC" (Range 0 5)
 ]
 
rUARTLCRH :: Register 
rUARTLCRH = Register "UARTLCRH" (Offset 0x2C) RW
 [
   Field "BRK" (Single 0),
   Field "PEN" (Single 1),
   Field "EPS" (Single 2),
   Field "STP2" (Single 3),
   Field "FEN" (Single 4),
   Field "WLEN" (Range 5 6),
   Field "SPS" (Single 7),
   Reserved (Range 8 15)
 ]

 
rUARTCR :: Register
rUARTCR = Register "UARTCR" (Offset 0x30) RW
 [
   Field "UARTEN" (Single 0),
   Field "SIREN" (Single 1),
   Field "SIRLP" (Single 2),
   Reserved (Range 3 6),
   Field "LBE"   (Single 7),
   Field "TXE"   (Single 8),
   Field "RXE"   (Single 9),
   Field "DTR"   (Single 10),
   Field "RTS"   (Single 11),
   Field "Out1"  (Single 12),
   Field "Out2"  (Single 13),
   Field "RTSEn" (Single 14),
   Field "CTSEn" (Single 15)
 ]
 
rUARTIFLS :: Register 
rUARTIFLS = Register "UARTIFLS" (Offset 0x34) RW
 [
   Field "TXIFLSEL" (Range 0 2),
   Field "RXIFLSEL" (Range 3 5),
   Reserved (Range 6 15)
 ]


rUARTIMSC :: Register
rUARTIMSC = Register "UARTIMSC" (Offset 0x38) RW
 [
   Field "RIMIM"  (Single 0),
   Field "CTSMIM" (Single 1),
   Field "DCDMIM" (Single 2),
   Field "DSRMIM" (Single 3),
   Field "RXIM"   (Single 4),
   Field "TXIM"   (Single 5),
   Field "RTIM"   (Single 6),
   Field "FEIM"   (Single 7),
   Field "PEIM"   (Single 8),
   Field "BEIM"   (Single 9),
   Field "OEIM"   (Single 10),
   Reserved (Range 11 15)
 ]


rUARTRIS :: Register
rUARTRIS = Register "UARTRIS" (Offset 0x3C) RO
 [
   Field "RIRMIS"  (Single 0),
   Field "CTSRMIS" (Single 1),
   Field "DCDRMIS" (Single 2),
   Field "DSRRMIS" (Single 3),
   Field "RXRIS"   (Single 4),
   Field "TXRIS"   (Single 5),
   Field "RTRIS"   (Single 6),
   Field "FERIS"   (Single 7),
   Field "PERIS"   (Single 8),
   Field "BERIS"   (Single 9),
   Field "OERIS"   (Single 10),
   Reserved (Range 11 15)
 ]


rUARTMIS :: Register
rUARTMIS = Register "UARTMIS" (Offset 0x40) RO
 [
   Field "RIMMIS"  (Single 0),
   Field "CTSMMIS" (Single 1),
   Field "DCDMMIS" (Single 2),
   Field "DSRMMIS" (Single 3),
   Field "RXMIS"   (Single 4),
   Field "TXMIS"   (Single 5),
   Field "RTMIS"   (Single 6),
   Field "FEMIS"   (Single 7),
   Field "PEMIS"   (Single 8),
   Field "BEMIS"   (Single 9),
   Field "OEMIS"   (Single 10),
   Reserved (Range 11 15)
 ]


rUARTICR :: Register
rUARTICR = Register "UARTICR" (Offset 0x44) WO
 [
   Field "RIMIC"   (Single 0),
   Field "CTSMIC"  (Single 1),
   Field "DCDMMIC" (Single 2),
   Field "DSRMIC"  (Single 3),
   Field "RXIC"    (Single 4),
   Field "TXIC"    (Single 5),
   Field "RTIC"    (Single 6),
   Field "FEIC"    (Single 7),
   Field "PEIC"    (Single 8),
   Field "BEIC"    (Single 9),
   Field "OEIC"    (Single 10),
   Reserved (Range 11 15)
 ]


rUARTDMACR :: Register
rUARTDMACR = Register "UARTDMACR" (Offset 0x48) RW
 [
   Field "RXDMAE"   (Single 0),
   Field "TXDMAE"   (Single 1),
   Field "DMAONERR" (Single 2),
   Reserved (Range 3 15)
 ]
