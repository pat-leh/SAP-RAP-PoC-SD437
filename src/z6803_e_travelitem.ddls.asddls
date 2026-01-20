@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extension'
@Metadata.ignorePropagatedAnnotations: true
@AbapCatalog.extensibility: {
 allowNewDatasources: false,
 dataSources: ['Item'],
 extensible: true,
 elementSuffix: 'Z68'
}
define view entity Z6803_E_travelitem
  as select from z6803_travelitem as Item
{
  key item_uuid as ItemUuid

}
