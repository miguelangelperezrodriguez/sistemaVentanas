program proEnergiaTermicaACS7;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, FrmMenu, frmSecciones, frmdisposicionsecciones, copPersistencia
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, frmdispsecciones);
  //Application.CreateForm(TForm2, frmvwSecciones);
  Application.Run;
end.

