unit SMScenario;

(*
SMScenario.pas
--------------
Begin: 2005/09/01
Last revision: $Date: 2008/11/25 22:00:58 $ $Author: areeves $
Version number: $Revision: 1.17 $
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
    SMSimulationInput,
    Herd,
    ProductionType,
    ProductionTypeList
  ;

  type TSMScenario = class( TObject )
    protected
      _herdList: THerdList;
      _simInput: TSMSimulationInput;

      function getHerdList(): THerdList;
      function getSimInput(): TSMSimulationInput;

      function getUpdated(): boolean;

    public
      constructor create(); overload;
      constructor create( s: TSMSimulationInput; h: THerdList ); overload;
      constructor create( const src: TSMScenario; copyHerdList: boolean ); overload;

      destructor destroy(); override;

      procedure resetSimInput( val: TSMSimulationInput );

      procedure resetPtList( list: TProductionTypeList );

      property herdList: THerdList read getHerdList;
      property simInput: TSMSimulationInput read getSimInput; // write setSimInput;

      property updated: boolean read getUpdated;
    end
  ;


implementation

  uses
    SysUtils,
    MyStrUtils,
    USStrUtils
  ;

  constructor TSMScenario.create();
    begin
      inherited create();
      _herdList := nil;
      _simInput := nil;
    end
  ;


  constructor TSMScenario.create( s: TSMSimulationInput; h: THerdList );
    begin
      inherited create();
      _simInput := s;
      _herdList := h;
    end
  ;


  constructor TSMScenario.create( const src: TSMScenario; copyHerdList: boolean );
    begin
      inherited create();

      _simInput := TSMSimulationInput.create( src._simInput );

      if( copyHerdList ) then
        begin
          _herdList := THerdList.create( src._herdList );
          _simInput.ptList.recountUnits( _herdList );
        end
      else
        _herdList := nil
      ;
    end
  ;


  destructor TSMScenario.destroy();
    begin
      freeAndNil( _herdList );
      freeAndNil( _simInput );
      inherited destroy();
    end
  ;


  procedure TSMScenario.resetPtList( list: TProductionTypeList );
    begin
      _simInput.ptList.Free();
      _simInput.ptList := list;
      
      _herdList.resetSim( _simInput );

      _simInput.ptList.recountUnits( _herdList );
    end
  ;


  procedure TSMScenario.resetSimInput( val: TSMSimulationInput );
    begin
      if( nil <> _simInput ) then freeAndNil( _simInput );
      
      _simInput := TSMSimulationInput.create( val );
    end
  ;

  
  function TSMScenario.getHerdList(): THerdList; begin result := _herdList; end;
  function TSMScenario.getSimInput(): TSMSimulationInput; begin result := _simInput; end;

  function TSMScenario.getUpdated(): boolean;
    begin
      result := _simInput.Updated;

      if( result ) then
        begin
          if( nil <> _herdList ) then
            result := _herdList.updated
          ;
        end
      ;
    end
  ;

end.
