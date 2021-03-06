unit FrameVaccGlobal;

(*
FrameVaccGlobal.pas/dfm
------------------------
Begin: 2005/06/10
Last revision: $Date: 2008/11/25 22:00:31 $ $Author: areeves $
Version: $Revision: 1.17 $
Project: NAADSM
Website: http://www.naadsm.org
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2008 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
*)

interface

  uses
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
    
    REEdit,
    
    GlobalControlParams,
    GlobalControlParamsList,

    FrameFunctionEditor,
		FrameSMFunctionEditor
  ;

  type TFrameVaccGlobal = class( TFrame )
    pnlVaccGlobal: TPanel;
    pnlUseVaccGlobal: TPanel;
    cbxUseVaccination: TCheckBox;
    pnlVaccParams: TPanel;
    lblVaccCapacity: TLabel;
    lblVaccDetectedUnitsBeforeStart: TLabel;
    smrVaccCapacity: TFrameSMFunctionEditor;
    rleVaccDetectedUnitsBeforeStart: TREEdit;
    imgRel1: TImage;

    	procedure cbxUseVaccinationClick(Sender: TObject);
      procedure processText( sender: TObject );

		protected
      // properties
    	_ctrlParams: TGlobalControlParams;
      _ctrlList: TGlobalControlParamsList;
      
      procedure translateUI();
      
      // properties
      procedure setCtrlParams( val: TGlobalControlParams );
      function getCtrlParams(): TGlobalControlParams;
      function getEntityList(): TGlobalControlParamsList;
      procedure setEntityList( newList:TGlobalControlParamsList );
      
    public
    	constructor create( AOwner: TComponent ); override;
      destructor destroy(); override;

      procedure updateDisplay();

      // properties
			property ctrlParams: TGlobalControlParams read getCtrlParams write setCtrlParams;
      property entityList: TGlobalControlParamsList read getEntityList write setEntityList;
		end
	;

implementation

{$R *.dfm}

	uses
  	RegExpDefs,
    MyStrUtils,
    GuiStrUtils,
    FormSMWizardBase,
    ChartFunction,
    FunctionEnums,
    I88n
  ;


//-----------------------------------------------------------------------------
// construction/initialization/destruction
//-----------------------------------------------------------------------------
  constructor TFrameVaccGlobal.create( AOwner: TComponent );
  	begin
      inherited create( AOwner );
      translateUI();
      
      _ctrlParams := nil;
      smrVaccCapacity.setForm( AOwner as TFormSMWizardBase );
      smrVaccCapacity.chartType := CTRel;
      smrVaccCapacity.minY := 0.0;
      smrVaccCapacity.maxY := 0.0; // No maximum for this chart.
      smrVaccCapacity.xUnits := UnitsDays;
      smrVaccCapacity.yUnits := UnitsHerdsPerDay;
      
      rleVaccDetectedUnitsBeforeStart.InputExpression := RE_INTEGER_INPUT;
    end
  ;


  procedure TFrameVaccGlobal.translateUI();
    begin
      // This function was generated automatically by Caption Collector 0.6.0.
      // Generation date: Mon Feb 25 12:56:53 2008
      // File name: C:/Documents and Settings/apreeves/My Documents/NAADSM/Interface-Fremont/sm_forms/FrameVaccGlobal.dfm
      // File date: Fri Jan 13 09:25:25 2006

      // Set Caption, Hint, Text, and Filter properties
      with self do
        begin
          cbxUseVaccination.Caption := tr( 'Use vaccination for disease control for some or all production types' );
          lblVaccCapacity.Caption := tr( 'Vaccination capacity (units per day over time):' );
          lblVaccDetectedUnitsBeforeStart.Caption := tr( 'How many diseased units (of any production type) must be detected before the vaccination program begins?' );
          imgRel1.Hint := tr( 'This parameter is a relational function' );
        end
      ;

    end
  ;


  destructor TFrameVaccGlobal.destroy();
  	begin
    	inherited destroy();
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Display functions
//-----------------------------------------------------------------------------
	procedure TFrameVaccGlobal.updateDisplay();
		begin
    	if( _ctrlParams.useVaccGlobal ) then
      	begin
       		cbxUseVaccination.checked := true;
          rleVaccDetectedUnitsBeforeStart.Text := intToStr( ctrlParams.vaccDetectedUnitsBeforeStart );
          pnlVaccParams.visible := true;
        end
      else
      	begin
        	cbxUseVaccination.checked := false;
          pnlVaccParams.visible := false;
        end
      ;

      // Do this regardless of whether destruction will occur.
      // The chart editor can handle nil charts, but it needs the
      // reference to the model entity _ctrlParams.
      smrVaccCapacity.showChart( _ctrlParams, _ctrlParams.vaccCapacity, VaccCapacityGlobal );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// GUI event handlers
//-----------------------------------------------------------------------------
  procedure TFrameVaccGlobal.cbxUseVaccinationClick(Sender: TObject);
    begin
      _ctrlParams.useVaccGlobal := cbxUseVaccination.Checked;
      pnlVaccParams.visible := cbxUseVaccination.Checked;
    end
  ;


  procedure TFrameVaccGlobal.processText( sender: TObject );
    begin
    	_ctrlParams.vaccDetectedUnitsBeforeStart := myStrToInt( rleVaccDetectedUnitsBeforeStart.Text );
    end
  ;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// properties
//-----------------------------------------------------------------------------
  procedure TFrameVaccGlobal.setCtrlParams( val: TGlobalControlParams ); begin _ctrlParams := val; end;
  function TFrameVaccGlobal.getCtrlParams(): TGlobalControlParams; begin Result := _ctrlParams; end;

  function TFrameVaccGlobal.getEntityList(): TGlobalControlParamsList;
    begin
      result := _ctrlList;
    end;

  procedure TFrameVaccGlobal.setEntityList( newList:TGlobalControlParamsList );
    begin
      _ctrlList := newList;
      smrVaccCapacity.setModelList( _ctrlList );
    end;
//-----------------------------------------------------------------------------

end.

