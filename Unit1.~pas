unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ed_elwidth: TLabeledEdit;
    ed_bowidth: TLabeledEdit;
    ed_c1width: TLabeledEdit;
    ed_c2width: TLabeledEdit;
    ed_pztwidth: TLabeledEdit;
    ed_foilwidth: TLabeledEdit;
    ed_blwidth: TLabeledEdit;
    ed_cutdistance: TLabeledEdit;
    Bevel1: TBevel;
    sh_PZT20: TShape;
    Bevel2: TBevel;
    sh_PZT8: TShape;
    Label1: TLabel;
    Label2: TLabel;
    sh_cut1: TShape;
    sh_cut2: TShape;
    sh_cut3: TShape;
    sh_cut4: TShape;
    Shape1: TShape;
    ed_cutdepth: TLabeledEdit;
    Memo1: TMemo;
    Label3: TLabel;
    Button2: TButton;
    sh_c18: TShape;
    sh_c28: TShape;
    sh_c48: TShape;
    sh_c38: TShape;
    sh_c118: TShape;
    sh_c218: TShape;
    sh_c318: TShape;
    sh_c418: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Button3: TButton;
    code: TStringGrid;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a, blade_width, border_width, cut1_width, cut2_width, cut_depth, electrode_width, foil_strength, pzt_thickness: real;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
blade_width:=strtofloat(ed_blwidth.Text);
border_width:=strtofloat(ed_bowidth.Text);
cut1_width:=strtofloat(ed_c1width.Text);
cut2_width:=strtofloat(ed_c2width.Text);
cut_depth:=strtofloat(ed_cutdepth.Text);
electrode_width:=strtofloat(ed_elwidth.Text);

memo1.Lines.Clear;

a:=cut1_width*20;
memo1.Lines.Add('sh_Cut1.height = ' + floattostr(a));
sh_cut1.Height:=round(a);
a:=border_width*20;
memo1.Lines.Add('sh_Cut1.top = ' + floattostr(a));
sh_cut1.Top:=round(a)+sh_PZT20.Top;

a:=cut2_width*20;
memo1.Lines.Add('sh_Cut2.height = ' + floattostr(a));
sh_cut2.Height:=round(a);
a:=20*(electrode_width+border_width+cut1_width);
memo1.Lines.Add('sh_Cut2.top = ' + floattostr(a));
sh_cut2.Top:=round(a)+sh_PZT20.Top;

a:=cut2_width*20;
memo1.Lines.Add('sh_Cut3.height = ' + floattostr(a));
sh_cut3.Height:=round(a);
a:=20*(electrode_width*2+border_width+cut1_width+cut2_width);
memo1.Lines.Add('sh_Cut4.top = ' + floattostr(a));
sh_cut3.Top:=round(a)+sh_PZT20.Top;

a:=cut1_width*20;
memo1.Lines.Add('sh_Cut4.height = ' + floattostr(a));
sh_cut4.Height:=round(a);
a:=20*(electrode_width*3+border_width+cut1_width+cut2_width*2);
memo1.Lines.Add('sh_Cut4.top = ' + floattostr(a));
sh_cut4.Top:=round(a)+sh_PZT20.Top;

memo1.Lines.Add('Akkumulierte Breite = ' + floattostr(border_width*2+electrode_width*3+cut1_width*2+cut2_width*2))


end;

procedure TForm1.Button3Click(Sender: TObject);
begin
sh_c18.Height:=round(cut1_width*8);
sh_c118.Height:=sh_c18.Height;
sh_c18.Top:=round(border_width*8)+sh_PZT8.Top;
sh_c118.Top:=sh_c18.Top;
sh_c28.Height:=round(cut2_width*8);
sh_c218.Height:=sh_c28.Height;
sh_c28.Top:=round(border_width*8)+round(cut1_width*8)+round(electrode_width*8)+sh_PZT8.Top;
sh_c218.Top:=sh_c28.Top;
sh_c38.Height:=round(cut2_width*8);
sh_c318.Height:=sh_c38.Height;
sh_c38.Top:=round(border_width*8)+round(cut1_width*8)+round(cut2_width*8)+round(electrode_width*8*2)+sh_PZT8.Top;
sh_c318.Top:=sh_c38.Top;
sh_c48.Height:=round(cut1_width)*8;
sh_c418.Height:=sh_c48.Height;
sh_c48.Top:=round(border_width*8)+round(cut1_width*8)+round(cut2_width*8*2)+round(electrode_width*8*3)+sh_PZT8.Top;
sh_c418.Top:=sh_c48.Top;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i:integer;
begin
code.Rows[0].Text:='Step';
code.Cols[1].Text:='Command';
code.Cols[2].Text:='Parameter 1';
code.Cols[3].Text:='Parameter 2';
code.Cols[4].Text:='Parameter 3';
code.Cols[5].Text:='Height';
code.Cols[6].Text:='Mode';
code.Cols[7].Text:='Speed';
code.Cols[8].Text:='Index';
code.Cols[9].Text:='Mode';

for i:=1 to 30 do
code.Rows[i].Text:=inttostr(i);

code.Cols[1].Add('AliP ()');
code.Cols[2].Add('0');
code.Cols[3].Add('0');

code.Cols[1].Add('Idx Y()');
code.Cols[2].Add('0');
code.Cols[3].Add('0');
end;

end.
