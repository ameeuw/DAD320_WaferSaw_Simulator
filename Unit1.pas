unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    ed_elwidth: TLabeledEdit;
    ed_bowidth: TLabeledEdit;
    ed_c1width: TLabeledEdit;
    ed_cutdepth: TLabeledEdit;
    ed_c2width: TLabeledEdit;
    ed_blwidth: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  blade_width, border_width, cut1_width, cut2_width, cut_depth, electrode_width, a: real;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
blade_width:=strtofloat(ed_blwidth.Text);
border_width:=strtofloat(ed_bowidth.Text);
cut1_width:=strtofloat(ed_c1width.Text);
cut2_width:=strtofloat(ed_c2width.Text);
cut_depth:=strtofloat(ed_cutdepth.Text);
electrode_width:=strtofloat(ed_elwidth.Text);

form2.Visible:=true;
memo1.Lines.Clear;

a:=cut1_width*20;
memo1.Lines.Add('sh_Cut1.height = ' + floattostr(a));
form2.sh_cut1.Height:=round(a);
a:=border_width*20;
memo1.Lines.Add('sh_Cut1.top = ' + floattostr(a));
form2.sh_cut1.Top:=round(a);

a:=cut2_width*20;
memo1.Lines.Add('sh_Cut2.height = ' + floattostr(a));
form2.sh_cut2.Height:=round(a);
a:=20*(electrode_width+border_width+cut1_width);
memo1.Lines.Add('sh_Cut2.top = ' + floattostr(a));
form2.sh_cut2.Top:=round(a);

a:=cut2_width*20;
memo1.Lines.Add('sh_Cut3.height = ' + floattostr(a));
form2.sh_cut3.Height:=round(a);
a:=20*(electrode_width*2+border_width+cut1_width+cut2_width);
memo1.Lines.Add('sh_Cut4.top = ' + floattostr(a));
form2.sh_cut3.Top:=round(a);

a:=cut1_width*20;
memo1.Lines.Add('sh_Cut4.height = ' + floattostr(a));
form2.sh_cut4.Height:=round(a);
a:=20*(electrode_width*3+border_width+cut1_width+cut2_width*2);
memo1.Lines.Add('sh_Cut4.top = ' + floattostr(a));
form2.sh_cut4.Top:=round(a);

memo1.Lines.Add('Akkumulierte Breite = ' + floattostr(border_width*2+electrode_width*3+cut1_width*2+cut2_width*2))




end;

end.
