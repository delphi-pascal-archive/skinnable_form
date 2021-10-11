unit Unit1;

interface

uses
    Windows, SysUtils, Classes, Graphics, Controls, Forms, Buttons,
    StdCtrls, ShellAPI, ExtCtrls;

type
  TLicence = class(TForm)
  SpBFermer: TSpeedButton;
  Label1: TLabel;
  Image1: TImage;
  Label3: TLabel;
  procedure FormCreate(Sender: TObject);
  procedure FormPaint(Sender: TObject);
  procedure FormResize(Sender: TObject);
  procedure SpBFermerClick(Sender: TObject);

  private
  public
    ShowDesign,
    ShowBorder: Boolean;
  end;

var
  Licence: TLicence;

implementation

{$R *.DFM}

procedure TLicence.FormCreate(Sender: TObject);
begin
  DoubleBuffered  := True;
  Color  := $00DDDFE1;
  ShowDesign := True;
  ShowBorder := True;
end;

procedure TLicence.FormPaint(Sender: TObject);
var
 graphicBtm: array[1..8] of TBitmap;
 I: Cardinal;
 F: string;
begin
  if ShowDesign = True
  then
   begin
    for I := 1 to 8 do
     graphicBtm[I] := TBitmap.Create;
     try
      F := ExtractFilePath(Application.ExeName);
      graphicBtm[1] . LoadFromFile ( F + 'skin1\FORMFRAM_ABL.bmp' ) ;
      graphicBtm[2] . LoadFromFile ( F + 'skin1\FORMFRAM_ABR.bmp' ) ;
      graphicBtm[3] . LoadFromFile ( F + 'skin1\FORMFRAM_ATL.bmp' ) ;
      graphicBtm[4] . LoadFromFile ( F + 'skin1\FORMFRAM_ATR.bmp' ) ;
      graphicBtm[5] . LoadFromFile ( F + 'skin1\FORMFRAM_DgB.bmp' ) ;
      graphicBtm[6] . LoadFromFile ( F + 'skin1\FORMFRAM_DgL.bmp' ) ;
      graphicBtm[7] . LoadFromFile ( F + 'skin1\FORMFRAM_DgR.bmp' ) ;
      graphicBtm[8] . LoadFromFile ( F + 'skin1\FORMFRAM_DgT.bmp' ) ;
      with Canvas do
       begin
        Draw(0, (ClientHeight - (graphicBtm[1].Height)), graphicBtm[1]);
        Draw((ClientWidth - (graphicBtm[2].Width)), (ClientHeight - (graphicBtm[2].Height)), graphicBtm[2]);
        Draw(0, 0, graphicBtm[3]);
        Draw((ClientWidth - (graphicBtm[4].Width)), 0, graphicBtm[4]);

        StretchDraw(Rect(graphicBtm[1].Width, (ClientHeight - (graphicBtm[5].Height)), (ClientWidth - (graphicBtm[2].Width)), ClientHeight), graphicBtm[5]);
        StretchDraw(Rect(0, graphicBtm[3].Height, graphicBtm[1].Width, (ClientHeight - (graphicBtm[1].Height))), graphicBtm[6]);
        StretchDraw(Rect((ClientWidth - (graphicBtm[7].Width)), graphicBtm[4].Height, ClientWidth, (ClientHeight - (graphicBtm[2].Height))), graphicBtm[7]);
        StretchDraw(Rect(graphicBtm[3].Width, 0, (ClientWidth - (graphicBtm[4].Width)), graphicBtm[8].Height), graphicBtm[8])
       end
     finally
      for I := 1 to 8 do
       graphicBtm[I].Free
     end;
   { Dessine une bordure en 4 couleurs. }
    if ShowBorder = True
    then
     begin  // - Autoriser
      with Canvas.Pen, Canvas do
       begin
       Color := $007F7F7F; // - 1
       Polyline([Point(ClientWidth - (15{W/W}), 14), Point(14, 14), Point(14{L/H}, ClientHeight - (73{H/H}))]);
       Color := clBlack;   // - 2
       Polyline([Point(ClientWidth - (16), 15), Point(15, 15), Point(15, ClientHeight - (74))]);
       Color := $00DFDFDF; // - 3
       Polyline([Point(15{L/L}, ClientHeight - (74{L/H})), Point(ClientWidth - (15), ClientHeight - (74)), Point(ClientWidth - (15{T/W}), 14)]);
       Color := clWhite;   // - 4
       Polyline([Point(14, ClientHeight - (73)), Point(ClientWidth - (14), ClientHeight - (73)), Point(ClientWidth - (14), 13)]);
      end;
     end;
  end;
end;

procedure TLicence.FormResize(Sender: TObject);
begin
 Repaint;
end;

procedure TLicence.SpBFermerClick(Sender: TObject);
begin
 Close;
end;

end.

