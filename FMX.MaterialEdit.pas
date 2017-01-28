unit FMX.MaterialEdit;

{
  author: ZuBy

  https://github.com/rzaripov1990
  http://blog.rzaripov.kz

  2017
}

interface

uses
  System.SysUtils, FMX.StdCtrls, FMX.Layouts, FMX.Edit, FMX.Types,
  FMX.Ani, FMX.Platform, System.Math;

type
  TMaterialEdit = record
  public
    class var FLabelPosXmargin: Single;
    class var FLabelPosYmargin: Single;

    class procedure Init(var aLayout: TLayout; var aEdit: TEdit; var aLabel: TLabel); static;
    class procedure Resize(var aLayout: TLayout; var aEdit: TEdit; var aLabel: TLabel); static;

    class procedure OnEnter(var aEdit: TEdit; var aLabel: TLabel); static;
    class procedure OnExit(var aEdit: TEdit; var aLabel: TLabel); static;
    class procedure OnChange(var aEdit: TEdit; var aLabel: TLabel); static;
  end;

implementation

{ TMaterialEdit }

class procedure TMaterialEdit.Init(var aLayout: TLayout; var aEdit: TEdit; var aLabel: TLabel);
begin
  aEdit.Align := TAlignLayout.Bottom;
  aEdit.Size.PlatformDefault := true;

  aLabel.Align := TAlignLayout.None;
  aLabel.AutoSize := true;
  aLabel.HitTest := false;
  aLabel.BringToFront;

  aLayout.HitTest := false;

  TMaterialEdit.Resize(aLayout, aEdit, aLabel);
end;

class procedure TMaterialEdit.OnChange(var aEdit: TEdit; var aLabel: TLabel);
begin
  if (aEdit.Text.Trim.IsEmpty) and (not aEdit.IsFocused) then
    TMaterialEdit.OnExit(aEdit, aLabel)
  else
    TMaterialEdit.OnEnter(aEdit, aLabel);
end;

class procedure TMaterialEdit.OnEnter(var aEdit: TEdit; var aLabel: TLabel);
begin
  TAnimator.AnimateFloatWait(aLabel, 'Position.Y', aEdit.Position.Y - aLabel.Height, 0.08);
end;

class procedure TMaterialEdit.OnExit(var aEdit: TEdit; var aLabel: TLabel);
var
  aAnimate: Boolean;
begin
  aLabel.BringToFront;
  aAnimate := (aEdit.Text.Trim.IsEmpty) and
    (not SameValue(aLabel.Position.Y, aEdit.Position.Y + TMaterialEdit.FLabelPosYmargin, 0.1));
  if aAnimate then
    TAnimator.AnimateFloatWait(aLabel, 'Position.Y', aEdit.Position.Y + TMaterialEdit.FLabelPosYmargin, 0.08);
end;

class procedure TMaterialEdit.Resize(var aLayout: TLayout; var aEdit: TEdit; var aLabel: TLabel);
begin
  TMaterialEdit.FLabelPosYmargin := (aEdit.Height / 2) - (aLabel.Height / 2);
  aLayout.Height := aEdit.Height + aLabel.Height;
  aLabel.Width := aEdit.Width;

  aLabel.Position.X := TMaterialEdit.FLabelPosXmargin + aEdit.Position.X;
  if not aEdit.Text.IsEmpty then
    aLabel.Position.Y := aEdit.Position.Y - aLabel.Height
  else
  begin
    aLabel.Position.X := TMaterialEdit.FLabelPosXmargin + aEdit.Position.X;
    aLabel.Position.Y := aEdit.Position.Y + TMaterialEdit.FLabelPosYmargin;
  end;
end;

initialization

TMaterialEdit.FLabelPosXmargin := 2;
TMaterialEdit.FLabelPosYmargin := 1;

end.
