unit frmdisposicionsecciones;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  tdispventanas = record
    ladoizdo : boolean;
    ladosupderecho : boolean;
    ladoinfderecho : boolean;
  end;

  { TForm3 }

  TForm3 = class(TForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    ToggleBox1: TToggleBox;
    ToggleBox2: TToggleBox;
    ToggleBox3: TToggleBox;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frmdispsecciones: TForm3;
  confdisp : tdispventanas;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.btnAceptarClick(Sender: TObject);
begin
  confdisp.ladoizdo:=ToggleBox1.Checked;
  confdisp.ladosupderecho:=ToggleBox2.Checked;
  confdisp.ladoinfderecho:=ToggleBox3.Checked;
  ModalResult:=mrOK;
end;

procedure TForm3.btnCancelarClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  ToggleBox1.Checked:=confdisp.ladoizdo;
  ToggleBox2.Checked:=confdisp.ladosupderecho;
  ToggleBox3.Checked:=confdisp.ladoinfderecho;
end;

end.

