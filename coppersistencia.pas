{ Ejemplo Persistencia }
//program Project1;
unit coppersistencia;
{$mode objfpc}
interface
uses classes,sysutils;
{
type
  TMyClass = class(TPersistent)
  public
    procedure AssignTo(source:TPersistent);override;
  end;

  TMyClass2 = class(Tpersistent);

  procedure TmyClass.AssignTo(Source: TPersistent);
  var
   MyClass : TMyClass;
  begin
    if Source is TmyClass then  // always test with is, not as: that will also fail when it is wrong.
    begin
      MyClass := TmyClass(Source);  // can now hard cast, no soft cast
      // Copy properties here
    end
    else if Source = nil then  // this is because nil is actually valid...
     Self := Default(TMyClass);// initializes everything to default values
   else
     // important
      inherited; // this will raise an EConvertError exception. If you leave out this you will get a crash..
   end;
// example code
var
  a,b:TMyClass;
  c:TMyclass2;
begin
  a:= TMyClass.Create;
  b:= TMyClass.Create;
  try
    try
      a.Assign(b);
      writeln('Ok');
    except
      on e:EConvertError do
        Writeln(e.Message) else raise
    end;
  finally
    b.free;
    a.free;
  end;
  a:= TMyClass.Create;
  c := TMyClass2.Create;
  try
    try
      a.Assign(c);
      writeln('Ok');  // will never be reached, exception will be raised.
    except
      On e:EConvertError do
        writeln(e.message) else raise
    end;
  finally
    c.free;
    a.free;
  end;
}
implementation
end.


