program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  IntServicoMensagens in 'IntServicoMensagens.pas',
  UServiceLocator in 'UServiceLocator.pas',
  UServicoMensagensOnline in 'UServicoMensagensOnline.pas';

{$R *.res}

var
   Servico: IServicoMensagens;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  TServiceLocator.Bind(IServicoMensagens, TServicoMensagensOnline);
  Servico := TServicoMensagensOnline(TServiceLocator.GetService(IServicoMensagens));

  Form1 := TForm1.Create(Servico);
  Form1.ShowModal;
  Application.Run;
end.
