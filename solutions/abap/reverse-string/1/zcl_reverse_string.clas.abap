CLASS zcl_reverse_string DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_reverse_string IMPLEMENTATION.

METHOD reverse_string.

  DATA: lv_char TYPE c LENGTH 1,
        lv_len  TYPE i,
        lv_index TYPE i.

  IF input IS INITIAL.
    result = ''.
  ELSE.
    result = ''.
    lv_len = strlen( input ).

    DO lv_len TIMES.
      lv_index = lv_len - sy-index.
      lv_char = input+lv_index(1).
      CONCATENATE result lv_char INTO result RESPECTING BLANKS.
    ENDDO.
  ENDIF.

ENDMETHOD.


ENDCLASS.
