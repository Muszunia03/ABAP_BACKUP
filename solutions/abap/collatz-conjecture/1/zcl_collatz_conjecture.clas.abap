CLASS zcl_collatz_conjecture DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS ret_steps IMPORTING num          TYPE i
                      RETURNING VALUE(steps) TYPE i
                      RAISING   cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_collatz_conjecture IMPLEMENTATION.
  METHOD ret_steps.
    DATA lv_num TYPE i.
    steps = 0.

    IF num <= 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    lv_num = num.

    WHILE lv_num <> 1.
      IF lv_num MOD 2 = 0.
        lv_num = lv_num / 2.
      ELSE.
        lv_num = lv_num * 3 + 1.
      ENDIF.
      steps = steps + 1.
    ENDWHILE.
  ENDMETHOD.
ENDCLASS.
