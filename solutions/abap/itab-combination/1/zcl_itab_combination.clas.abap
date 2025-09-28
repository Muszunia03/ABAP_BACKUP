CLASS zcl_itab_combination DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF alphatab_type,
             cola TYPE string,
             colb TYPE string,
             colc TYPE string,
           END OF alphatab_type.
    TYPES alphas TYPE STANDARD TABLE OF alphatab_type.

    TYPES: BEGIN OF numtab_type,
             col1 TYPE string,
             col2 TYPE string,
             col3 TYPE string,
           END OF numtab_type.
    TYPES nums TYPE STANDARD TABLE OF numtab_type.

    TYPES: BEGIN OF combined_data_type,
             colx TYPE string,
             coly TYPE string,
             colz TYPE string,
           END OF combined_data_type.
    TYPES combined_data TYPE STANDARD TABLE OF combined_data_type WITH EMPTY KEY.

    METHODS perform_combination
      IMPORTING
        alphas             TYPE alphas
        nums               TYPE nums
      RETURNING
        VALUE(combined_data) TYPE combined_data.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_itab_combination IMPLEMENTATION.

METHOD perform_combination.
  DATA: lv_min_lines   TYPE i,
        lv_index       TYPE i,
        wa_item        TYPE alphatab_type,
        wa_item2       TYPE numtab_type,
        wa_combined    TYPE combined_data_type,
        lv_combined1   TYPE string,
        lv_combined2   TYPE string,
        lv_combined3   TYPE string,
        lt_combined    TYPE combined_data.

  lv_min_lines = lines( alphas ).
  IF lines( nums ) < lv_min_lines.
    lv_min_lines = lines( nums ).
  ENDIF.

  DO lv_min_lines TIMES.
    lv_index = sy-index.

    READ TABLE alphas INTO wa_item INDEX lv_index.
    READ TABLE nums INTO wa_item2 INDEX lv_index.

    IF sy-subrc = 0.
      CONCATENATE wa_item-cola wa_item2-col1 INTO lv_combined1.
      CONCATENATE wa_item-colb wa_item2-col2 INTO lv_combined2.
      CONCATENATE wa_item-colc wa_item2-col3 INTO lv_combined3.

      wa_combined-colx = lv_combined1.
      wa_combined-coly = lv_combined2.
      wa_combined-colz = lv_combined3.

      APPEND wa_combined TO lt_combined.
    ENDIF.
  ENDDO.

  combined_data = lt_combined.
ENDMETHOD.

ENDCLASS.
