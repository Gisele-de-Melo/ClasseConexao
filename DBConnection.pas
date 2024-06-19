unit DBConnection;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait;

type
  TDBConnection = class
  private
    FConnection: TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;
    function GetConnection: TFDConnection;
  end;

implementation

{ TDBConnection }

constructor TDBConnection.Create;
begin
  FConnection := TFDConnection.Create(nil);
  FConnection.DriverName := 'MySQL';
  FConnection.Params.DriverID := 'MySQL';
  FConnection.Params.Database := 'world';
  FConnection.Params.UserName := 'root';
  FConnection.Params.Password := '1234';
  FConnection.Params.Add('Server=localhost');
  try
    FConnection.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Error connecting to the database: ' + E.Message);
  end;
end;

destructor TDBConnection.Destroy;
begin
  FConnection.Free;
  inherited;
end;

function TDBConnection.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

end.
