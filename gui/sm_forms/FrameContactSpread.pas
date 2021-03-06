unit FrameContactSpread;

(*
FrameContactSpread.pas/dfm
---------------------------
Begin: 2005/05/03
Last revision: $Date: 2008/11/25 22:00:30 $ $Author: areeves $
Version: $Revision: 1.33 $
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

		ContactModel,
		ProductionTypePair,

		FrameFunctionEditor,
		FrameSMFunctionEditor
	;

	type TFrameContactSpread = class( TFrame )
      pnlSimpleParams: TPanel;
      pnlSimpleParamsTop: TPanel;
      lblFixedContactRate: TLabel;
      lblMeanContactRate: TLabel;
      cbxLatentCanInfect: TCheckBox;
      cbxSubclinicalCanInfect: TCheckBox;
      cbxFixedContactRate: TCheckBox;
      rleFixedContactRate: TREEdit;
      rleMeanContactRate: TREEdit;
      pnlSimpleParamsBottom: TPanel;
      rleInfectionProbability: TREEdit;
      lblInfectionProbability: TLabel;
      pnlCharts: TPanel;
      lblDistanceDistr: TLabel;
      imgPdf1: TImage;
      smcDistanceDistr: TFrameSMFunctionEditor;
      lblTransportDelay: TLabel;
      imgPdf2: TImage;
      smcTransportDelay: TFrameSMFunctionEditor;
      lblMovementControl: TLabel;
      imgRel1: TImage;
      smrMovementControl: TFrameSMFunctionEditor;
    lblLatentUnits: TLabel;

			procedure cbxLatentCanInfectClick(Sender: TObject);
			procedure cbxSubclinicalCanInfectClick(Sender: TObject);
			procedure processText( sender: TObject );
			procedure rleKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
			procedure cbxFixedContactRateClick(Sender: TObject);

		protected
			_cm: TContactModel;
			_ptp: TProductionTypePair;

			_myForm: TForm;

			procedure updateDisplay();

      procedure translateUI();

		public
			constructor create( AOwner: TComponent ); override;
			destructor destroy(); override;

			function isValid(): boolean;

      procedure setForm( val: TForm );

			procedure setContactModel( cm: TContactModel; ptp: TProductionTypePair );
			procedure setContactType( ct: TContactType );
		end
	;

  const
    DBFRAMECONTACTSPREAD: boolean = false; // Set to true to enable debugging messages for this unit

implementation

{$R *.dfm}

  uses
    MyStrUtils,
    GuiStrUtils,
    DebugWindow,
    MyDialogs,
    I88n,

    RegExpDefs,

    ChartFunction,

    FunctionEnums,
    SMSimulationInput,
    FormSMWizardBase,
    FormContactSpread
  ;

  const
    DBSHOWMSG: boolean = false; // Set to true to enable debugging messages for this unit


constructor TFrameContactSpread.create( AOwner: TComponent );
	begin
    inherited create( AOwner );
    translateUI();
      
    _myForm := nil;
 		_cm := nil;
    _ptp := nil;

    pnlSimpleParams.BevelOuter := bvNone;
    pnlSimpleParamsTop.BevelOuter := bvNone;
    pnlSimpleParamsBottom.BevelOuter := bvNone;
    pnlCharts.BevelOuter := bvNone;
    
    rleMeanContactRate.InputExpression := RE_DECIMAL_INPUT;
    rleFixedContactRate.InputExpression := RE_DECIMAL_INPUT;
    rleInfectionProbability.InputExpression := RE_DECIMAL_INPUT;

    lblFixedContactRate.Left := lblMeanContactRate.Left;
    lblFixedContactRate.top := lblMeanContactRate.top;

    rleFixedContactRate.Left := rleMeanContactRate.Left;
    rleFixedContactRate.Top := rleMeanContactRate.Top;

    // The owner of the function editors may not be a form.
    // If it isn't, setForm must be called from the owner's constructor
    if( AOwner is TFormSMWizardBase ) then
      begin
        smcDistanceDistr.setForm( AOwner as TFormSMWizardBase );
        smcTransportDelay.setForm( AOwner as TFormSMWizardBase );
        smrMovementControl.setForm( AOwner as TFormSMWizardBase );
      end
    ;

    smcDistanceDistr.chartType := CTPdf;
    smcDistanceDistr.xUnits := UnitsKilometers;

    smcTransportDelay.chartType := CTPdf;
    smcTransportDelay.xUnits := UnitsDays;

    smrMovementControl.chartType := CTRel;
    smrMovementControl.minY := 0.0;
    smrMovementControl.maxY := 0.0; // there is no maximum
    smrMovementControl.xUnits := UnitsDays;
    smrMovementControl.yUnits := UnitsPercent;
  end
;


procedure TFrameContactSpread.translateUI();
  begin
    // This function was generated automatically by Caption Collector 0.6.0.
    // Generation date: Mon Feb 25 12:56:54 2008
    // File name: C:/Documents and Settings/apreeves/My Documents/NAADSM/Interface-Fremont/sm_forms/FrameContactSpread.dfm
    // File date: Mon Sep 24 12:04:52 2007

    // Set Caption, Hint, Text, and Filter properties
    with self do
      begin
        lblFixedContactRate.Caption := tr( 'Fixed baseline contact rate (integer) (recipient units/unit/day):' );
        lblMeanContactRate.Caption := tr( 'Mean baseline contact rate (recipient units/unit/day):' );
        cbxLatentCanInfect.Caption := tr( 'Latent units can spread disease' );
        cbxSubclinicalCanInfect.Caption := tr( 'Subclinical units can spread disease' );
        cbxFixedContactRate.Caption := tr( 'Use fixed baseline contact rate' );
        lblInfectionProbability.Caption := tr( 'Probability of infection transfer (if source positive) (0 to 1):' );
        lblDistanceDistr.Caption := tr( 'Distance distribution of recipient units:' );
        imgPdf1.Hint := tr( 'This parameter is a probability density function' );
        lblTransportDelay.Caption := tr( 'Shipping delay:' );
        imgPdf2.Hint := tr( 'This parameter is a probability density function' );
        lblMovementControl.Caption := tr( 'Effect of movement controls on baseline contact rate, after detection in any production type (Note: this effect does not apply within zones: movement controls must be specified separately for each zone):' );
        imgRel1.Hint := tr( 'This parameter is a relational function' );
        lblLatentUnits.Caption := tr( '(Latent units cannot spread disease by indirect contact)' );
      end
    ;

  end
;


destructor TFrameContactSpread.destroy();
	begin
 		// This class only holds references, it doesn't own any objects.
    // Nothing should be freed.
    inherited destroy();
  end
;


procedure TFrameContactSpread.setContactModel( cm: TContactModel; ptp: TProductionTypePair );
	begin
   	_cm := cm;
    _ptp := ptp;

    updateDisplay();
  end
;


procedure TFrameContactSpread.updateDisplay();
  begin
    if( _cm.useFixedContactRate ) then
      begin
        cbxFixedContactRate.State := cbChecked;
        rleFixedContactRate.Visible := true;
        lblFixedContactRate.Visible := true;

        rleMeanContactRate.Visible := false;
        lblMeanContactRate.Visible := false;
      end
    else
      begin
        cbxFixedContactRate.State := cbUnchecked;
        rleFixedContactRate.Visible := false;
        lblFixedContactRate.Visible := false;

        rleMeanContactRate.Visible := true;
        lblMeanContactRate.Visible := true;
      end
    ;

    if( 0.0 <= _cm.meanContactRate ) then
    	rleMeanContactRate.text := uiFloatToStr( _cm.meanContactRate )
    else
    	rleMeanContactRate.text := ''
    ;

    if( 0 <= _cm.fixedContactRate ) then
      rleFixedContactRate.Text := uiFloatToStr( _cm.fixedContactRate )
    else
      rleFixedContactRate.Text := ''
    ;

    if( 0.0 <= _cm.probInfect ) then
    	rleInfectionProbability.text := uiFloatToStr( _cm.probInfect )
    else
    	rleInfectionProbability.text := ''
    ;

    cbxLatentCanInfect.Checked := _cm.latentCanInfect;
    cbxSubclinicalCanInfect.Checked := _cm.subClinicalCanInfect;

    setContactType( _cm.contactType );

    if( CMDirect = _cm.contactType ) then
    	begin
        smcDistanceDistr.showChart( _ptp, _cm.pdfDistance, CMDistanceDirect );
        smcTransportDelay.showChart( _ptp, _cm.pdfDelay, CMDelayDirect );
        smrMovementControl.showChart( _ptp, _cm.relMovementControl, CMMovementControlDirect );

        // Hide the infection probability controls, if the sim is using prevalence
        if( (_ptp.sim as TSMSimulationInput).useWithinHerdPrevalence ) then
          begin
            lblInfectionProbability.Caption :=
              tr( '(Probability of infection transfer is determined by within-unit prevalence)' )
            ;
            rleInfectionProbability.Visible := false;
          end
        ;
      end
    else if( CMIndirect = _cm.ContactType ) then
    	begin
        smcDistanceDistr.showChart( _ptp, _cm.pdfDistance, CMDistanceIndirect );
        smcTransportDelay.showChart( _ptp, _cm.pdfDelay, CMDelayIndirect );
        smrMovementControl.showChart( _ptp, _cm.relMovementControl, CMMovementControlIndirect );
      end
    ;
  end
;


procedure TFrameContactSpread.setContactType( ct: TContactType );
  begin
    case ct of
      CMIndirect:
        begin
          cbxLatentCanInfect.Enabled := false;
          cbxLatentCanInfect.Visible := false;
          lblLatentUnits.Visible := true;
          lblLatentUnits.Top := cbxLatentCanInfect.Top;
          lblLatentUnits.Left := cbxLatentCanInfect.left;
          //cbxSubclinicalCanInfect.Left := cbxLatentCanInfect.Left;
        end
      ;
      cmDirect:
        begin
          cbxLatentCanInfect.Enabled := true;
          cbxLatentCanInfect.Visible := true;
          //cbxSubclinicalCanInfect.Left := cbxLatentCanInfect.Left + cbxLatentCanInfect.width + 15;
        end
      ;
    end;
  end
;


procedure TFrameContactSpread.cbxLatentCanInfectClick(Sender: TObject);
  begin
		if( nil <> _cm ) then _cm.latentCanInfect := cbxLatentCanInfect.Checked;
    if ( not (_myForm as TFormContactSpread).LoadingForm  ) then
    (_myForm as TFormSMWizardBase).showStar();
  end
;


procedure TFrameContactSpread.cbxSubclinicalCanInfectClick(Sender: TObject);
  begin
		if( nil <> _cm ) then _cm.subclinicalCanInfect := cbxSubclinicalCanInfect.Checked;
    if ( not (_myForm as TFormContactSpread).LoadingForm  ) then
      (_myForm as TFormSMWizardBase).showStar();
  end
;


procedure TFrameContactSpread.cbxFixedContactRateClick(Sender: TObject);
  begin
    dbcout( 'TFrameContactSpread.cbxFixedContactRateClick(Sender: TObject)', DBSHOWMSG );
    
    if( nil <> _cm ) then _cm.useFixedContactRate := cbxFixedContactRate.Checked;

    updateDisplay();
    if ( not (_myForm as TFormContactSpread).LoadingForm  ) then
      (_myForm as TFormSMWizardBase).showStar();
  end
;


procedure TFrameContactSpread.processText( sender: TObject );
  begin
    dbcout( 'Processing text in FrameContactSpread', DBSHOWMSG );

		if( nil <> _cm ) then
      begin
    	  _cm.meanContactRate := myStrToFloat( rleMeanContactRate.Text, -1.0 );
        _cm.fixedContactRate := MyStrToFloat( rleFixedContactRate.Text, -1.0 );
        _cm.probInfect := MyStrToFloat( rleInfectionProbability.Text, -1.0 );
      end
    ;
  end
;



function TFrameContactSpread.isValid(): boolean;
	begin
    result := true;

    if( nil = _cm ) then
      exit
    ;

    if( not ( _cm.usePrevalence ) ) then
      begin
        if
          ( 0.0 > myStrToFloat( rleInfectionProbability.text, -1.0 ) )
        or
          ( 1.0 < myStrToFloat( rleInfectionProbability.text, -1.0 ) )
        then
          begin
            msgOK(
              tr( 'Probability must be between 0 and 1, inclusive.' ),
              tr( 'Parameter out of range' ),
              IMGCritical,
              _myForm
            );

            rleInfectionProbability.SetFocus();
            result := false;
            exit;
          end
        ;
      end
    ;
  end
;


// This function deals with a little bug in TREEdit.
procedure TFrameContactSpread.rleKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
  var
    rle: TREEdit;
  begin
    if( sender is TREEdit ) then
      begin
        rle := sender as TREEdit;
        if( rle.SelLength = length( rle.Text ) ) then rle.Text := '';

        (_myForm as TFormSMWizardBase).showStar();
      end
    ;
  end
;

procedure TFrameContactSpread.setForm( val: TForm );
  begin
    _myForm := val;
  end
;

end.
