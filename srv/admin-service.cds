using { sap.capire.materialshop as my } from '../db/schema';
service AdminService @(_requires:'admin') {
  entity Materials as projection on my.Materials;
  entity Plants as projection on my.Plants;
  entity PurchDocs as select from my.PurchDocs;
  }
