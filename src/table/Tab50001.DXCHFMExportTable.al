table 50001 "DXC HFM Export Table"
{
    // version EC1.02

    // T60 083112 AMEIND TJ
    //   New Table created for HFM.
    //   Table value is genetated by running the report 50056 Create HFM Table Data


    fields
    {
        field(1;"Entry No.";Integer)
        {
            CaptionML = DEU='Lfd. Nr.',
                        ENU='Entry No.';
        }
        field(2;Text;Text[50])
        {
            CaptionML = DEU='Text',
                        ENU='Text';
        }
        field(3;Year;Text[30])
        {
        }
        field(4;Month;Text[30])
        {
        }
        field(5;"Account No.";Code[20])
        {
        }
        field(6;Amount;Text[30])
        {
        }
        field(7;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
        }
        field(8;"Shortcut Dimension 3 Code";Code[20])
        {
            CaptionClass = '1,2,4';
        }
        field(9;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
        }
        field(50000;Amount2;Decimal)
        {
        }
        field(500010;MY;Boolean)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
        key(Key2;"Account No.","Shortcut Dimension 2 Code","Shortcut Dimension 3 Code")
        {
        }
        key(Key3;"Account No.","Shortcut Dimension 2 Code","Shortcut Dimension 3 Code","Shortcut Dimension 1 Code",MY)
        {
        }
    }

    fieldgroups
    {
    }
}

