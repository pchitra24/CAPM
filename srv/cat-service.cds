using { sap.capire.materialshop as my } from '../db/schema';
service CatalogService @(path:'/browse') {

  @readonly entity Materials as SELECT from my.Materials {*,
    plant.MRPType as plant
  } excluding { createdBy, modifiedBy };

  @requires_: 'authenticated-user'
  @insertonly entity PurchDocs as projection on my.PurchDocs;
}