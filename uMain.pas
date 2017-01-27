unit uMain;

{
  author: ZuBy

  https://github.com/rzaripov1990
  http://blog.rzaripov.kz

  2017
}

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Edit, FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TForm1 = class(TForm)
    lbName: TLabel;
    edName: TEdit;
    layName: TLayout;
    layEmail: TLayout;
    edEmail: TEdit;
    lbEmail: TLabel;
    layPass: TLayout;
    edPass: TEdit;
    lbPass: TLabel;
    Button1: TButton;
    Button2: TButton;
    ToolBar1: TToolBar;
    Label4: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edNameEnter(Sender: TObject);
    procedure edPassEnter(Sender: TObject);
    procedure edEmailEnter(Sender: TObject);
    procedure edNameExit(Sender: TObject);
    procedure edPassExit(Sender: TObject);
    procedure edEmailExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edNameChange(Sender: TObject);
    procedure edEmailChange(Sender: TObject);
    procedure edPassChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses FMX.MaterialEdit;

procedure TForm1.Button1Click(Sender: TObject);
begin
  edName.Text := 'Ravil Zaripov';
  edEmail.Text := 'rzaripov1990@gmail.com';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edName.Text := '';
  edEmail.Text := '';
  edPass.Text := '';
end;

procedure TForm1.edNameChange(Sender: TObject);
begin
  TMaterialEdit.OnChange(edName, lbName);
end;

procedure TForm1.edNameEnter(Sender: TObject);
begin
  TMaterialEdit.OnEnter(edName, lbName);
end;

procedure TForm1.edNameExit(Sender: TObject);
begin
  TMaterialEdit.OnExit(edName, lbName);
end;

procedure TForm1.edEmailChange(Sender: TObject);
begin
  TMaterialEdit.OnChange(edEmail, lbEmail);
end;

procedure TForm1.edEmailEnter(Sender: TObject);
begin
  TMaterialEdit.OnEnter(edEmail, lbEmail);
end;

procedure TForm1.edEmailExit(Sender: TObject);
begin
  TMaterialEdit.OnExit(edEmail, lbEmail);
end;

procedure TForm1.edPassChange(Sender: TObject);
begin
  TMaterialEdit.OnChange(edPass, lbPass);
end;

procedure TForm1.edPassEnter(Sender: TObject);
begin
  TMaterialEdit.OnEnter(edPass, lbPass);
end;

procedure TForm1.edPassExit(Sender: TObject);
begin
  TMaterialEdit.OnExit(edPass, lbPass);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // натсраиваем компоненты
  TMaterialEdit.Init(layName, edName, lbName);
  TMaterialEdit.Init(layEmail, edEmail, lbEmail);
  TMaterialEdit.Init(layPass, edPass, lbPass);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  // ресайзим Label относительно Edit'a, т.к он не привязан Align'ом
  TMaterialEdit.Resize(layName, edName, lbName);
  TMaterialEdit.Resize(layEmail, edEmail, lbEmail);
  TMaterialEdit.Resize(layPass, edPass, lbPass);
end;

initialization

end.
