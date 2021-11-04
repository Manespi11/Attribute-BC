tableextension 90103 "Sales Invoice Line Ext" extends "Sales Invoice Line"
{
    fields
    {
        field(90100; U_Attributes; Text[1000])
        {
            Caption = 'Attributes';
            DataClassification = ToBeClassified;
        }
    }
}
