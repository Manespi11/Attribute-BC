tableextension 90101 "Item Atr. Value Selection Ext" extends "Item Attribute Value Selection"
{
    fields
    {
        modify("Attribute Name")
        {
            trigger OnAfterValidate()
            var
                ItemAttributeValueRec: Record "Item Attribute Value";
                AttributeValue: Text[100];
                IsEnabled: Boolean;
            begin
                if Rec."Attribute Type" = Rec."Attribute Type"::Option then begin
                    IsEnabled := true;
                    ItemAttributeValueRec.SetCurrentKey(Value);
                    ItemAttributeValueRec.SetRange("Attribute ID", Rec."Attribute ID");
                    ItemAttributeValueRec.SetRange(U_Enabled, true);
                    ItemAttributeValueRec.SetRange(Blocked, false);
                    if ItemAttributeValueRec.FindSet() then
                        repeat
                            if ItemAttributeValueRec.Value <> '' then
                                if AttributeValue = '' then
                                    AttributeValue := ItemAttributeValueRec.Value
                                else
                                    AttributeValue := AttributeValue + ', ' + ItemAttributeValueRec.Value;
                        until ItemAttributeValueRec.Next() = 0;

                    if AttributeValue <> '' then
                        Rec.Value := AttributeValue;
                end;
            end;
        }

    }
}
