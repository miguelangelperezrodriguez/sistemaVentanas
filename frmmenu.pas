unit FrmMenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, Buttons, frmSecciones, frmdisposicionsecciones,Contnrs;

  // Contnrs,  // Lista de Objetos

const
  minflujo = 1;
  maxflujo = 3;

type

  { TForm1 }

  // Estados posibles de flujo
  tflujo = 1..3;

  TForm1 = class(TForm)
    Btncerradasupderecha: TBitBtn;
    Btncerradainfderecha: TBitBtn;
    btndesacoplarsupderecha: TBitBtn;
    btndesacoplarinfderecha: TBitBtn;
    Btnexpandirsupderecha: TBitBtn;
    Btnexpandirinfderecha: TBitBtn;
    btnflujosupderecha: TButton;
    btnflujoinfderecha: TButton;
    btnmoverdatosizda: TBitBtn;
    Btncerrarizda1: TBitBtn;
    Btnexpandirizda: TBitBtn;
    btnflujoizda: TButton;
    btndesacoplarizda: TBitBtn;
    btnmoverdatossupderecha: TBitBtn;
    btnmoverdatosinfderecha: TBitBtn;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    paninfderecho: TPanel;
    pansupderecho: TPanel;
    panelderecho: TPanel;
    panelizdo: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    procedure BtncerrarizdaClick(Sender: TObject);
    procedure btndesacoplarizdaClick(Sender: TObject);
    procedure BtnexpandirizdaClick(Sender: TObject);
    procedure btnflujoizdaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private
    // Actualizar GUI
    procedure ActualizarDispVentanas();
    procedure ActualizarBotonesFlujo();
  public

  end;

var
  Form1: TForm1;

  // Disposicion actual
  dispactualventanas : tdispventanas;

  formulariosPrograma1 : TForm;      // Lado izdo
  formulariosPrograma2 : TForm;      // Lado superior derecho
  formulariosPrograma3 : TForm;      // Lado inferior izdo


  flujoformularioPrograma1 : tflujo;
  flujoformularioPrograma2 : tflujo;
  flujoformularioPrograma3 : tflujo;

implementation

{$R *.lfm}

{ TForm1 }

// Configuracion del entorno de trabajo
procedure TForm1.MenuItem4Click(Sender: TObject);
var
  res : integer;
begin
     res:=frmdispsecciones.ShowModal;
     // Cambiar estado ventanas
     if (res=mrOK) then
     begin
       dispactualventanas.ladoizdo:=frmdisposicionsecciones.confdisp.ladoizdo;
       dispactualventanas.ladosupderecho:=frmdisposicionsecciones.confdisp.ladosupderecho;
       dispactualventanas.ladoinfderecho:=frmdisposicionsecciones.confdisp.ladoinfderecho;
       ActualizarDispVentanas();
     end;
end;

// Poner formulario secciones en zona 1
procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  formulariosPrograma1.Free;
  formulariosPrograma1:=TForm2.Create(self);
  formulariosPrograma1.Parent:=panelizdo;
  formulariosPrograma1.Show;

end;

procedure TForm1.MenuItem8Click(Sender: TObject);
var
  i : integer;
begin
  for i:=1 to maxventanassecciones do
    if (frmvwSeccionesExterno[i]<>nil) then
      if (not frmvwSeccionesExterno[i].Visible) then
      begin
        frmvwSeccionesExterno[i].Free;
        frmvwSeccionesExterno[i]:=nil;
      end;

  for i:=1 to maxventanassecciones do
    begin
      if frmvwSeccionesExterno[i]=nil then
        begin
          frmvwSeccionesExterno[i]:=TForm2.Create(self);
          frmvwSeccionesExterno[i].Parent:=nil;
          frmvwSeccionesExterno[i].Show;

          // Hay que pasar los datos del formulario

          break;
        end;
    end;

end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  if panelizdo.Width<(self.Width-15) then
     panelizdo.Width:=panelizdo.Width+10;
end;


procedure TForm1.ActualizarBotonesFlujo();
begin
  btnflujoizda.Caption:=IntToStr(flujoformularioPrograma1);
  {
     FALTAN PROGRAMA 2 Y 3
  }
end;

procedure TForm1.ActualizarDispVentanas();
var
  nroformactivos : integer;
begin

  nroformactivos:=0;
  if (dispactualventanas.ladoizdo) then Inc(nroformactivos);
  if (dispactualventanas.ladosupderecho) then Inc(nroformactivos);
  if (dispactualventanas.ladoinfderecho) then Inc(nroformactivos);

  // TRES FORMULARIOS
  if (nroformactivos=3) then
  begin
    panelizdo.Align:=TAlign.alLeft;
    pansupderecho.Align:=TAlign.alTop;
    paninfderecho.Align:=TAlign.alClient;
  end;

  // UN SOLO FORMULARIO
  if (nroformactivos=1) then
  begin
    if (dispactualventanas.ladoizdo) and (not dispactualventanas.ladosupderecho) and
      (not dispactualventanas.ladoinfderecho) then
        panelizdo.Align:=TAlign.alClient;

    if (dispactualventanas.ladosupderecho) and (not dispactualventanas.ladoizdo) and
      (not dispactualventanas.ladoinfderecho) then
      pansupderecho.Align:=TAlign.alClient;

    if (dispactualventanas.ladoinfderecho) and (not dispactualventanas.ladoizdo) and
      (not dispactualventanas.ladosupderecho) then
        paninfderecho.Align:=TAlign.alClient;
    end;

    // DOS FORMULARIOS
    if (nroformactivos=2) then
    begin
         if (dispactualventanas.ladoizdo) and (dispactualventanas.ladosupderecho) and
         (not dispactualventanas.ladoinfderecho) then
         begin
              panelizdo.Align:=TAlign.alLeft;
              pansupderecho.Align:=TAlign.alClient;
         end;

         if (not dispactualventanas.ladoizdo) and (dispactualventanas.ladosupderecho) and
            (dispactualventanas.ladoinfderecho) then
         begin
           pansupderecho.Align:=TAlign.alTop;
           paninfderecho.Align:=TAlign.alClient;
         end;

         if (dispactualventanas.ladoizdo) and (not dispactualventanas.ladosupderecho) and
           (dispactualventanas.ladoinfderecho) then
         begin
           panelizdo.Align:=TAlign.alLeft;
           paninfderecho.Align:=TAlign.alClient;
           end;
    end;

  // Visualizamos los paneles activados
  panelizdo.Visible:=dispactualventanas.ladoizdo;
  pansupderecho.Visible:=dispactualventanas.ladosupderecho;
  paninfderecho.Visible:=dispactualventanas.ladoinfderecho;
  if (not dispactualventanas.ladosupderecho) and (not dispactualventanas.ladoinfderecho) then
    panelderecho.Visible:=false
  else
    panelderecho.Visible:=true


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  dispactualventanas.ladoizdo:=true;
  dispactualventanas.ladosupderecho:=true;
  dispactualventanas.ladoinfderecho:=true;

  ActualizarDispVentanas();

  // Flujos
  flujoformularioPrograma1:=1;
  flujoformularioPrograma2:=1;
  flujoformularioPrograma3:=1;

  ActualizarBotonesFlujo();

end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  if (panelizdo.Width>15) then
     panelizdo.Width:=panelizdo.Width-10;
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  if (pansupderecho.Height<self.height-50) then
     pansupderecho.Height:=pansupderecho.Height+10;
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  if (pansupderecho.Height>10) then
    pansupderecho.Height:=pansupderecho.Height-10;
end;

// Cerrar lado izdo.
procedure TForm1.BtncerrarizdaClick(Sender: TObject);
begin
  if (formulariosPrograma1<>nil) then
  begin
    dispactualventanas.ladoizdo:=false;
    formulariosPrograma1.Close;
    ActualizarDispVentanas();
  end;
end;


// ESTRUCTURA GLOBAL DE VENTANAS DESACOPLADAS
////////////////////////////////////////////////
procedure TForm1.btndesacoplarizdaClick(Sender: TObject);
var i : 1..maxventanassecciones;
begin

  if (formulariosPrograma1<>nil) then
  begin
    dispactualventanas.ladoizdo:=false;
    ActualizarDispVentanas();

    // Es un formulario de Secciones
    if (formulariosPrograma1 is TForm2) then
    begin
        for i:=1 to maxventanassecciones do
          if (frmvwSeccionesExterno[i]<>nil) then
            if (not frmvwSeccionesExterno[i].Visible) then
            begin
              frmvwSeccionesExterno[i].Free;
              frmvwSeccionesExterno[i]:=nil;
            end;

         for i:=1 to maxventanassecciones do
         begin
           if frmvwSeccionesExterno[i]=nil then
           begin
             frmvwSeccionesExterno[i]:=TForm2.Create(self);
             frmvwSeccionesExterno[i].Parent:=nil;
             frmvwSeccionesExterno[i].Show;

             // Hay que pasar los datos del formulario

             break;
           end;
         end;
    end;

    formulariosPrograma1.Close;

  end;
end;

procedure TForm1.BtnexpandirizdaClick(Sender: TObject);
begin
  if (formulariosPrograma1<>nil) then
  begin
    dispactualventanas.ladoizdo:=true;
    dispactualventanas.ladoinfderecho:=false;
    dispactualventanas.ladosupderecho:=false;
    ActualizarDispVentanas();
  end;
end;

procedure TForm1.btnflujoizdaClick(Sender: TObject);
begin
  if flujoformularioPrograma1=3 then
    flujoformularioPrograma1:=1
  else
    flujoformularioPrograma1:=flujoformularioPrograma1+1;
  ActualizarBotonesFlujo();
end;

end.

