codeunit 90100 "Sales-Post Ext"
{
    [EventSubscriber(ObjectType::Codeunit, 80, 'OnBeforeSalesInvLineInsert', '', false, false)]
    local procedure OnBeforeSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line"; SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line"; CommitIsSuppressed: Boolean; var IsHandled: Boolean; PostingSalesLine: Record "Sales Line")
    var
        ItemAttributeValueMapping: Record "Item Attribute Value Mapping";
        ItemAttributeValue: Record "Item Attribute Value";
        AttributeTextValue: Text[1000];
    begin
        ItemAttributeValueMapping.SetRange("Table ID", DATABASE::Item);
        ItemAttributeValueMapping.SetRange("No.", SalesInvLine."No.");
        if ItemAttributeValueMapping.FindSet() then
            repeat
                ItemAttributeValue.SetRange("Attribute ID", ItemAttributeValueMapping."Item Attribute ID");
                ItemAttributeValue.SetRange(ID, ItemAttributeValueMapping."Item Attribute Value ID");
                if ItemAttributeValue.FindSet() then begin
                    ItemAttributeValue.CalcFields("Attribute Name");
                    if AttributeTextValue = '' then
                        AttributeTextValue := (ItemAttributeValue."Attribute Name" + ': ' + ItemAttributeValue.Value)
                    else
                        AttributeTextValue := AttributeTextValue + ', ' + (ItemAttributeValue."Attribute Name" + ': ' + ItemAttributeValue.Value)
                end;
            until ItemAttributeValueMapping.Next() = 0;

        if AttributeTextValue <> '' then
            SalesInvLine.U_Attributes := AttributeTextValue;
    end;

}
