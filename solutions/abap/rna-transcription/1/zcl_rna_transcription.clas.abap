CLASS zcl_rna_transcription DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS
      transcribe
        IMPORTING
          strand             TYPE string
        RETURNING
          VALUE(result)      TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_rna_transcription IMPLEMENTATION.

  METHOD transcribe.
    DATA: lv_char   TYPE c LENGTH 1,
          lv_result TYPE string VALUE '',
          lv_index  TYPE i.

    DO strlen( strand ) TIMES.
      lv_index = sy-index - 1.
      lv_char = strand+lv_index(1). 

      CASE lv_char.
        WHEN 'G'. CONCATENATE lv_result 'C' INTO lv_result.
        WHEN 'C'. CONCATENATE lv_result 'G' INTO lv_result.
        WHEN 'T'. CONCATENATE lv_result 'A' INTO lv_result.
        WHEN 'A'. CONCATENATE lv_result 'U' INTO lv_result.
        WHEN OTHERS.
      ENDCASE.
    ENDDO.

    result = lv_result.
  ENDMETHOD.

ENDCLASS.

