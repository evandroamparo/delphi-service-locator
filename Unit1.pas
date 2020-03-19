unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IntServicoMensagens;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    FServicoMensagens: IServicoMensagens;
  public
    constructor Create(ServicoMensagens: IServicoMensagens); reintroduce;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
   ShowMessage(FServicoMensagens.GetMensagem);
end;

constructor TForm1.Create(ServicoMensagens: IServicoMensagens);
begin
   inherited Create(Application);
   FServicoMensagens := ServicoMensagens;
end;

end.
