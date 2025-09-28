CLASS zcl_isogram DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS is_isogram
      IMPORTING
        VALUE(phrase)        TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_isogram IMPLEMENTATION.

  METHOD is_isogram.

    DATA lv_lower_phrase TYPE string.
    DATA seen_letters    TYPE string.
    DATA lv_char         TYPE c LENGTH 1.
    DATA lv_idx          TYPE i.

    lv_lower_phrase = to_lower( phrase ).

    IF lv_lower_phrase IS INITIAL.
      result = abap_true.
      RETURN.
    ENDIF.

    DO strlen( lv_lower_phrase ) TIMES.
      lv_idx = sy-index - 1.
      lv_char = lv_lower_phrase+lv_idx(1).

      IF lv_char = ' ' OR lv_char = '-'.
        CONTINUE.
      ENDIF.

      FIND lv_char IN seen_letters.
      IF sy-subrc = 0.
        result = abap_false.
        RETURN.
      ENDIF.

      CONCATENATE seen_letters lv_char INTO seen_letters.
    ENDDO.

    result = abap_true.

  ENDMETHOD.

ENDCLASS.

