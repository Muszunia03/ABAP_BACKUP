CLASS zcl_two_fer DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS two_fer
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_two_fer IMPLEMENTATION.

  METHOD two_fer.
* add solution here
    DATA: lv_sentence_left  type string VALUE 'One for ',
          lv_sentence_right type string VALUE ', one for me.',
          lv_sentence       type string.
    IF input IS INITIAL.
    result = 'One for you, one for me.'.
    ELSE.
    CONCATENATE lv_sentence_left input lv_sentence_right into lv_sentence.
    result = lv_sentence.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
