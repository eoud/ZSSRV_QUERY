FUNCTION ZSDN_UPG_AQ_CONV_TCODE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  TABLES
*"      IT_UPG_AQ STRUCTURE  ZSDN_UPG_AQ
*"      IT_TSTC STRUCTURE  TSTC
*"      IT_TSTCC STRUCTURE  TSTCC
*"      IT_TSTCP STRUCTURE  TSTCP
*"  EXCEPTIONS
*"      ERROR_HAPPENED
*"----------------------------------------------------------------------
MODIFY zsdn_upg_aq FROM TABLE it_upg_aq.
  IF sy-subrc <> 0.
    RAISE error_happened.
  ENDIF.
  IF NOT it_tstc[] IS INITIAL.
    MODIFY tstc FROM TABLE it_tstc.
    IF sy-subrc <> 0.
      RAISE error_happened.
    ENDIF.
  ENDIF.
  IF NOT it_tstcc[] IS INITIAL.
    MODIFY tstcc FROM TABLE it_tstcc.
    IF sy-subrc <> 0.
      RAISE error_happened.
    ENDIF.
  ENDIF.
  IF NOT it_tstcc[] IS INITIAL.
    MODIFY tstcp FROM TABLE it_tstcp.
    IF sy-subrc <> 0.
      RAISE error_happened.
    ENDIF.
  ENDIF.





ENDFUNCTION.
