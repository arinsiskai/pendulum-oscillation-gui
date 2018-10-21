unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeeProcs, TeEngine, Chart, ComCtrls, Series, Math;

const
  Ball_const = 15;
  LENGTH     = 1;
  PERIOD     = 50;
  DT         = 0.05;
  g          = 9.8;
  n          = 2000;

type

  myArray = array [0..n]of double;

  TBall = record
      Length : Single;
      Angle  : Single;
      Velocity : Single;
  end;


  TForm1 = class(TForm)
    Label1: TLabel;
    OscPlot: TChart;
    TrackBarDamping: TTrackBar;
    TrackBarInitialAngle: TTrackBar;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TrackBarForce: TTrackBar;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Series1: TLineSeries;
    Timer1: TTimer;
    imagePendulum: TImage;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TrackBarDampingChange(Sender: TObject);
    procedure TrackBarInitialAngleChange(Sender: TObject);
    procedure TrackBarForceChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure GambarPendulum(teta: Double);
    procedure GambarGrafik();
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    time : Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  x0, y0 : integer;
  x1, y1 : integer;
  teta0, teta1: real;
begin
    time := 0;
    x0 := 100;
    y0 := 60;
    teta0 := degtorad (StrToFloat(Edit2.Text));

    x1 :=  Round (x0 + 400*sin(teta0));
    y1 :=  Round (y0 + 200*cos(teta0));


    Canvas.MoveTo(x0,y0);
    Canvas.LineTo(x1,y1);
    Canvas.Ellipse(x1-15, y1-15, x1+15, y1+15);

end;

procedure TForm1.GambarPendulum(teta: Double);
var
  x0, y0 : integer;
  x1, y1 : integer;
  teta0, teta1: real;
begin

  x0 := 100;
  y0 := 50;
  teta0 := degtorad(teta);

  x1 :=  Round (x0 + 400 * sin(teta0));
  y1 :=  Round (y0 + 200 * cos(teta0));

  //with imagePendulum.Canvas do
  //begin
    //Canvas.Brush.Color := clWhite;
    Canvas.Rectangle(imagePendulum.Left, imagePendulum.Top, imagePendulum.Left + imagePendulum.Width, imagePendulum.Top + imagePendulum.Height);
    Canvas.MoveTo(x0,y0);
    Canvas.LineTo(x1,y1);
    Canvas.Ellipse(x1-15, y1-15, x1+15, y1+15);
  //end;}
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    time := 0;
    Timer1.Enabled := true;

    TrackBarDamping.Enabled := false;
    TrackBarInitialAngle.Enabled := false;
    TrackBarForce.Enabled := false;
end;

procedure TForm1.GambarGrafik;
var
  teta1, D, angle : real;
  omega, teta, t : myArray;
  i : integer;
  F, teta0, q : double;
begin
    F := StrToFloat(Edit3.Text);
    teta0 := StrToFloat(Edit2.Text);
    q := StrToFloat(Edit1.Text);

    D := 0.2;
    t[0] := 0;
    omega[0] := 1;
    teta[0] := degtorad (teta0);

    OscPlot.Series[0].Clear;

    for i := 1 to time do
        begin
           omega[i+1] := omega[i] - ((g/LENGTH) * sin (degtorad(teta[i]))+ q * omega[i] + F * sin (degtorad(D * t[i]))) * dt;
           teta[i+1]  := teta[i] + omega[i+1]*dt;
           t[i+1]     := t[i] + dt;

           OscPlot.Series[0].AddXY(t[i],teta[i]);
           
        end;
        GambarPendulum(teta[time]);
end;

procedure TForm1.TrackBarDampingChange(Sender: TObject);
var
  q: double;
begin
    q := TrackBarDamping.Position;
    Edit1.Text := FLoatToStr(q/10);
end;

procedure TForm1.TrackBarInitialAngleChange(Sender: TObject);
var
    teta0 : double;
begin
    teta0 := TrackBarInitialAngle.Position;
    Edit2.Text := FLoatToStr(teta0);
    GambarPendulum(teta0);
end;

procedure TForm1.TrackBarForceChange(Sender: TObject);
var
    F : double;
begin
    F := TrackBarForce.Position;
    Edit3.Text := FLoatToStr(F/10);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  time := time + 1;
  if (time = n) then
    time := 0;

  GambarGrafik;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer1.Enabled := false;

  TrackBarDamping.Enabled := True;
  TrackBarInitialAngle.Enabled := True;
  TrackBarForce.Enabled := True;
end;

end.
