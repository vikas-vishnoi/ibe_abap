CLASS zcl_fill_test_data_clock DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_fill_test_data_clock IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA:itab TYPE TABLE OF zlabor_clock.

*   read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).

*   fill internal travel table (itab)
    itab = VALUE #(
  ( clocked_on = '20200310111041.2251330' clocked_off = '20200310111041.2251330' clocked_break = '20200310111041.2251330' duration = '800.00'
    sapstatus = 'open' taskid = 'T000001' resourceid = 'R00001' created_by = 'CB0000000007' created_at = '20200310105654.4296640' last_changed_by = 'CB0000000007' last_changed_at = '20200310111041.2251330' )
 ).

*   delete existing entries in the database table
    DELETE FROM zlabor_clock.

*   insert the new table entries
    INSERT zlabor_clock FROM TABLE @itab.

*   check the result
    SELECT * FROM zlabor_clock INTO TABLE @itab.
    out->write( sy-dbcnt ).
    out->write( 'Clock data inserted successfully!').

  ENDMETHOD.

ENDCLASS.
