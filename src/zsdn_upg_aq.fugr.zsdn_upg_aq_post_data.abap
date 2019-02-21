FUNCTION ZSDN_UPG_AQ_POST_DATA.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  TABLES
*"      IT_UPG_AQ STRUCTURE  ZSDN_UPG_AQ
*"  EXCEPTIONS
*"      ERROR_HAPPENED
*"----------------------------------------------------------------------
MODIFY zsdn_upg_aq FROM TABLE it_upg_aq.
IF sy-subrc <> 0.
  RAISE error_happened.
ENDIF.





ENDFUNCTION.
