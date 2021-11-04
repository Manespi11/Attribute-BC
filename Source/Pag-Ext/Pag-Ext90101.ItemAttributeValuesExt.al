pageextension 90101 "Item Attribute Values Ext" extends "Item Attribute Values"
{
    layout
    {
        addafter(Value)
        {
            field(U_Enabled; Rec.U_Enabled)
            {
                ApplicationArea = all;
            }
        }
    }
}
