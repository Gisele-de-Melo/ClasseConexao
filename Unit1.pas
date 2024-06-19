//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBConnection, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnConnect: TButton;
    procedure btnConnectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnConnectClick(Sender: TObject);
var
  DBConn: TDBConnection;
begin
  DBConn := TDBConnection.Create;//Cria a instância da classe de conexão
  try
    if DBConn.GetConnection.Connected then //verifica se a classe esta conectada e exibe mensagem de sucesso.
      ShowMessage('Successfully connected to the database!');
  finally
    DBConn.Free;
  end;
end;

end.
