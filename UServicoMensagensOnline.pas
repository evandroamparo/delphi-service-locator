unit UServicoMensagensOnline;

interface

uses
  IntServicoMensagens;

type
   TServicoMensagensOnline = class(TInterfacedObject, IServicoMensagens)
      function GetMensagem: string;
   end;

implementation

function TServicoMensagensOnline.GetMensagem: string;
begin
   result := 'Online';
end;

end.
