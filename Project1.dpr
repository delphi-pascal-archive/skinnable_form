program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Licence};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Votre premier pas dans le monde du Skinnable...';
  Application.CreateForm(TLicence, Licence);
  Application.Run;
end.
