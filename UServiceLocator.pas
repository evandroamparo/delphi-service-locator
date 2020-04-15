unit UServiceLocator;

interface

uses
  Contnrs, IntServiceLocator;

type

   TItemServico = class
      AInterface: TGUID;
      Implementacao: TObject;
   end;

   TServiceLocator = class(TInterfacedObject, IServiceLocator)
   private
      FServicos: TObjectList;
      class var FInstance: IServiceLocator;
      procedure ExcluirServico(AInterface: TGUID);
      function EncontrarServico(AInterface: TGUID): TItemServico;
   public
      procedure Bind(AInterface: TGUID; Implementacao: TObject); overload;
      procedure Bind(AInterface: TGUID; AClasse: TClass); overload;
      function GetService(AInterface: TGUID): IInterface;

      class function GetInstance: IServiceLocator;
      constructor Create;
      destructor Destroy; override;
   end;

implementation

uses
  SysUtils;

procedure TServiceLocator.Bind(AInterface: TGUID; Implementacao: TObject);
var
  Item: TItemServico;
begin
   ExcluirServico(AInterface);
   Item := TItemServico.Create;
   Item.AInterface := AInterface;
   Item.Implementacao := Implementacao;
   FServicos.Add(Item);
end;

procedure TServiceLocator.Bind(AInterface: TGUID; AClasse: TClass);
begin
   Bind(AInterface, AClasse.NewInstance.Create);
end;

constructor TServiceLocator.Create;
begin
   FServicos := TObjectList.Create;
end;

destructor TServiceLocator.Destroy;
begin
  FServicos.Free;
  inherited;
end;

function TServiceLocator.EncontrarServico(AInterface: TGUID): TItemServico;
var
  I: Integer;
  Item: TItemServico;
begin
   result := nil;
   for I := 0 to FServicos.Count - 1 do begin
      Item := FServicos[I] as TItemServico;
      if GUIDToString(Item.AInterface) = GUIDToString(AInterface) then begin
         result := Item;
         exit;
      end;
   end;
end;

procedure TServiceLocator.ExcluirServico(AInterface: TGUID);
var
  Servico: TItemServico;
begin
   Servico := EncontrarServico(AInterface);
   if Servico <> nil then begin
      FreeAndNil(Servico.Implementacao);
      FServicos.Remove(Servico);
   end;
end;

class function TServiceLocator.GetInstance: IServiceLocator;
begin
   if not Assigned(FInstance) then begin
      FInstance := TServiceLocator.Create;
   end;
   result := FInstance;
end;

function TServiceLocator.GetService(AInterface: TGUID): IInterface;
var
  Intf: IInterface;
  Item: TItemServico;
begin
   Item := EncontrarServico(AInterface);
   if Item <> nil then begin
      if Item.Implementacao.GetInterface(AInterface, Intf) then begin
         result := Intf;
      end;
   end;
end;

end.

