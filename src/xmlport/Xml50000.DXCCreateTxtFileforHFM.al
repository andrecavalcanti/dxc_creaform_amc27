xmlport 50000 "DXC Create Txt File for HFM"
{
    // version EC1.02

    // T60 083112 AMEIND TJ
    //   New XMLPort created to create TXT file from  HFM Export Table (50009)

    Direction = Export;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("HFM Export Table";"DXC HFM Export Table")
            {
                XmlName = 'HFM_Export';
                fieldelement(Year;"HFM Export Table".Year)
                {
                }
                fieldelement(Month;"HFM Export Table".Month)
                {
                }
                fieldelement("Account_No.";"HFM Export Table"."Account No.")
                {
                }
                fieldelement(Amount;"HFM Export Table".Amount)
                {
                }
                fieldelement(Dimension2;"HFM Export Table"."Shortcut Dimension 2 Code")
                {
                }
                fieldelement(Text;"HFM Export Table".Text)
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    var
        Text001 : TextConst ENU='Import from XML File',ESM='Importar desde archivo XML',FRC='Importer de fichier XML',ENC='Import from XML File';
        Text002 : TextConst ENU='XML Files (*.xml)|*.xml|All Files (*.*)|*.*',ESM='Archivos XML (*.xml)|*.xml|Todos los archivos (*.*)|*.*',FRC='Fichiers XML (*.xml)|*.xml|Tous les fichiers (*.*)|*.*',ENC='XML Files (*.xml)|*.xml|All Files (*.*)|*.*';
        Vendor : Record Vendor;
}

