@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Travel Item'
define view entity Z6803_R_TRAVELITEM
  as select from z6803_travelitem
  association to parent z6803_R_TRAVEL as _travel on  $projection.AgencyId = _travel.AgencyId
                                                  and $projection.TravelId = _travel.TravelId
{
  key item_uuid            as ItemUuid,
      agency_id            as AgencyId,
      travel_id            as TravelId,
      carrier_id           as CarrierId,
      connection_id        as ConnectionId,
      flight_date          as FlightDate,
      booking_id           as BookingId,
      passenger_first_name as PassengerFirstName,
      passenger_last_name  as PassengerLastName,
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at           as ChangedAt,
      @Semantics.user.lastChangedBy: true
      changed_by           as ChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      loc_changed_at       as LocChangedAt,
      _travel
}
