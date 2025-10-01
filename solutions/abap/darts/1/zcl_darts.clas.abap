CLASS zcl_darts DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        x             TYPE f
        y             TYPE f
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_darts IMPLEMENTATION.

  METHOD score.
    DATA: lv_distance TYPE f.

    lv_distance = sqrt( x * x + y * y ).

    IF lv_distance <= 1.
      result = 10.
    ELSEIF lv_distance <= 5.
      result = 5.
    ELSEIF lv_distance <= 10.
      result = 1.
    ELSE.
      result = 0.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
