*&---------------------------------------------------------------------*
*& Report  ZSDN_UPG_AQ_ADM
*&
*&---------------------------------------------------------------------*
*----------------------------------------------------------------------*
* This report would help the customer in the conversion of AQ* report
* transactions during a Release Upgrade
* See SAP Note 393160 - SAP Query: Using queries
*----------------------------------------------------------------------*
* Report Name: AQ* report transactions conversion (SAP Note 393160)    *
* Created by: TECHEDGE (Andrea Olivieri)                               *
* Created on: 12.12.2014 at 10:02:57 CET                               *
*----------------------------------------------------------------------*
REPORT zsdn_upg_aq_adm.
TABLES: sscrfields, trdirt.

DATA: pbtext(79),
      ltext  LIKE trdirt-text,
      lrep(30),
      name   LIKE trdir-name,
      len    TYPE i.
* Makro
DEFINE get_pbtext.
  select single text from trdirt into &3
         where name  = &1
         and   sprsl = &2.
  CONCATENATE &4 &3 into &5.
END-OF-DEFINITION.

DEFINE sub.
  submit (&1) via selection-screen and return.
END-OF-DEFINITION.

SELECTION-SCREEN: BEGIN OF BLOCK 01 WITH FRAME TITLE text-bl1.
SELECTION-SCREEN PUSHBUTTON /10(79) ZSDN1  USER-COMMAND ZSDN1.
SELECTION-SCREEN SKIP.
SELECTION-SCREEN PUSHBUTTON /10(79) ZSDN2  USER-COMMAND ZSDN2.
SELECTION-SCREEN SKIP.
SELECTION-SCREEN PUSHBUTTON /10(79) ZSDN3  USER-COMMAND ZSDN3.
SELECTION-SCREEN: END OF BLOCK 01.


AT SELECTION-SCREEN OUTPUT.
  get_pbtext 'ZSDN_UPG_AQ_REPORTS_DECODE'    'E' ltext '@KG@' ZSDN1.
  get_pbtext 'ZSDN_UPG_AQ_TCODE_CONV'        'E' ltext '@BV@' ZSDN2.
  get_pbtext 'ZSDN_UPG_AQ_TCODE_CHECK'       'E' ltext '@38@' ZSDN3.

**
AT SELECTION-SCREEN.

  CASE sscrfields-ucomm.
    WHEN 'ZSDN1'.
      name = 'ZSDN_UPG_AQ_REPORTS_DECODE'.    sub name.
    WHEN 'ZSDN2'.
      name = 'ZSDN_UPG_AQ_TCODE_CONV'. sub name.
    WHEN 'ZSDN3'.
      name = 'ZSDN_UPG_AQ_TCODE_CHECK'. sub name.
    WHEN OTHERS.
      EXIT.
  ENDCASE.
