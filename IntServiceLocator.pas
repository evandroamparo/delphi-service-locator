unit IntServiceLocator;

interface

type
   IServiceLocator = interface
      ['{AAF6BDBA-03D2-4BE0-B478-9FFC69F1FA2A}']
      procedure Bind(AInterface: TGUID; Implementacao: TObject); overload;
      procedure Bind(AInterface: TGUID; AClasse: TClass); overload;
      function GetService(AInterface: TGUID): IInterface;
   end;

implementation

end.
