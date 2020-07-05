@AbapCatalog.sqlViewName: 'ZVI_LABOR_CLOCK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface View - Labor Clock'
define root view ZI_LABOR_CLOCK
  as select from zlabor_clock
{
  
  key id ,
  clocked_on,
  clocked_off,
  clocked_break,
  duration,
  sapstatus,
  taskid,
  resourceid,
  created_by,
  created_at,
  last_changed_by,
  last_changed_at
}
