pageextension 90102 "Posted Sales Inv. Subform Ext" extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter(Description)
        {
            field(Attributes; Rec.U_Attributes)
            {
                ApplicationArea = all;
            }
        }
    }
}
