unit UServicoMensagensOnline;

interface

uses
  IntServicoMensagens;

type
   TServicoMensagensOnline = class(TInterfacedObject, IServicoMensagens)
      function GetMensagem: string;
      constructor Create;
      destructor Destroy; override;
   end;

implementation

{ TServicoMensagensOnline }

constructor TServicoMensagensOnline.Create;
begin
   inherited;
end;

destructor TServicoMensagensOnline.Destroy;
begin

  inherited;
end;

function TServicoMensagensOnline.GetMensagem: string;
begin
   result := 'Online';
end;

end.
