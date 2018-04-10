unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
   ssl_openssl, httpsend, windows ;     //   ssl_openssl_lib,

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;


var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  HTTP: THTTPSend;
  h: Handle;
  i: integer;
begin
  HTTP := THTTPSend.Create;
  HTTP.Headers.Add('Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8');
  HTTP.Headers.Add('Accept-Encoding: gzip, deflate, br');
  HTTP.Headers.Add('Accept-Language: ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7');
  try
    if not HTTP.HTTPMethod('GET',Edit1.text) then
        begin
          ShowMessage('fire!');
        end;
    Memo1.Lines.LoadFromStream(HTTP.Document);
    Memo1.Lines.Add('');
    Memo1.Lines.Add('Result code:'+IntToStr(HTTP.ResultCode));
    Memo1.Lines.Add('');
    Memo1.Lines.Append( HTTP.Headers.Text);
  finally
    HTTP.Free;
  end;
end;

end.

