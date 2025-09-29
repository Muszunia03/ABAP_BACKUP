CLASS zcl_triangle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      is_equilateral
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid,
      is_isosceles
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid,
      is_scalene
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_triangle IMPLEMENTATION.

  METHOD is_equilateral.
    IF side_a <= 0 OR side_b <= 0 OR side_c <= 0
      OR ( side_a + side_b < side_c )
      OR ( side_a + side_c < side_b )
      OR ( side_b + side_c < side_a ).
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    IF ( side_a = side_b ) AND ( side_a = side_c ).
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD is_isosceles.
    IF side_a <= 0 OR side_b <= 0 OR side_c <= 0
      OR ( side_a + side_b < side_c )
      OR ( side_a + side_c < side_b )
      OR ( side_b + side_c < side_a ).
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    IF ( side_a = side_b ) OR ( side_a = side_c ) OR ( side_b = side_c ).
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD is_scalene.
    IF side_a <= 0 OR side_b <= 0 OR side_c <= 0
      OR ( side_a + side_b < side_c )
      OR ( side_a + side_c < side_b )
      OR ( side_b + side_c < side_a ).
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    IF ( side_a <> side_b ) AND ( side_a <> side_c ) AND ( side_b <> side_c ).
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

