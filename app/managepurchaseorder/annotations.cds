using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(

    UI.SelectionFields: [
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        CURRENCY_code,
        GROSS_AMOUNT,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY
    ],

    UI.LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: PO_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type: 'UI.DataField',
            Value: GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Inline: true,
            Label : 'boost',
            Action: 'CatalogService.boost',
        },
        {
            $Type      : 'UI.DataField',
            Value      : OverllStatus,
            Criticality: IconColor
        },
    ],

    UI.HeaderInfo     : {
        TypeName      : 'Purchase Order',
        TypeNamePlural: 'Purchase Orders',
        Title         : {Value: PO_ID},
        Description   : {Value: PARTNER_GUID.COMPANY_NAME},
        ImageUrl      : 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/IBM_logo.svg/1200px-IBM_logo.svg.png'
    },

    UI.Facets         : [{
        $Type : 'UI.CollectionFacet',
        ID    : 'idParent',
        Label : 'More Information',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Label : 'More Info',
            Target: '@UI.Identification',
        }, ],
    }, ],
    UI.Identification : [
        {
            $Type: 'UI.DataField',
            Value: PO_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID_NODE_KEY,
        },
        {
            $Type: 'UI.DataField',
            Value: OVERALL_STATUS,
        },

    ],


);

annotate CatalogService.POs with {
    PARTNER_GUID @(
        Common          : {Text: PARTNER_GUID.COMPANY_NAME, },
        ValueList.entity: CatalogService.BusinessPartnerSet
    )
};

annotate CatalogService.PurchaseOrderItems with {
    PRODUCT_GUID @(
        Common          : {Text: PRODUCT_GUID.DESCRIPTION, },
        ValueList.entity: CatalogService.ProductSet
    )
};


@cds.odata.valuelist
annotate CatalogService.BusinessPartnerSet with @(UI.Identification: [{
    $Type: 'UI.DataField',
    Value: COMPANY_NAME,
}]);

@cds.odata.valuelist
annotate CatalogService.ProductSet with @(UI.Identification: [{
    $Type: 'UI.DataField',
    Value: DESCRIPTION,
}]);
