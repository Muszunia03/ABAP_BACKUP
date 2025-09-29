CLASS zcl_clock DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !hours   TYPE i
        !minutes TYPE i DEFAULT 0.
    METHODS get
      RETURNING
        VALUE(result) TYPE string.
    METHODS add
      IMPORTING
        !minutes TYPE i.
    METHODS sub
      IMPORTING
        !minutes TYPE i.

  PRIVATE SECTION.

  DATA clock TYPE t.
  
ENDCLASS.



CLASS zcl_clock IMPLEMENTATION.

  METHOD add.
    clock = clock + minutes * 60.
  ENDMETHOD.
  METHOD constructor.
    clock = hours * 60 * 60 + minutes * 60.
  ENDMETHOD.
  METHOD get.
    result = |{ clock TIME = ISO }|.
    result = result(5).
  ENDMETHOD.
  METHOD sub.
    clock = clock - minutes * 60.
  ENDMETHOD.
ENDCLASS.
