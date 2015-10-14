unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, ShellCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    StringGrid1: TStringGrid;
    code: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Cmd, Cmd2:Array [1..30,0..8] of String;
  CSV: String;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i,n: integer;
temp1,temp2: TStringlist;
begin
//Lade die .csv-Datei in die temp1-Stringlist;

temp1:=TStringList.Create;
temp2:=TStringList.Create;
temp1.LoadFromFile('pzt.csv');
temp1.NameValueSeparator:=';';
temp2.NameValueSeparator:=';';
temp2.Delimiter:=';';

//Lese Parameter 0 bis 8 von Befehl 1 bis 30 ein

for i:=1 to 30 do
begin
temp2.Add(temp1.ValueFromIndex[i]);
for n:=0 to 8 do
begin
temp2.Add(temp2.ValueFromIndex[n]);
Cmd[i,n]:=temp2.Names[n];
stringgrid1.Cells[n,i]:=Cmd[i,n];
end;
temp2.Clear;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
StringGrid1.Cells[0,0]:='Mode';
StringGrid1.Cells[1,0]:='PARA_1';
StringGrid1.Cells[2,0]:='PARA_2';
StringGrid1.Cells[3,0]:='PARA_3';
StringGrid1.Cells[4,0]:='HEIGHT';
StringGrid1.Cells[5,0]:='MODE';
StringGrid1.Cells[6,0]:='SPEED';
StringGrid1.Cells[7,0]:='INDEX';
StringGrid1.Cells[8,0]:='MODE';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
i: integer;
template, code2: TStringList;
begin
code.Clear;
template:=TStringlist.Create;
code2:=TStringlist.create;
template.LoadFromFile('pre.DAC');
code.Lines.AddStrings(template);
code2.AddStrings(template);

//Add DAC_HEI Values
code.Lines.Add('DAC_HEI = [32, 0, 0');
code2.Add('DAC_HEI = [32, 0, 0');
for i:=1 to 30 do
begin
code.Lines.Strings[code.Lines.Count-1]:=code.Lines.Strings[code.Lines.Count-1] + ', ' + floattostr(strtofloat(Cmd[i,4])*10000000);
code2.Strings[code.Lines.Count-1]:=code2.Strings[code.Count-1] + ', ' + floattostr(strtofloat(Cmd[i,4])*10000000);
end;
code.Lines.Strings[code.Lines.Count-1]:=code.Lines.Strings[code.Lines.Count-1]+']';
code2.Strings[code.Count-1]:=code.Strings[code.Count-1]+']';
//Add DAC_SPD Values
code.Lines.Add('DAC_SPD = [32, 0, 0');
for i:=1 to 30 do
begin
code.Lines.Strings[code.Lines.Count-1]:=code.Lines.Strings[code.Lines.Count-1] + ', ' + floattostr(strtofloat(Cmd[i,6])*10000000);
end;
code.Lines.Strings[code.Lines.Count-1]:=code.Lines.Strings[code.Lines.Count-1]+']';

//Add DAC_IDX Values
code.Lines.Add('DAC_IDX = [32, 0, 0');
for i:=1 to 30 do
begin
code.Lines.Strings[code.Lines.Count-1]:=code.Lines.Strings[code.Lines.Count-1] + ', ' + floattostr(strtofloat(Cmd[i,7])*10000000);
end;
code.Lines.Strings[code.Lines.Count-1]:=code.Lines.Strings[code.Lines.Count-1]+']';

//Add PARAM_1 Values
for i:=1 to 30 do
begin
code.Lines.Add('PA'+ Format('%.2d',[i]) + ' = ');
code.Lines.Strings[code.Lines.Count-1]:=code.Lines.Strings[code.Lines.count-1]+Cmd[i,1];
end;

//Add PARAM_2 Values
for i:=1 to 30 do
begin
code.Lines.Add('PB'+ Format('%.2d',[i]) + ' = ');
code.Lines.Strings[code.Lines.Count-1]:=code.Lines.Strings[code.Lines.count-1]+Cmd[i,2];
end;

//Add PARAM_3 Values
for i:=1 to 30 do
begin
code.Lines.Add('PC'+ Format('%.2d',[i]) + ' = ');
code.Lines.Strings[code.Lines.Count-1]:=code.Lines.Strings[code.Lines.count-1]+Cmd[i,3];
end;

//Add ST (Befehls) Values
for i:=1 to 30 do
begin
code.Lines.Add('ST'+ Format('%.2d',[i]) + ' = ');
code.Lines.Strings[code.Lines.Count-1]:=code.Lines.Strings[code.Lines.count-1]+Cmd[i,0];
end;

//Add HEI Values
for i:=1 to 30 do
begin
code.Lines.Add('HEI'+ Format('%.2d',[i]) + ' = ');
code.Lines.Strings[code.Lines.Count-1]:=code.Lines.Strings[code.Lines.count-1]+Cmd[i,5];
end;

//Add IDX Values
for i:=1 to 30 do
begin
code.Lines.Add('IDX'+ Format('%.2d',[i]) + ' = ');
code.Lines.Strings[code.Lines.Count-1]:=code.Lines.Strings[code.Lines.count-1]+Cmd[i,8];
end;

template.Clear;
template.LoadFromFile('post.DAC');
code.Lines.AddStrings(template);

code.Lines.SaveToFile('code.DAC');
end;

end.
