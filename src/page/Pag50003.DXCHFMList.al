page 50003 "DXC HFM List"
{
    // version EC1.02

    // T60 083112 AMEIND TJ
    //   New page created for HFM

    PageType = List;
    SourceTable = "HFM Export Table";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Text;Text)
                {
                }
                field(Year;Year)
                {
                }
                field(Month;Month)
                {
                }
                field("Account No.";"Account No.")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                }
                field("Shortcut Dimension 3 Code";"Shortcut Dimension 3 Code")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update HFM Analysis Table")
            {
                RunObject = Report "Analysis View HFM Table Data";
            }
            action("Export HFM Analysis Data")
            {
                RunObject = XMLport "Create Txt File for HFM";
            }
        }
    }
}

