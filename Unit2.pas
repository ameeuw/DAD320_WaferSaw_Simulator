unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin;

type
  TForm2 = class(TForm)
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    Memo1: TMemo;
    Button2: TButton;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  m,n,x,y,clength,scale: integer;
  ns:Array [0..30] of integer;
implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
i: integer;
begin
for i:=1 to 30 do ns[i]:=0;
i:=1;

while i<>30 do
begin
image1.Canvas.Refresh;
if Unit1.Cmd[i,0]='Alip' then begin
x:=0;
y:=0;
image1.Canvas.MoveTo(x,y);
//memo1.Lines.Add('Alip');
end

else if Unit1.Cmd[i,0]='Idx Y' then begin
y:=y+round(strtofloat(Unit1.Cmd[i,7]) * scale);
image1.Canvas.MoveTo(x,y);
//memo1.Lines.Add('Idx Y');
end

else if Unit1.Cmd[i,0]='Idx X' then begin
x:=x+round(strtofloat(Unit1.Cmd[i,7]) * scale);
image1.Canvas.MoveTo(x,y);
//memo1.Lines.Add('Idx X');
end
else

if Unit1.Cmd[i,0]='Idx T' then begin
end

else if Unit1.Cmd[i,0]='Achop' then begin
clength:=round((strtofloat(Unit1.Cmd[i,2]) / 1000000) * scale);
image1.Canvas.LineTo(x+clength,y);
image1.Canvas.MoveTo(x,y);
//memo1.Lines.Add('Achop');
end

else if Unit1.Cmd[i,0]='Loop' then begin
//memo1.Lines.Add('Loop');
if ns[i]<>strtoint(unit1.cmd[i,1]) then begin
//memo1.Lines.Add('NS['+inttostr(i)+'] = ' + inttostr(ns[i]) + ' of ' + unit1.cmd[i,1]);
ns[i]:=ns[i]+1;
i:=strtoint(unit1.cmd[i,2])-1;
//memo1.Lines.Add('Jump to ' + inttostr(i));
end
else
begin
ns[i]:=0;
//n:=n+1;
end;
end

else if Unit1.Cmd[i,0]='End' then begin
ShowMessage('Program End!');
end;
i:=i+1;
//form2.Caption:='i = ' + inttostr(i) + ' ;  ns[ ' + inttostr(i) + ' ] = ' + inttostr(ns[i]);
end;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
n:=0;
m:=1;
x:=0;
y:=0;
clength:=0;
scale:=spinedit1.Value;
image1.Canvas.Create;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form1.Simulator1.Checked:=false;
end;

procedure TForm2.SpinEdit1Change(Sender: TObject);
begin
scale:=spinedit1.Value;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
image1.Canvas.MoveTo(0,0);
image1.Canvas.Brush.Color:=clYellow;
image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);
end;

end.