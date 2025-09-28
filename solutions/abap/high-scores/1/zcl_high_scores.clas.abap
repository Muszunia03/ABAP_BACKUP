CLASS zcl_high_scores DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS constructor
      IMPORTING
        scores TYPE integertab.

    METHODS list_scores
      RETURNING
        VALUE(result) TYPE integertab.

    METHODS latest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personalbest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personaltopthree
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA scores_list TYPE integertab.

ENDCLASS.


CLASS zcl_high_scores IMPLEMENTATION.

  METHOD constructor.
    me->scores_list = scores.
  ENDMETHOD.

  METHOD list_scores.
       result = scores_list.
  ENDMETHOD.

  METHOD latest.
    DATA lv_new_index TYPE i.
    lv_new_index = LINES( scores_list ).
  
      IF lv_new_index > 0.
        READ TABLE scores_list INTO result INDEX lv_new_index.
      ELSE.
        result = 0.
      ENDIF.
  ENDMETHOD.


  METHOD personalbest.
    result = 0.
    DATA: lv_score type i.
    LOOP AT scores_list into lv_score.
      IF lv_score > result.
          result = lv_score.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

METHOD personaltopthree.

  DATA: lv_result1 TYPE i VALUE -1,
        lv_result2 TYPE i VALUE -1,
        lv_result3 TYPE i VALUE -1, 
        lv_score   TYPE i.

  LOOP AT scores_list INTO lv_score.

    IF lv_score > lv_result1.
      lv_result3 = lv_result2.
      lv_result2 = lv_result1.
      lv_result1 = lv_score.

    ELSEIF lv_score > lv_result2.
      lv_result3 = lv_result2.
      lv_result2 = lv_score.

    ELSEIF lv_score > lv_result3.
      lv_result3 = lv_score.
    ENDIF.

  ENDLOOP.
    
    IF lv_result1 >= 0.
      APPEND lv_result1 TO result.
    ENDIF.
    IF lv_result2 >= 0.
      APPEND lv_result2 TO result.
    ENDIF.
    IF lv_result3 >= 0.
      APPEND lv_result3 TO result.
    ENDIF.

ENDMETHOD.


ENDCLASS.
