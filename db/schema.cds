namespace sap.capire.materialshop;
using { Currency, managed, cuid } from '@sap/cds/common';

entity Materials : managed {
  key MaterialNumber : Integer;  
  Materialdescription  : localized String(1111); 
  Quantity  : Integer; 
  Price  : Decimal(9,2);  
  plant : Association to Plants;
  // PurchDocs:Association to PurchDocs
} 
entity Plants : managed {
  key plantID   : String(4); 
  Maintenancestatus  : String(4);
  MRPType  : String(14);
  ProcurementType : String;
   materials  : Association to many Materials on materials.plant = $self;
}
entity PurchDocs : managed {
  key PurchDocNum    : Integer;
  Items    : Composition of many PurchDocItems  on Items.parent = $self;
  companycode : String(4);
  totalamount    : Decimal(9,2);
  
}
entity PurchDocItems  {
  key PurchDocNum    : Integer;
  key purdocitem : Integer;
  parent    : Association to PurchDocs;
  material  : Association to Materials;
  amount    : Integer;
  netAmount : Decimal(9,2);
}