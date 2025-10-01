CLASS zcl_anagram DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS anagram
      IMPORTING
        input         TYPE string
        candidates    TYPE string_table
      RETURNING
        VALUE(result) TYPE string_table.

  PRIVATE SECTION.
    TYPES ty_char TYPE c LENGTH 1.
    TYPES ty_char_table TYPE STANDARD TABLE OF ty_char WITH EMPTY KEY.

    METHODS get_sorted_lowercase
      IMPORTING input TYPE string
      RETURNING VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_anagram IMPLEMENTATION.

  METHOD anagram.
    DATA: lv_input_sorted     TYPE string,
          lv_candidate_sorted TYPE string,
          lv_candidate        TYPE string.

    result = VALUE #( ).

    lv_input_sorted = get_sorted_lowercase( input ).

    LOOP AT candidates INTO lv_candidate.

      IF to_lower( lv_candidate ) = to_lower( input ).
        CONTINUE.
      ENDIF.

      lv_candidate_sorted = get_sorted_lowercase( lv_candidate ).

      IF lv_candidate_sorted = lv_input_sorted.
        APPEND lv_candidate TO result.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD get_sorted_lowercase.
    DATA: lt_chars TYPE ty_char_table,
          lv_char  TYPE ty_char,
          lv_lower TYPE string,
          lv_len   TYPE i,
          lv_idx   TYPE i.

    result = ``.
    lv_lower = to_lower( input ).
    lv_len = strlen( lv_lower ).

    DO lv_len TIMES.
      lv_idx = sy-index - 1.
      lv_char = lv_lower+lv_idx(1).
      APPEND lv_char TO lt_chars.
    ENDDO.

    SORT lt_chars.

    LOOP AT lt_chars INTO lv_char.
      CONCATENATE result lv_char INTO result.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

