unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, Buttons, TeeProcs, TeEngine, Chart,
  Series, Gauges, ComCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    Memo1: TMemo;
    Button2: TButton;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    Label3: TLabel;
    Button3: TButton;
    BitBtn2: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Label3DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  m,n,x,y,clength,scale,i,steps,progress: integer;
  ns:Array [0..30] of integer;
implementation

uses Unit1;

{$R *.dfm}

procedure CountSteps();
begin
steps:=0;
progress:=0;
for i:=1 to 30 do ns[i]:=0;
i:=1;
while i<>30 do
begin
steps:=steps+1;
if Unit1.Cmd[0,i]='Loop' then begin
if ns[i]<>(strtoint(unit1.cmd[1,i])-1) then begin
ns[i]:=ns[i]+1;
i:=strtoint(unit1.cmd[2,i])-1;
end
else
ns[i]:=0;
end;
i:=i+1;
end;
form2.progressbar1.Max:=steps;
i:=0;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
for i:=1 to 30 do ns[i]:=0;
i:=1;
while i<>30 do
begin
image1.Canvas.Refresh;
if Unit1.Cmd[0,i]='Alip' then begin
x:=0;
y:=0;
image1.Canvas.MoveTo(x,y);
end

else if Unit1.Cmd[0,i]='Idx_Y' then begin
y:=y+round((strtofloat(Unit1.Cmd[7,i]) / 1000000) * scale);
image1.Canvas.MoveTo(x,y);
end

else if Unit1.Cmd[0,i]='Idx_X' then begin
x:=x+round((strtofloat(Unit1.Cmd[7,i]) /1000000) * scale);
image1.Canvas.MoveTo(x,y);
end
else

if Unit1.Cmd[0,i]='Idx_T' then begin
end

else if Unit1.Cmd[0,i]='Achop' then begin
clength:=round((strtofloat(Unit1.Cmd[2,i]) / 1000000) * scale);
image1.Canvas.LineTo(x+clength,y);
image1.Canvas.MoveTo(x,y);
end

else if Unit1.Cmd[0,i]='Loop' then begin
if ns[i]<>(strtoint(unit1.cmd[1,i])-1) then begin
ns[i]:=ns[i]+1;
i:=strtoint(unit1.cmd[2,i])-1;
end
else
begin
ns[i]:=0;
end;
end

else if Unit1.Cmd[0,i]='End' then begin
i:=29;
ShowMessage('Program End!');
end;
i:=i+1;
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

procedure TForm2.Timer1Timer(Sender: TObject);
begin
if i<>30 then
begin
progress:=progress+1;
ProgressBar1.Position:=progress;
label3.Caption:=inttostr(progress)+' / '+inttostr(progressbar1.Max);
image1.Canvas.Refresh;
if Unit1.Cmd[0,i]='Ali_p' then begin
x:=0;
y:=0;
image1.Canvas.MoveTo(x,y);
memo1.Lines.Add('Ali_p (x=' + inttostr(x) + ', y=' + inttostr(y) + ')');
end

else if Unit1.Cmd[0,i]='Idx_Y' then begin
y:=y+round((strtofloat(Unit1.Cmd[7,i]) / 1000000) * scale);
image1.Canvas.MoveTo(x,y);
memo1.Lines.Add('i: '+ inttostr(i));
memo1.Lines.Add('Idx Y (x=' + inttostr(x) + ', y=' + inttostr(y) + ', D=' + inttostr(round((strtofloat(Unit1.Cmd[7,i]) / 1000000) * scale)) + ')');
end

else if Unit1.Cmd[0,i]='Idx_X' then begin
x:=x+round((strtofloat(Unit1.Cmd[7,i]) / 1000000) * scale);
image1.Canvas.MoveTo(x,y);
memo1.Lines.Add('Idx X (x=' + inttostr(x) + ', y=' + inttostr(y) + ', D=' + inttostr(round( (strtofloat(Unit1.Cmd[7,i]) / 1000000) * scale)) + ')');
end
else

if Unit1.Cmd[0,i]='Idx_T' then begin
end

else if Unit1.Cmd[0,i]='Achop' then begin
clength:=round((strtofloat(Unit1.Cmd[2,i]) / 1000000) * scale);
image1.Canvas.LineTo(x+clength,y);
image1.Canvas.MoveTo(x,y);
memo1.Lines.Add('Achop (x=' + inttostr(x) + ', y=' + inttostr(y) + ', clength=' + inttostr(clength) + ')');
end

else if Unit1.Cmd[0,i]='Loop' then begin
//memo1.Lines.Add('Loop');
if ns[i]<>(strtoint(unit1.cmd[1,i])-1) then begin
//memo1.Lines.Add('NS['+inttostr(i)+'] = ' + inttostr(ns[i]) + ' of ' + unit1.cmd[1,i]);
ns[i]:=ns[i]+1;
i:=strtoint(unit1.cmd[2,i])-1;
//memo1.Lines.Add('Jump to ' + inttostr(i));
end
else
begin
ns[i]:=0;
//n:=n+1;
end;
end

else if Unit1.Cmd[0,i]='End' then begin
Timer1.Enabled:=False;
i:=29;
ShowMessage('Program End!');
end;
i:=i+1;
//form2.Caption:='i = ' + inttostr(i) + ' ;  ns[ ' + inttostr(i) + ' ] = ' + inttostr(ns[i]);
end;
end;

procedure TForm2.SpinEdit2Change(Sender: TObject);
begin
timer1.Interval:=spinedit2.Value;
end;

procedure ResetTimer();
begin
for i:=1 to 30 do ns[i]:=0;
i:=1;
form2.Timer1.Interval:=form2.spinedit2.Value;
form2.image1.Canvas.MoveTo(0,0);
form2.image1.Canvas.Brush.Color:=clYellow;
form2.image1.Canvas.Rectangle(0,0,form2.image1.Width,form2.image1.Height);
CountSteps();
n:=0;
m:=1;
x:=0;
y:=0;
clength:=0;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
if timer1.Enabled=false then
begin
if i=0 then ResetTimer();
timer1.Enabled:=true;
bitbtn1.Kind:=bkNo;
bitbtn1.Caption:='Stop';
end
else
begin
timer1.Enabled:=false;
bitbtn1.Kind:=bkIgnore;
bitbtn1.Caption:='Start';
end;
end;



procedure TForm2.Label3DblClick(Sender: TObject);
begin
ResetTimer();
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
var i,n:integer;
begin
memo1.Lines.Clear;
for i:=0 to 8 do
for n:=1 to 30 do
memo1.Lines.Add(unit1.cmd[i,n]);
end;

end.
