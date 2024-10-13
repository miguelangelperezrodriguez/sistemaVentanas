unit frmSecciones;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

const
    maxventanassecciones = 10;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
  private

  public

  end;

var
  frmvwSecciones: TForm2;
  frmvwSeccionesExterno : array [1..maxventanassecciones] of TForm2;

implementation

{$R *.lfm}

end.

