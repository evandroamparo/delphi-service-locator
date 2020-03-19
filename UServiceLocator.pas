unit UServiceLocator;

interface

uses
  Contnrs;

type
   TServiceLocator = class
   private
      class var FServicos: TBucketList;
      class procedure Init;
   public
      class procedure Bind(AInterface: TGUID; Implementacao: TObject); overload;
      class procedure Bind(AInterface: TGUID; AClasse: TClass); overload;
      class function GetService(AInterface: TGUID): TObject;
   end;

implementation

uses
  SysUtils;



class procedure TServiceLocator.Bind(AInterface: TGUID; Implementacao: TObject);
begin
   Init;
   FServicos.Add(@Ainterface, Implementacao);
end;

class procedure TServiceLocator.Bind(AInterface: TGUID; AClasse: TClass);
begin
   Init;
   FServicos.Add(@Ainterface, AClasse.NewInstance.Create);
end;

class function TServiceLocator.GetService(AInterface: TGUID): TObject;
begin
   Init;
   result := nil;
   if FServicos.Exists(@AInterface) then begin
      result := FServicos[@AInterface];
   end;
end;

class procedure TServiceLocator.Init;
begin
   if not Assigned(FServicos) then begin
      FServicos := TBucketList.Create;
   end;
end;

end.
