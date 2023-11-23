namespace RiskManagement;

using { BusinessPartnerA2X } from '../srv/external/BusinessPartnerA2X.cds';

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    extensible,
    managed,
    temporal
}
from '@sap/cds/common';

/**
 * Risk from tutorial
 */
entity Risks : managed
{
    key ID : UUID;
    title : String(100);
    prio : String(5);
    descr : String(100);
    impact : Integer;
    criticality : Integer;
    miti : Association to one Mitigation;
    Supplier : Association to one BusinessPartnerA2X.A_BusinessPartner;
}

entity Mitigation : managed
{
    description : String(100) not null;
    owner : String(100);
    timeline : String(100);
    key ID : UUID;
    risks : Association to many Risks on risks.miti = $self;
}
