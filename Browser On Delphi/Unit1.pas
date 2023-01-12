unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.OleCtrls, SHDocVw;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    Edit1: TEdit;
    Image3: TImage;
    Image1: TImage;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure Image3Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure WebBrowser1NavigateComplete2(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
    procedure WebBrowser1NewWindow2(ASender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
    procedure WebBrowser1ProgressChange(ASender: TObject; Progress,
      ProgressMax: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Image1Click(Sender: TObject);
begin
WebBrowser1.Refresh;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
WebBrowser1.GoForward;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
WebBrowser1.GoBack;

end;

procedure TForm1.Image4Click(Sender: TObject);
begin
WebBrowser1.Navigate(Edit1.Text);
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
WebBrowser1.GoHome;
end;

procedure TForm1.WebBrowser1NavigateComplete2(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
Edit1.Text:=URL;
end;

procedure TForm1.WebBrowser1NewWindow2(ASender: TObject; var ppDisp: IDispatch;
  var Cancel: WordBool);
  var newform:Tform1;
begin
ppdisp:=WebBrowser1.DefaultDispatch;
newform:=Tform1.Create(self);
newform.Show;
ppdisp:=newform.WebBrowser1.DefaultDispatch;

end;

procedure TForm1.WebBrowser1ProgressChange(ASender: TObject; Progress,
  ProgressMax: Integer);
begin
progressbar1.Max:=progressMax;
progressbar1.Position:=progress;
end;

end.
