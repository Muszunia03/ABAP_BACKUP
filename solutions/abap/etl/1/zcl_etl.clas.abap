CLASS zcl_etl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_legacy_data,
        number TYPE i,
        string TYPE string,
      END OF ty_legacy_data,
      BEGIN OF ty_new_data,
        letter TYPE c LENGTH 1,
        number TYPE i,
      END OF ty_new_data,
      tty_legacy_data TYPE SORTED TABLE OF ty_legacy_data WITH UNIQUE KEY number,
      tty_new_data    TYPE SORTED TABLE OF ty_new_data WITH UNIQUE KEY letter.

    METHODS transform IMPORTING legacy_data     TYPE tty_legacy_data
                      RETURNING VALUE(new_data) TYPE tty_new_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_etl IMPLEMENTATION.

  METHOD transform.
    DATA: ls_new    TYPE ty_new_data,
          lt_letters TYPE STANDARD TABLE OF string WITH EMPTY KEY.

    new_data = VALUE #( ).

    LOOP AT legacy_data INTO DATA(ls_legacy).
      SPLIT ls_legacy-string AT ',' INTO TABLE lt_letters.

      LOOP AT lt_letters INTO DATA(lv_letter).
        ls_new-letter = to_lower( lv_letter ).
        ls_new-number = ls_legacy-number.
        INSERT ls_new INTO TABLE new_data.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

