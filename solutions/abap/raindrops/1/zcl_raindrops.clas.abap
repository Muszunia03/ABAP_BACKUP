CLASS zcl_raindrops DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS raindrops
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_raindrops IMPLEMENTATION.

  METHOD raindrops.

    DATA(lv_result) = ``.

    IF input MOD 3 = 0.
      CONCATENATE lv_result 'Pling' INTO lv_result.
    ENDIF.

    IF input MOD 5 = 0.
      CONCATENATE lv_result 'Plang' INTO lv_result.
    ENDIF.

    IF input MOD 7 = 0.
      CONCATENATE lv_result 'Plong' INTO lv_result.
    ENDIF.

    IF lv_result IS INITIAL.
      result = input.
    ELSE.
      result = lv_result.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
