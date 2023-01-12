unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdAntiFreezeBase, IdAntiFreeze, sSkinProvider, sSkinManager, acPNG,
  Vcl.ExtCtrls, Vcl.Imaging.GIFImg, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdComponent, IdTCPConnection, shellapi, IdExplicitTLSClientServerBase, IdFTP,
  IdTCPClient, IdHTTP, Vcl.Buttons;

type
  TForm1 = class(TForm)
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    IdAntiFreeze1: TIdAntiFreeze;
    ComboBox2: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    Timer1: TTimer;
    Image2: TImage;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Edit4: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure searchinweb;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  OrigAddr: Pointer = nil;
  url : string;

implementation

{$R *.dfm}

 function InterceptedMessageBoxA(Wnd: HWND; lpText, lpCaption: PAnsiChar; uType: UINT): Integer; stdcall;
type
  TOrigMessageBoxA = function(Wnd: HWND; lpText, lpCaption: PAnsiChar; uType: UINT): Integer; stdcall;
begin
  if lpCaption <> 'Unregistered skin' then
    Result := TOrigMessageBoxA(OrigAddr)(Wnd, lpText, lpCaption, uType);
end;


function Intercept(const OldProc, NewProc: FARPROC): Boolean;
var
  ImportEntry: PImageImportDescriptor;
  Thunk: PImageThunkData;
  Protect: DWORD;
  ImageBase: Cardinal;
  DOSHeader: PImageDosHeader;
  NTHeader: PImageNtHeaders;
begin

  OrigAddr:=GetProcAddress(GetModuleHandle(user32), 'MessageBoxA');
  Intercept(OrigAddr, @InterceptedMessageBoxA);

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

  Result := False;
  if OldProc = nil then Exit;
  if NewProc = nil then Exit;
  ImageBase := GetModuleHandle(nil);
  DOSHeader := PImageDosHeader(ImageBase);
  NTHeader := PImageNtHeaders(DWORD(DOSHeader) + DWORD(DOSHeader^._lfanew));
  ImportEntry := PImageImportDescriptor(
    DWORD(ImageBase)+
    DWORD(NTHeader^.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress)
  );
  while ImportEntry^.Name <> 0 do begin
    Thunk := PImageThunkData(DWORD(ImageBase) + DWORD(ImportEntry^.FirstThunk));
    while Pointer(Thunk^._function) <> nil do begin
      if Pointer(Thunk^._function) = OldProc then begin
        if VirtualProtect(@Thunk^._function, SizeOf(DWORD), PAGE_EXECUTE_READWRITE, Protect) then
        try
          InterlockedExchange(Integer(Thunk^._function), Integer(NewProc));
          Result := True;
        finally
          VirtualProtect(@Thunk^._function, SizeOf(DWORD), Protect, Protect);
          FlushInstructionCache(GetCurrentProcess, @Thunk^._function, SizeOf(DWORD));
        end;
      end else Inc(PAnsiChar(Thunk), SizeOf(TImageThunkData32));
    end;
    ImportEntry := Pointer(Integer(ImportEntry) + SizeOf(TImageImportDescriptor));
  end;
end;



procedure TForm1.Button1Click(Sender: TObject);
begin
ShowMessage('Выбери понравившийся стиль и наслаждайся красивым оформлением!');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
ShowMessage('Thanks for using this program!');
Close;
end;



procedure TForm1.searchinweb;
begin
   if edit4.Text<>'' then
   shellExecute(0,'',PChar(url+Edit4.Text), nil,nil,SW_SHOWNORMAL) else
   showmessage('Вы ввели пустой поисковый запрос!');


end;


procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
searchinweb;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if combobox2.text='Acryl' then
 Begin
 sSkinManager1.SkinName:='Acryl (internal)';
 End;

 if combobox2.text='AlterMetro' then
 Begin
 sSkinManager1.SkinName:='AlterMetro (internal)';
 End;

 if combobox2.text='Aluminium' then
 Begin
 sSkinManager1.SkinName:='Aluminium (internal)';
 End;

 if combobox2.text='Anime Pink' then
 Begin
 sSkinManager1.SkinName:='Anime Pink (internal)';
 End;

 if combobox2.text='AutumnSky' then
 Begin
 sSkinManager1.SkinName:='AutumnSky (internal)';
 End;

 if combobox2.text='Beijing Ext' then
 Begin
 sSkinManager1.SkinName:='Beijing Ext (internal)';
 End;


 if combobox2.text='Blue waves (CS)' then
 Begin
 sSkinManager1.SkinName:='Blue waves (CS) (internal)';
 End;

  if combobox2.text='Blue waves (CS)' then
 Begin
 sSkinManager1.SkinName:='Blue waves (CS) (internal)';
 End;

  if combobox2.text='Canvas dark (CS)' then
 Begin
 sSkinManager1.SkinName:='Canvas dark (CS) (internal)';
 End;

  if combobox2.text='Clear Sky (CS)' then
 Begin
 sSkinManager1.SkinName:='Clear Sky (CS) (internal)';
 End;

  if combobox2.text='Custom BG 1 (CS)' then
 Begin
 sSkinManager1.SkinName:='Custom BG 1 (CS) (internal)';
 End;

  if combobox2.text='Custom BG 2 (CS)' then
 Begin
 sSkinManager1.SkinName:='Custom BG 2 (CS) (internal)';
 End;

  if combobox2.text='Custom BG 3 (CS)' then
 Begin
 sSkinManager1.SkinName:='Custom BG 3 (CS) (internal)';
 End;

  if combobox2.text='Deep' then
 Begin
 sSkinManager1.SkinName:='Deep (internal)';
 End;

  if combobox2.text='Fluent Night' then
 Begin
 sSkinManager1.SkinName:='Fluent Night (internal)';
 End;

  if combobox2.text='Garnet II' then
 Begin
 sSkinManager1.SkinName:='Garnet II (internal)';
 End;

  if combobox2.text='Graphite' then
 Begin
 sSkinManager1.SkinName:='Graphite (internal)';
 End;

  if combobox2.text='Jeans' then
 Begin
 sSkinManager1.SkinName:='Jeans (internal)';
 End;

  if combobox2.text='Light Board' then
 Begin
 sSkinManager1.SkinName:='Light Board (internal)';
 End;

  if combobox2.text='Mint' then
 Begin
 sSkinManager1.SkinName:='Mint (internal)';
 End;

  if combobox2.text='Moonlight' then
 Begin
 sSkinManager1.SkinName:='Moonlight (internal)';
 End;

  if combobox2.text='Notes Leather' then
 Begin
 sSkinManager1.SkinName:='Notes Leather (internal)';
 End;

  if combobox2.text='Sapphire' then
 Begin
 sSkinManager1.SkinName:='Sapphire (internal)';
 End;

  if combobox2.text='Winter2011' then
 Begin
 sSkinManager1.SkinName:='Winter2011 (internal)';
 End;

  if combobox2.text='WMP 2008' then
 Begin
 sSkinManager1.SkinName:='WMP 2008 (internal)';
 End;

end;


procedure TForm1.Button4Click(Sender: TObject);
const mash = 100;
var
x0, y0:Integer;
a, b : Integer;
x,y : Real;
begin
a:=StrToInt(Edit1.Text);
b:=StrToInt(Edit2.Text);
image2.Canvas.Pen.Color:=clGreen;
image2.Canvas.Pen.Width:=2;
x0:=image2.Width div 2;
y0:=image2.Height div 2;

with image2.Canvas do
begin
Pen.Width:=2;
Pen.Color:=clGreen;
MoveTo(x0,0);
LineTo(x0, ClientHeight);
MoveTo(0, y0);
LineTo(ClientWidth, y0);
end;


image2.Canvas.Pen.Color:=clBlack;
image2.Canvas.Pen.Width:=2;
x:=-6;
y:=-1/(a+b*sqr(x));
image2.Canvas.MoveTo(Trunc(x), Trunc(y));
repeat
  x:=x+0.0001;
  y:=-1/(a+b*sqr(x));
  image2.Canvas.LineTo(Trunc(x*mash)+x0,Trunc(y*mash)+y0);
until x>=6;


end;

procedure TForm1.Button5Click(Sender: TObject);
begin
image2.Canvas.Rectangle(0,0,ClientWidth, ClientHeight);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
case combobox1.ItemIndex of
0:url:='https://yandex.ru/search/?lr=193&oprnd=9921583692&text='  ;
1:url:='https://www.google.ru/search?newwindow=1&ei=lfbkXaG0K8yJwPAPsZyLmA4&q=';

end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
sSkinManager1.SkinDirectory:=ExtractFilePath(Application.ExeName)+'\';
sSkinManager1.Active:=true;
ShowMessage('Добро пожаловать в Graph Builder!');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
label2.Caption:=TimeToStr(Time);
end;

end.

