unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions, Vcl.ActnList;

type
  TfPrincipal = class(TForm)
    edtDisplay: TEdit;
    btnMinus: TButton;
    btnMultiply: TButton;
    btnDivision: TButton;
    btnCE: TButton;
    btn7: TButton;
    btn8: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn9: TButton;
    btnPlus: TButton;
    btn0: TButton;
    btnDot: TButton;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btnEnter: TButton;
    btnBackSpace: TButton;
    procedure ControlAction1Excute(Sender: TObject);
    procedure btnBackSpaceClick(Sender: TObject);
  private
    { Private declarations }
    operador_1, operadorr_2, operacion : String;
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;
//variables globales que se exportan a todo el proyecto

implementation

{$R *.dfm}


procedure TfPrincipal.btnBackSpaceClick(Sender: TObject);
begin
   edtDisplay.Text := copy(edtDisplay.Text, 1, length(edtDisplay.Text)-1);
   if edtDisplay.Text = '' then
   edtDisplay.Text := '0';
end;

procedure TfPrincipal.ControlAction1Excute(Sender: TObject);
var
  tag : integer;
  captionText : string;
begin
  tag := TButton(Sender).tag;
  captionText := TButton(Sender).Caption;


  if (tag > -1) then /// es un boton numerico
  begin
    if edtDisplay.Text = '0' then
      edtDisplay.Text := IntToStr(tag)
    else
      edtDisplay.Text :=  edtDisplay.Text + IntToStr(tag);
  end
  else
  begin
    if captionText = '.' then
    begin
      if (pos('.', edtDisplay.Text) > 0) then
      exit
      else
      begin
        edtDisplay.Text :=  edtDisplay.Text + '.';
        exit;
      end;

    end;

    operador_1 := edtDisplay.Text;
    operacion := captionText;
    edtDisplay.Text := '';
  end;
end;
end.
