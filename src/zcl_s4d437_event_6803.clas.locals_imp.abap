*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS zcl_handler DEFINITION INHERITING FROM cl_abap_behavior_event_handler.
  PRIVATE SECTION.
    METHODS on_travel_save FOR ENTITY EVENT
      IMPORTING new_travels FOR Travel~TravelCreated.
ENDCLASS.

CLASS zcl_handler IMPLEMENTATION.

  METHOD on_travel_save.
*    DATA log TYPE TABLE FOR CREATE /lrn/437_i_travellog.
*    LOOP AT new_travels ASSIGNING FIELD-SYMBOL(<travel>).
*      APPEND VALUE #( AgencyID = <travel>-AgencyId
*      TravelID = <travel>-TravelId
*      Origin = 'Z6803_R_TRAVEL' )
*      TO log.
*    ENDLOOP.
    MODIFY ENTITIES OF /LRN/437_I_TravelLog
         ENTITY TravelLog
         CREATE AUTO FILL CID
         FIELDS ( AgencyID TravelID Origin )
         WITH CORRESPONDING #(  new_travels ).
  ENDMETHOD.

ENDCLASS..
