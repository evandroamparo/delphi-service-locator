program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  IntServicoMensagens in 'IntServicoMensagens.pas',
  UServiceLocator in 'UServiceLocator.pas',
  UServicoMensagensOnline in 'UServicoMensagensOnline.pas',
  UServicoMensagensOffline in 'UServicoMensagensOffline.pas',
  IntServiceLocator in 'IntServiceLocator.pas';

{$R *.res}

var
   ServiceLocator: IServiceLocator;
   Servico: IServicoMensagens;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := true;

  ServiceLocator := TServiceLocator.GetInstance;

  ServiceLocator.Bind(IServicoMensagens, TServicoMensagensOffline);
  ServiceLocator.Bind(IServicoMensagens, TServicoMensagensOnline);
  Servico := ServiceLocator.GetService(IServicoMensagens) as IServicoMensagens;

  Form1 := TForm1.Create(Servico);
  Form1.ShowModal;
end.
