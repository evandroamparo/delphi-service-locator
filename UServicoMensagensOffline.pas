unit UServicoMensagensOffline;

interface

uses
  IntServicoMensagens;

type
   TServicoMensagensOffline = class(TInterfacedObject, IServicoMensagens)
      function GetMensagem: string;
   end;

implementation

function TServicoMensagensOffline.GetMensagem: string;
begin
   result := 'Offline';
end;

end.
