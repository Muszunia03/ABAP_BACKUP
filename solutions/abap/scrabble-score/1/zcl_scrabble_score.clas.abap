CLASS zcl_scrabble_score DEFINITION PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_scrabble_score IMPLEMENTATION.

  METHOD score.
    DATA: lv_letter  TYPE c LENGTH 1,
          lv_char    TYPE c LENGTH 1,
          lv_score   TYPE i VALUE 0,
          lv_index   TYPE i.

    input = to_upper( input ).

    DO strlen( input ) TIMES.
      lv_index = sy-index - 1.
      lv_letter = input+lv_index(1).

      CASE lv_letter.
        WHEN 'A' OR 'E' OR 'I' OR 'O' OR 'U' OR 'L' OR 'N' OR 'R' OR 'S' OR 'T'.
          lv_score = lv_score + 1.
        WHEN 'D' OR 'G'.
          lv_score = lv_score + 2.
        WHEN 'B' OR 'C' OR 'M' OR 'P'.
          lv_score = lv_score + 3.
        WHEN 'F' OR 'H' OR 'V' OR 'W' OR 'Y'.
          lv_score = lv_score + 4.
        WHEN 'K'.
          lv_score = lv_score + 5.
        WHEN 'J' OR 'X'.
          lv_score = lv_score + 8.
        WHEN 'Q' OR 'Z'.
          lv_score = lv_score + 10.
        WHEN OTHERS.
      ENDCASE.
    ENDDO.

    result = lv_score.
  ENDMETHOD.

ENDCLASS.
