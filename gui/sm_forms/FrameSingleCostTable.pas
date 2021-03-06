unit FrameSingleCostTable;

(*
FrameSingleCostTable.pas/dfm
----------------------------
Begin: 2006/01/20
Last revision: $Date: 2008/03/12 22:10:51 $ $Author: areeves $
Version: $Revision: 1.9 $
Project: NAADSM
Website: http://www.naadsm.org
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2006 - 2008 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
*)

interface

  uses
    // Standard Delphi units
    Windows,
    Messages,
    SysUtils,
    Variants,
    Classes,
    Graphics,
    Controls,
    Forms,
    Dialogs,
    StdCtrls,
    ExtCtrls,

    // General purpose units
    QVectors,

    // Application-specific widgets
    FrameStringGridBase
  ;


  type TFrameSingleCostTable = class( TFrame )
      pnlShowCumul: TPanel;
      cbxShowCumul: TCheckBox;
      fraGrid: TFrameStringGridBase;
    procedure cbxShowCumulClick(Sender: TObject);

    protected
      _arrTotal: TQDoubleVector;
      _arrDestrSubtotal: TQDoubleVector;
      _arrAppraisal: TQDoubleVector;
      _arrCAndD: TQDoubleVector;
      _arrEuthanasia: TQDoubleVector;
      _arrIndemnification: TQDoubleVector;
      _arrDisposal: TQDoubleVector;
      _arrVaccSetup: TQDoubleVector;
      _arrVacc: TQDoubleVector;
      _arrVaccSubtotal: TQDoubleVector;

      _arrTotalCumul: TQDoubleVector;
      _arrDestrSubtotalCumul: TQDoubleVector;
      _arrAppraisalCumul: TQDoubleVector;
      _arrCAndDCumul: TQDoubleVector;
      _arrEuthanasiaCumul: TQDoubleVector;
      _arrIndemnificationCumul: TQDoubleVector;
      _arrDisposalCumul: TQDoubleVector;
      _arrVaccSetupCumul: TQDoubleVector;
      _arrVaccCumul: TQDoubleVector;
      _arrVaccSubtotalCumul: TQDoubleVector;

      procedure translateUI();

    public
      constructor create( AOwner: TComponent ); override;
      destructor destroy(); override;

      procedure clearTable();

      procedure setArrays(
        arrTotal: TQDoubleVector;

        arrDestrSubtotal: TQDoubleVector;
        arrAppraisal: TQDoubleVector;
        arrCAndD: TQDoubleVector;
        arrEuthanasia: TQDoubleVector;
        arrIndemnification: TQDoubleVector;
        arrDisposal: TQDoubleVector;
        arrVaccSetup: TQDoubleVector;
        arrVacc: TQDoubleVector;
        arrVaccSubtotal: TQDoubleVector;

        arrTotalCumul: TQDoubleVector;
        arrDestrSubtotalCumul: TQDoubleVector;
        arrAppraisalCumul: TQDoubleVector;
        arrCAndDCumul: TQDoubleVector;
        arrEuthanasiaCumul: TQDoubleVector;
        arrIndemnificationCumul: TQDoubleVector;
        arrDisposalCumul: TQDoubleVector;
        arrVaccSetupCumul: TQDoubleVector;
        arrVaccCumul: TQDoubleVector;
        arrVaccSubtotalCumul: TQDoubleVector
      );

      procedure refillTable();

      procedure updateForDay( const day: integer );
    end
  ;

  const
    DBFRAMESINGLECOSTTABLE: boolean = false; // Set to true to enable debugging messages for this unit


implementation

{$R *.dfm}

  uses
    // General purpose units
    MyStrUtils,
    GuiStrUtils,
    DebugWindow,
    I88n
  ;


  const
    HEADER_ROW: integer = 0;

    COL_DAY: integer = 0;
    COL_APPRAISAL: integer = 1;
    COL_CANDD: integer = 2;
    COL_EUTHANASIA: integer = 3;
    COL_INDEMNIFICATION: integer = 4;
    COL_DISPOSAL: integer = 5;
    COL_DESTRSUBTOTAL: integer = 6;
    COL_VACCSETUP: integer = 7;
    COL_VACCINATION: integer = 8;
    COL_VACCSUBTOTAL: integer = 9;
    COL_TOTAL: integer = 10;

//-----------------------------------------------------------------------------
// Construction/destruction
//-----------------------------------------------------------------------------
  constructor TFrameSingleCostTable.create( AOwner: TComponent );
    begin
      inherited create( AOwner );
      translateUI();

      fraGrid.rowCount := 2;
      fraGrid.colCount := 11;

      fraGrid.Cells[COL_DAY, HEADER_ROW] := 'Day';
      fraGrid.Cells[COL_APPRAISAL, HEADER_ROW] := 'Appraisal';
      fraGrid.Cells[COL_CANDD, HEADER_ROW] := 'CleaningAndDisposal';
      fraGrid.Cells[COL_EUTHANASIA, HEADER_ROW] := 'Euthanasia';
      fraGrid.Cells[COL_INDEMNIFICATION, HEADER_ROW] := 'Indemnification';
      fraGrid.Cells[COL_DISPOSAL, HEADER_ROW] := 'Disposal';
      fraGrid.Cells[COL_DESTRSUBTOTAL, HEADER_ROW] := 'DestrSubtotal';
      fraGrid.Cells[COL_VACCSETUP, HEADER_ROW] := 'VaccSetup';
      fraGrid.Cells[COL_VACCINATION, HEADER_ROW] := 'Vaccination';
      fraGrid.Cells[COL_VACCSUBTOTAL, HEADER_ROW] := 'VaccSubtotal';
      fraGrid.Cells[COL_TOTAL, HEADER_ROW] := 'TotalCosts';
    end
  ;


  procedure TFrameSingleCostTable.translateUI();
    begin
      // This function was generated automatically by Caption Collector 0.6.0.
      // Generation date: Mon Feb 25 12:56:53 2008
      // File name: C:/Documents and Settings/apreeves/My Documents/NAADSM/Interface-Fremont/sm_forms/FrameSingleCostTable.dfm
      // File date: Wed May 2 17:17:13 2007

      // Set Caption, Hint, Text, and Filter properties
      with self do
        begin
          cbxShowCumul.Caption := tr( 'Show cumulative costs' );
        end
      ;

    end
  ;


  procedure TFrameSingleCostTable.setArrays(
        arrTotal: TQDoubleVector;

        arrDestrSubtotal: TQDoubleVector;
        arrAppraisal: TQDoubleVector;
        arrCAndD: TQDoubleVector;
        arrEuthanasia: TQDoubleVector;
        arrIndemnification: TQDoubleVector;
        arrDisposal: TQDoubleVector;
        arrVaccSetup: TQDoubleVector;
        arrVacc: TQDoubleVector;
        arrVaccSubtotal: TQDoubleVector;

        arrTotalCumul: TQDoubleVector;
        arrDestrSubtotalCumul: TQDoubleVector;
        arrAppraisalCumul: TQDoubleVector;
        arrCAndDCumul: TQDoubleVector;
        arrEuthanasiaCumul: TQDoubleVector;
        arrIndemnificationCumul: TQDoubleVector;
        arrDisposalCumul: TQDoubleVector;
        arrVaccSetupCumul: TQDoubleVector;
        arrVaccCumul: TQDoubleVector;
        arrVaccSubtotalCumul: TQDoubleVector
      );
    begin
      dbcout( 'TFrameSingleCostCurve.setArrays...', DBFRAMESINGLECOSTTABLE );

      _arrTotal := arrTotal;

      _arrDestrSubtotal := arrDestrSubtotal;
      _arrAppraisal := arrAppraisal;
      _arrCAndD := arrCAndD;
      _arrEuthanasia := arrEuthanasia;
      _arrIndemnification := arrIndemnification;
      _arrDisposal := arrDisposal;
      _arrVaccSetup := arrVaccSetup;
      _arrVacc := arrVacc;
      _arrVaccSubtotal := arrVaccSubtotal;

      _arrTotalCumul := arrTotalCumul;
      _arrDestrSubtotalCumul := arrDestrSubtotalCumul;
      _arrAppraisalCumul := arrAppraisalCumul;
      _arrCAndDCumul := arrCAndDCumul;
      _arrEuthanasiaCumul := arrEuthanasiaCumul;
      _arrIndemnificationCumul := arrIndemnificationCumul;
      _arrDisposalCumul := arrDisposalCumul;
      _arrVaccSetupCumul := arrVaccSetupCumul;
      _arrVaccCumul := arrVaccCumul;
      _arrVaccSubtotalCumul := arrVaccSubtotalCumul;

      dbcout( 'Done TFrameSingleCostCurve.setArrays', DBFRAMESINGLECOSTTABLE );
    end
  ;


  destructor TFrameSingleCostTable.destroy();
    begin
      // Don't destroy arrays: they're just references.
      inherited destroy();
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Table writing functions
//-----------------------------------------------------------------------------
  procedure TFrameSingleCostTable.clearTable();
    begin
      fraGrid.clearGrid();
      fraGrid.rowCount := 2;
    end
  ;


  procedure TFrameSingleCostTable.refillTable();
    var
      i: integer;
    begin
      clearTable();

      fraGrid.rowCount := _arrTotal.Count + 1;

      for i := 0 to _arrTotal.Count - 1 do
        begin
          if( cbxShowCumul.Checked ) then
            begin
              fraGrid.Cells[COL_DAY, i + 1] := intToStr( i + 1 );
              fraGrid.Cells[COL_APPRAISAL, i + 1] := uiFloatToStr( _arrAppraisalCumul[i], 2, true );
              fraGrid.Cells[COL_CANDD, i + 1] := uiFloatToStr( _arrCAndDCumul[i], 2, true );
              fraGrid.Cells[COL_EUTHANASIA, i + 1] := uiFloatToStr( _arrEuthanasiaCumul[i], 2, true );
              fraGrid.Cells[COL_INDEMNIFICATION, i + 1] := uiFloatToStr( _arrIndemnificationCumul[i], 2, true );
              fraGrid.Cells[COL_DISPOSAL, i + 1] := uiFloatToStr( _arrDisposalCumul[i], 2, true );
              fraGrid.Cells[COL_DESTRSUBTOTAL, i + 1] := uiFloatToStr( _arrDestrSubtotalCumul[i], 2, true );
              fraGrid.Cells[COL_VACCSETUP, i + 1] := uiFloatToStr( _arrVaccSetupCumul[i], 2, true );
              fraGrid.Cells[COL_VACCINATION, i + 1] := uiFloatToStr( _arrVaccCumul[i], 2, true );
              fraGrid.Cells[COL_VACCSUBTOTAL, i + 1] := uiFloatToStr( _arrVaccSubtotalCumul[i], 2, true );
              fraGrid.Cells[COL_TOTAL, i + 1] := uiFloatToStr( _arrTotalCumul[i], 2, true );
            end
          else
            begin
              fraGrid.Cells[COL_DAY, i + 1] := intToStr( i + 1 );
              fraGrid.Cells[COL_APPRAISAL, i + 1] := uiFloatToStr( _arrAppraisal[i], 2, true );
              fraGrid.Cells[COL_CANDD, i + 1] := uiFloatToStr( _arrCAndD[i], 2, true );
              fraGrid.Cells[COL_EUTHANASIA, i + 1] := uiFloatToStr( _arrEuthanasia[i], 2, true );
              fraGrid.Cells[COL_INDEMNIFICATION, i + 1] := uiFloatToStr( _arrIndemnification[i], 2, true );
              fraGrid.Cells[COL_DISPOSAL, i + 1] := uiFloatToStr( _arrDisposal[i], 2, true );
              fraGrid.Cells[COL_DESTRSUBTOTAL, i + 1] := uiFloatToStr( _arrDestrSubtotal[i], 2, true );
              fraGrid.Cells[COL_VACCSETUP, i + 1] := uiFloatToStr( _arrVaccSetup[i], 2, true );
              fraGrid.Cells[COL_VACCINATION, i + 1] := uiFloatToStr( _arrVacc[i], 2, true );
              fraGrid.Cells[COL_VACCSUBTOTAL, i + 1] := uiFloatToStr( _arrVaccSubtotal[i], 2, true );
              fraGrid.Cells[COL_TOTAL, i + 1] := uiFloatToStr( _arrTotal[i], 2, true );
            end
          ;
        end
      ;


    end
  ;


  procedure TFrameSingleCostTable.updateForDay( const day: integer );
    var
      arrPos: integer;
    begin
      arrPos := day - 1;

      fraGrid.rowCount := day + 1;

      if( cbxShowCumul.Checked ) then
        begin
          fraGrid.Cells[COL_DAY, day] := intToStr( day );
          fraGrid.Cells[COL_APPRAISAL, day] := uiFloatToStr( _arrAppraisalCumul[arrPos], 2, true );
          fraGrid.Cells[COL_CANDD, day] := uiFloatToStr( _arrCAndDCumul[arrPos], 2, true );
          fraGrid.Cells[COL_EUTHANASIA, day] := uiFloatToStr( _arrEuthanasiaCumul[arrPos], 2, true );
          fraGrid.Cells[COL_INDEMNIFICATION, day] := uiFloatToStr( _arrIndemnificationCumul[arrPos], 2, true );
          fraGrid.Cells[COL_DISPOSAL, day] := uiFloatToStr( _arrDisposalCumul[arrPos], 2, true );
          fraGrid.Cells[COL_DESTRSUBTOTAL, day] := uiFloatToStr( _arrDestrSubtotalCumul[arrPos], 2, true );
          fraGrid.Cells[COL_VACCSETUP, day] := uiFloatToStr( _arrVaccSetupCumul[arrPos], 2, true );
          fraGrid.Cells[COL_VACCINATION, day] := uiFloatToStr( _arrVaccCumul[arrPos], 2, true );
          fraGrid.Cells[COL_VACCSUBTOTAL, day] := uiFloatToStr( _arrVaccSubtotalCumul[arrPos], 2, true );
          fraGrid.Cells[COL_TOTAL, day] := uiFloatToStr( _arrTotalCumul[arrPos], 2, true );
        end
      else
        begin
          fraGrid.Cells[COL_DAY, day] := intToStr( day );
          fraGrid.Cells[COL_APPRAISAL, day] := uiFloatToStr( _arrAppraisal[arrPos], 2, true );
          fraGrid.Cells[COL_CANDD, day] := uiFloatToStr( _arrCAndD[arrPos], 2, true );
          fraGrid.Cells[COL_EUTHANASIA, day] := uiFloatToStr( _arrEuthanasia[arrPos], 2, true );
          fraGrid.Cells[COL_INDEMNIFICATION, day] := uiFloatToStr( _arrIndemnification[arrPos], 2, true );
          fraGrid.Cells[COL_DISPOSAL, day] := uiFloatToStr( _arrDisposal[arrPos], 2, true );
          fraGrid.Cells[COL_DESTRSUBTOTAL, day] := uiFloatToStr( _arrDestrSubtotal[arrPos], 2, true );
          fraGrid.Cells[COL_VACCSETUP, day] := uiFloatToStr( _arrVaccSetup[arrPos], 2, true );
          fraGrid.Cells[COL_VACCINATION, day] := uiFloatToStr( _arrVacc[arrPos], 2, true );
          fraGrid.Cells[COL_VACCSUBTOTAL, day] := uiFloatToStr( _arrVaccSubtotal[arrPos], 2, true );
          fraGrid.Cells[COL_TOTAL, day] := uiFloatToStr( _arrTotal[arrPos], 2, true );
        end
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// GUI event handlers
//-----------------------------------------------------------------------------
  procedure TFrameSingleCostTable.cbxShowCumulClick(Sender: TObject);
    begin
      refillTable();
    end
  ;
//-----------------------------------------------------------------------------
end.
