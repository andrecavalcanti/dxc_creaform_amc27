report 50000 "DXC Analysis View HFM Tb. Data"
{
    // version EC1.02

    ProcessingOnly = true;

    dataset
    {
        dataitem("Analysis View Entry";"Analysis View Entry")
        {
            DataItemTableView = SORTING("Analysis View Code","Account No.","Account Source","Dimension 1 Value Code","Dimension 2 Value Code","Dimension 3 Value Code","Dimension 4 Value Code","Business Unit Code","Posting Date","Entry No.","Cash Flow Forecast No.") ORDER(Ascending) WHERE("Analysis View Code"=FILTER('HFM'));
            RequestFilterFields = "Posting Date";

            trigger OnAfterGetRecord();
            begin
                GLAccount.GET("Account No.");
                CLEAR(GLAmt);

                CheckHFMTable_G.RESET;
                CheckHFMTable_G.SETCURRENTKEY("Account No.","Shortcut Dimension 2 Code","Shortcut Dimension 3 Code");
                CheckHFMTable_G.SETRANGE("Account No.","Account No.");
                CheckHFMTable_G.SETRANGE("Shortcut Dimension 2 Code","Dimension 1 Value Code");
                CheckHFMTable_G.SETRANGE("Shortcut Dimension 3 Code","Dimension 2 Value Code");
                if CheckHFMTable_G.FINDFIRST then begin
                  GLAmt := CheckHFMTable_G.Amount2 + Amount;
                  CheckHFMTable_G.Amount := FORMAT(GLAmt,0,2);
                  CheckHFMTable_G.Amount2 := GLAmt;
                  if GLAmt = 0 then
                    CheckHFMTable_G.DELETE
                  else
                    CheckHFMTable_G.MODIFY;
                end else begin
                  if Amount <> 0 then begin
                    recHFMTable.INIT;
                    intLine := intLine +1;
                    recHFMTable."Entry No." := intLine;
                    recHFMTable.Text := FORMAT(GLAccount.Name);
                    recHFMTable.Year := FORMAT(TxtYear);
                    recHFMTable.Month := FORMAT(txtMonth);
                    recHFMTable."Account No." := "Account No.";
                    GLAmt := Amount;
                    recHFMTable.Amount := FORMAT(GLAmt,0,2);
                    recHFMTable.Amount2 := GLAmt;
                    recHFMTable."Shortcut Dimension 2 Code" := "Dimension 1 Value Code";
                    recHFMTable."Shortcut Dimension 3 Code" := "Dimension 2 Value Code";
                    recHFMTable.INSERT;
                  end;
                end;
            end;

            trigger OnPreDataItem();
            begin
                Datefilter := GETFILTER("Posting Date");
                txtCopyDatefilter := COPYSTR(Datefilter,14,2);

                if COPYSTR(FORMAT(txtCopyDatefilter),1,1) = '0' then
                  txtCopyDatefilter := COPYSTR(FORMAT(txtCopyDatefilter),2,1);

                recHFMTable.RESET;
                recHFMTable.DELETEALL;

                txtMonth := FORMAT(DATE2DMY(GETRANGEMAX("Posting Date"), 2));
                if STRLEN(txtMonth) = 1 then
                  txtMonth := '0' + txtMonth;

                TxtYear := FORMAT(DATE2DMY(GETRANGEMAX("Posting Date"), 3));

                CheckHFMTable_G.DELETEALL;
            end;
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

    labels
    {
    }

    trigger OnPostReport();
    begin
        /*CheckHFMTable_G.RESET;
        CheckHFMTable_G.SETFILTER(Amount,'=%1','0');
        IF CheckHFMTable_G.FINDSET THEN
          CheckHFMTable_G.DELETEALL;
        */
        MESSAGE(Text50000);

    end;

    var
        recHFMTable : Record "DXC HFM Export Table";
        intLine : Integer;
        txtFilter : Text[80];
        txtCopyDatefilter : Text[2];
        Datefilter : Text[30];
        TxtYear : Text[10];
        txtMonth : Text[2];
        GLAmt : Decimal;
        CheckHFMTable_G : Record "DXC HFM Export Table";
        GLAccount : Record "G/L Account";
        Text50000 : Label 'HFM processing completed.';
}

