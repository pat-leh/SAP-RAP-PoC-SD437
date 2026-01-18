CLASS z_cl_437t_eml_6803 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

    CONSTANTS c_agency_id TYPE /dmo/agency_id VALUE '070000'.
    CONSTANTS c_travel_id TYPE /dmo/travel_id VALUE '0007227'.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_cl_437t_eml_6803 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*
*    READ ENTITIES OF zr_z01_grocery
*      IN LOCAL MODE ENTITY Grocery
*      ALL FIELDS WITH CORRESPONDING #( keys )
*      RESULT lt_groceries.

    READ ENTITIES OF z6803_R_TRAVEL
        ENTITY travel
        ALL FIELDS WITH VALUE #( ( AgencyId = c_agency_id TravelId = c_travel_id ) )
        RESULT DATA(travels)
        FAILED DATA(failed).

    IF failed IS NOT INITIAL.
      out->write( 'Error!!' ).
    ELSE.
      MODIFY ENTITIES OF z6803_R_TRAVEL
        ENTITY travel UPDATE FIELDS ( Description )
        WITH VALUE #( ( AgencyId = c_agency_id TravelId = c_travel_id Description = 'Wow!' ) )
        FAILED  failed.
      IF failed IS INITIAL.
        COMMIT ENTITIES.
        out->write( 'Done' ).
      ELSE.
        ROLLBACK ENTITIES.
        out->write( 'Error!!' ).
      ENDIF.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
