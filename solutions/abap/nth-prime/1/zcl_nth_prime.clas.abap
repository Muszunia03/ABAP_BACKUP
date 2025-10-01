CLASS zcl_nth_prime DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS prime
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_nth_prime IMPLEMENTATION.

  METHOD prime.
    DATA: lv_count TYPE i VALUE 0,
          lv_num   TYPE i VALUE 1,
          lv_div   TYPE i,
          lv_is_prime TYPE abap_bool.

    IF input <= 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    WHILE lv_count < input.
      lv_num = lv_num + 1.
      lv_is_prime = abap_true.

      DO lv_num - 1 TIMES.
        lv_div = sy-index + 1. " 1..lv_num-1
        IF lv_div * lv_div > lv_num.
          EXIT.
        ENDIF.
        IF lv_num MOD lv_div = 0.
          lv_is_prime = abap_false.
          EXIT.
        ENDIF.
      ENDDO.

      IF lv_is_prime = abap_true.
        ADD 1 TO lv_count.
      ENDIF.
    ENDWHILE.

    result = lv_num.
  ENDMETHOD.

ENDCLASS.


