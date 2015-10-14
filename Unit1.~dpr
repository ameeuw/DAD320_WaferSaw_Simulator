unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, XPMan;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    code2: TMemo;
    XPManifest1: TXPManifest;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  function CSVtoWS(filename: string): boolean;

var
  Form1: TForm1;
  Cmd, Cmd2:Array [1..30,0..8] of String;
  CSV,homedir: String;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
homedir:=GetCurrentDir;
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

function CSVtoWS(filename: string): boolean;
var
i,n: integer;
temp1,temp2: TStringlist;

begin
//Lade die .csv-Datei in die temp1-Stringlist;
temp1:=TStringList.Create;
temp2:=TStringList.Create;
temp1.LoadFromFile(filename);
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
Form1.StringGrid1.Cells[n,i]:=Cmd[i,n];
end;
temp2.Clear;
result:=true;
end;
end;

procedure BuildCode();
var
i: integer;
template, code: TStringList;
begin
template:=TStringlist.Create;
code:=TStringlist.create;
template.LoadFromFile(homedir+'\templates\pre.DAC');
code.AddStrings(template);

//Add DAC_HEI Values
code.Add('DAC_HEI = [32, 0, 0');
for i:=1 to 30 do
begin
code.Strings[code.Count-1]:=code.Strings[code.Count-1] + ', ' + floattostr(strtofloat(Cmd[i,4])*10000000);
end;
code.Strings[code.Count-1]:=code.Strings[code.Count-1]+']';

//Add DAC_SPD Values
code.Add('DAC_SPD = [32, 0, 0');
for i:=1 to 30 do
begin
code.Strings[code.Count-1]:=code.Strings[code.Count-1] + ', ' + floattostr(strtofloat(Cmd[i,6])*10000000);
end;
code.Strings[code.Count-1]:=code.Strings[code.Count-1]+']';

//Add DAC_IDX Values
code.Add('DAC_IDX = [32, 0, 0');
for i:=1 to 30 do
begin
code.Strings[code.Count-1]:=code.Strings[code.Count-1] + ', ' + floattostr(strtofloat(Cmd[i,7])*10000000);
end;
code.Strings[code.Count-1]:=code.Strings[code.Count-1]+']';

//Add PARAM_1 Values
for i:=1 to 30 do
begin
code.Add('PA'+ Format('%.2d',[i]) + ' = ');
code.Strings[code.Count-1]:=code.Strings[code.count-1]+Cmd[i,1];
end;

//Add PARAM_2 Values
for i:=1 to 30 do
begin
code.Add('PB'+ Format('%.2d',[i]) + ' = ');
code.Strings[code.Count-1]:=code.Strings[code.count-1]+Cmd[i,2];
end;

//Add PARAM_3 Values
for i:=1 to 30 do
begin
code.Add('PC'+ Format('%.2d',[i]) + ' = ');
code.Strings[code.Count-1]:=code.Strings[code.count-1]+Cmd[i,3];
end;

//Add ST (Befehls) Values
for i:=1 to 30 do
begin
code.Add('ST'+ Format('%.2d',[i]) + ' = ');
code.Strings[code.Count-1]:=code.Strings[code.count-1]+Cmd[i,0];
end;

//Add HEI Values
for i:=1 to 30 do
begin
code.Add('HEI'+ Format('%.2d',[i]) + ' = ');
code.Strings[code.Count-1]:=code.Strings[code.count-1]+Cmd[i,5];
end;

//Add IDX Values
for i:=1 to 30 do
begin
code.Add('IDX'+ Format('%.2d',[i]) + ' = ');
code.Strings[code.Count-1]:=code.Strings[code.count-1]+Cmd[i,8];
end;

template.Clear;
template.LoadFromFile(homedir+'\templates\post.DAC');
code.AddStrings(template);
Form1.code2.Lines.AddStrings(code);

code.SaveToFile(homedir+'\code.DAC');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
opendialog:topendialog;
begin
opendialog:=topendialog.Create(self);
opendialog.InitialDir:=homedir;
opendialog.Options:=[ofFileMustExist];
opendialog.Filter:='Excel CSV-Datei (".csv")|*.csv';
if openDialog.Execute
then CSVtoWS(openDialog.FileName);

opendialog.Free;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
BuildCode;
end;

end.
