unit FormSplash;

(*
FormSplash.pas/dfm
------------------
Begin: 2006/04/03
Last revision: $Date: 2008/03/14 19:19:57 $ $Author: areeves $
Version: $Revision: 1.17 $
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
    ExtCtrls
  ;

  type TFormSplash = class( TForm )
      Timer1: TTimer;
      pnlWholeForm: TPanel;
      lblVersion: TLabel;
      imgAppTitle: TImage;
      lblAdditionalInfo: TLabel;
      lblCopyright: TLabel;
      procedure FormClose(Sender: TObject; var Action: TCloseAction); virtual;
      procedure timerTimeout(Sender: TObject); virtual;

    protected
      procedure translateUI();

    public
      constructor create( AOwner: TComponent ); override;
      destructor destroy(); override;
      
    end
  ;

  var
    frmSplash: TFormSplash;


implementation

{$R *.dfm}

  uses
    ShellAPI,

    Resources,
    DialogLongMessage,
    ControlUtils,
    MyStrUtils,
    GuiStrUtils,
    DebugWindow,
    I88n,

    StringConsts
  ;

  const
    DBSHOWMSG: boolean = false; // Set to true to enable debugging messages for this unit


  constructor TFormSplash.create( AOwner: TComponent );
    begin
      inherited create( AOwner );
      translateUI();

      self.Hide();
      lblVersion.Caption := tr( 'Version' ) + ' ' + MAJORVERSIONNUMBER + '.' + MINORVERSIONNUMBER + ' ' + tr( 'Build' ) + ' ' + BUILDNUMBER + ' ' + BRANCHNAME;

      borderStyle := bsNone;

      pnlWholeForm.bevelWidth := 2;
      pnlWholeForm.BevelOuter := bvRaised;
      pnlWholeForm.BevelInner := bvLowered;

      if Screen.PixelsPerInch <> 96 then
        ScaleBy( Screen.PixelsPerInch, 96 )
      ;

      centerChildren( pnlWholeForm );

      self.Show();
    end
  ;


  procedure TFormSplash.translateUI();
    begin
      // This function was generated automatically by Caption Collector 0.6.0.
      // Generation date: Mon Feb 25 12:56:54 2008
      // File name: C:/Documents and Settings/apreeves/My Documents/NAADSM/Interface-Fremont/sm_forms/FormSplash.dfm
      // File date: Fri Jan 19 17:43:54 2007

      // Set Caption, Hint, Text, and Filter properties
      with self do
        begin
          Caption := tr( 'NAADSM splash screen' );
          lblVersion.Caption := tr( 'Version' ) + ' ' + MAJORVERSIONNUMBER + '.' + MINORVERSIONNUMBER + ' ' + tr( 'Build' ) + ' ' + BUILDNUMBER;
          lblAdditionalInfo.Caption := tr( 'Please see ''About NAADSM'' for contact and support information.' );
          lblCopyright.Caption := tr( 'Copyright � 2003 - 2008 Animal Population Health Institute at Colorado State University and University of Guelph' );
        end
      ;

    end
  ;

  
 	destructor TFormSplash.destroy();
    begin
      dbcout( 'Splash screen will be destroyed.', DBSHOWMSG );
      frmSplash := nil;
      inherited destroy();
    end
  ;

  procedure TFormSplash.FormClose(Sender: TObject; var Action: TCloseAction);
    begin
      Action := caFree;
    end
  ;


  procedure TFormSplash.timerTimeout(Sender: TObject);
    begin
      close();
    end
  ;


end.
