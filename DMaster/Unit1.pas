unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls, IdAntiFreezeBase,
  Vcl.IdAntiFreeze, Vcl.ComCtrls, IdExplicitTLSClientServerBase, IdFTP,
  sSkinProvider, sSkinManager, Vcl.ExtCtrls, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.Imaging.pngimage, shellapi,
  Vcl.Buttons, inifiles;

type
  TForm1 = class(TForm)
    Button1: TButton;
    IdHTTP1: TIdHTTP;
    IdAntiFreeze1: TIdAntiFreeze;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Button17: TButton;
    Button18: TButton;
    SaveDialog1: TSaveDialog;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Button20: TButton;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    Label3: TLabel;
    Timer2: TTimer;
    Label4: TLabel;
    Image17: TImage;
    Edit1: TEdit;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    ComboBox2: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Image17MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure searchinweb;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
    Procedure WmDropFiles(var msg: TWMDropFiles); message WM_DropFiles;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  b : boolean;
  CFileName:array[0..MAX_PATH] of char;
  url, s:string;



implementation

{$R *.dfm}

procedure TForm1.Button10Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('http://ftp22.nero.com/Nero2016/Nero2016-03.03.2016_stub_trial.exe',stream);
Stream.SaveToFile(SaveDialog1.FileName +'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('https://fpdownload.macromedia.com/pub/flashplayer/latest/help/install_flash_player.exe',stream);
Stream.SaveToFile(SaveDialog1.FileName+'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;

procedure TForm1.Button12Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('http://dl.4players.de/ts/releases/3.0.19.1/TeamSpeak3-Client-win64-3.0.19.1.exe',stream);
Stream.SaveToFile(SaveDialog1.FileName+'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;

procedure TForm1.Button13Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('http://bezprogramm.net/engine/download.php?id=659',stream);
Stream.SaveToFile(SaveDialog1.FileName +'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;

procedure TForm1.Button14Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('http://download.nullsoft.com/winamp/client/winamp5666_full_all.exe',stream);
Stream.SaveToFile(SaveDialog1.FileName +'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;

procedure TForm1.Button15Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('http://download.qip.ru/2012/qip2012.exe',stream);
Stream.SaveToFile(SaveDialog1.FileName +'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;

procedure TForm1.Button16Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('https://besplatnyeprogrammy.net/ofis/redaktory-teksta/openoffice/download',stream);
Stream.SaveToFile(SaveDialog1.FileName +'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
        ShowMessage('Спасибо за использование программы! Следите за обновлениями!');
        Close;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
ShowMessage('Добро пожаловать в программу Download Master! Программа находится в стадии Alpha-тестирования. В дальнейшем планируется разработка сервера авторизации для доступа на специализированный ftp-сервер для загрузки обновлений.');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('http://www.win-rar.com/fileadmin/winrar-versions/winrar-x64-520.exe',stream);
Stream.SaveToFile(SaveDialog1.FileName + '.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
if combobox1.text='Afterburner' then
 Begin
 sSkinManager1.SkinName:='Afterburner (internal)';
 End;
 if combobox1.text='Aluminium' then
 Begin
 sSkinManager1.SkinName:='Aluminium (internal)';
 End;
     if combobox1.text='Android OS' then
 Begin
 sSkinManager1.SkinName:='Android OS (internal)';
 End;

     if combobox1.text='Beijing' then
 Begin
 sSkinManager1.SkinName:='Beijing (internal)';
 End;

    if combobox1.text='Cappuccino' then
 Begin
 sSkinManager1.SkinName:='Cappuccino (internal)';
 End;
    if combobox1.text='Deep' then
 Begin
 sSkinManager1.SkinName:='Deep (internal)';
 End;
   if combobox1.text='KaraKum' then
 Begin
 sSkinManager1.SkinName:='KaraKum (internal)';
 End;
   if combobox1.text='Matrix' then
 Begin
 sSkinManager1.SkinName:='Matrix (internal)';
 End;
 if combobox1.text='Shine' then
 Begin
 sSkinManager1.SkinName:='Shine (internal)';
 End;
 if combobox1.text='UnderWater' then
 Begin
 sSkinManager1.SkinName:='UnderWater (internal)';
 End;
 if combobox1.text='Elegant' then
 Begin
 sSkinManager1.SkinName:='Elegant (internal)';
 End;
 if combobox1.text='Flatline' then
 Begin
 sSkinManager1.SkinName:='Flatline (internal)';
 End;
 if combobox1.text='Golden' then
 Begin
 sSkinManager1.SkinName:='Golden (internal)';
 End;
  if combobox1.text='GPlus' then
 Begin
 sSkinManager1.SkinName:='GPlus (internal)';
 End;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('http://ftp.mozilla.org/pub/thunderbird/releases/45.0/win32/ru/Thunderbird%20Setup%2045.0.exe',stream);
Stream.SaveToFile(SaveDialog1.FileName +'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;



procedure TForm1.Button3Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('http://wincmd.ru/en/releases/tcmd852ax64.exe',stream);
Stream.SaveToFile(SaveDialog1.FileName +'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;


procedure TForm1.Button4Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('http://download.geo.drweb.com/pub/drweb/cureit/cureit.exe',stream);
Stream.SaveToFile(SaveDialog1.FileName +'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('https://dl.google.com/edgedl/chrome/install/GoogleChromeStandaloneEnterprise64.msi',stream);
Stream.SaveToFile(SaveDialog1.FileName +'.msi');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('http://download.piriform.com/ccsetup522.exe',stream);
Stream.SaveToFile(SaveDialog1.FileName +'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;


procedure TForm1.Button7Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('http://download.drp.su/0/17-online/DriverPack-17-Online_2055954555.1461763944.exe',stream);
Stream.SaveToFile(SaveDialog1.FileName +'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('http://download.ap.bittorrent.com/track/stable/endpoint/utorrent/os/windows',stream);
Stream.SaveToFile(SaveDialog1.FileName +'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
stream:TMemoryStream;
begin
Stream:=TMemoryStream.Create;
try
SaveDialog1.Execute;
IdHTTP1.Get('http://klitecodec.ru/download/K-Lite_Codec_Pack_Standard.exe',stream);
Stream.SaveToFile(SaveDialog1.FileName +'.exe');
ShowMessage('Загрузка завершена!');
Except
ShowMessage('OMG! Error!! 0__o');
Stream.Free;
end;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
case Combobox2.ItemIndex of
    0: url:='https://yandex.ru/search/?lr=193&msid=1479405605.13141.22877.8288&text=';
    1: url:='https://www.google.ru/?gws_rd=ssl#newwindow=1&q=';
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
DragAcceptFiles(handle, true);
Showmessage('Добро пожаловать в Download Master!');
b:=false;
end;

procedure TForm1.Image10Click(Sender: TObject);
begin
ShowMessage('Total Commander — файловый менеджер с закрытым исходным кодом, работающий на платформе Microsoft Windows');
end;

procedure TForm1.Image11Click(Sender: TObject);
begin
ShowMessage('μTorrent -  BitTorrent-клиент для Windows, Mac OS X, Linux (веб-интерфейс) и Android, написанный на C++ и отличающийся небольшим размером и высокой скоростью работы при достаточно большой функциональности.')
end;

procedure TForm1.Image12Click(Sender: TObject);
begin
ShowMessage('DriverPack Solution - менеджер установки драйверов, предназначенный для автоматизации работы с драйверами на платформе Windows ОС. Распространяется бесплатно, по свободной лицензии GNU GPL, с открытым исходным кодом.');
end;

procedure TForm1.Image13Click(Sender: TObject);
begin
ShowMessage('QIP IM - бесплатная программа мгновенного обмена сообщениями по протоколу OSCAR, во многом аналогичная программе ICQ. QIP имеет закрытый исходный код, и предназначен для работы под операционными системами семейства Microsoft Windows.');
end;

procedure TForm1.Image14Click(Sender: TObject);
begin
ShowMessage('Adobe Flash - мультимедийная платформа компании Adobe Systems для создания веб-приложений или мультимедийных презентаций. Широко используется для создания рекламных баннеров, анимации, игр, а также воспроизведения на веб-страницах видео - и аудиозаписей.');
end;

procedure TForm1.Image15Click(Sender: TObject);
begin
ShowMessage('TeamSpeak — компьютерная программа, предназначенная для голосового общения в сети Интернет посредством технологии VoIP. От классического телефона отличается практически неограниченным количеством абонентов, разговаривающих одновременно.')
end;

procedure TForm1.Image16Click(Sender: TObject);
begin
ShowMessage('Apache OpenOffice -  свободный пакет офисных приложений. Конкурирует с коммерческими офисными пакетами (в том числе Microsoft Office) как на уровне форматов, так и на уровне интерфейса пользователя');
end;

procedure TForm1.Image17MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if button=mbleft then
ShellExecute(Form1.handle, nil, Pchar(s), nil, nil, SW_RESTORE);
if button=mbright then
begin
  s:='';
  Label4.Caption:='';
end;

end;

procedure TForm1.Image1Click(Sender: TObject);
begin
ShowMessage('WinRAR — архиватор файлов в форматы RAR и ZIP для 32- и 64-разрядных операционных систем Windows  ');
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
ShowMessage('Google Chrome -  браузер, разрабатываемый компанией Google на основе свободного браузера Chromium и движка Blink');
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
ShowMessage('Dr.Web — общее название семейства программного антивирусного ПО для различных платформ');
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
ShowMessage('Nero MediaHome - центр управления для упорядочивания, создания, передачи и воспроизведения всех ваших файлов практически любого формата, идет ли речь о видео, музыке, фильмах или изображениях.');
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
ShowMessage('Winamp — универсальный медиапроигрыватель компании Nullsoft для воспроизведения файлов мультимедиа и потоковых передач в среде Microsoft Windows.');
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
ShowMessage('CCleaner — бесплатная утилита с закрытым исходным кодом, которая предоставляет пользователям мощный и простой в использовании инструмент для очистки и оптимизации 32-битных и 64-разрядных операционных систем Microsoft Windows.')
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
ShowMessage('Adobe Acrobat — пакет программ, выпускаемый с 1993 года компанией Adobe Systems и предназначенный для создания и просмотра электронных публикаций в формате PDF.');
end;

procedure TForm1.Image8Click(Sender: TObject);
begin
ShowMessage('K-Lite Codec Pack — универсальный набор кодеков (декомпрессоров/компрессоров) и утилит для просмотра и обработки аудио- и видеофайлов. В пакет входит большое число свободных (open-source), либо бесплатных (freeware) кодеков и утилит.');
end;

procedure TForm1.Image9Click(Sender: TObject);
begin
ShowMessage('Mozilla Thunderbird — бесплатная кроссплатформенная свободно распространяемая программа для работы с электронной почтой и группами новостей, а при установке расширения Lightning, и с календарем.');
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
b:= not(b);
if b then label3.Caption:='<'
  else label3.Caption:='>';
end;

procedure TForm1.searchinweb;
begin
if edit1.Text<>'' then
ShellExecute(0,'', Pchar(url+edit1.text), nil, nil, SW_SHOWNORMAL) else
showmessage('Вы ввели пустой поисковой запрос!');

end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
searchinweb;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
label1.Caption:=timetostr(time);
end;


procedure TForm1.Timer2Timer(Sender: TObject);
begin
if (b)and(Panel1.Left<0) then
Panel1.Left:= Panel1.Left + 5;
if (not b) and (Panel1.left>-330) then
Panel1.Left:=Panel1.Left - 5;


end;

procedure TForm1.WmDropFiles(var msg: TWMDropFiles);
var
icon: hicon;
iconindex:word;
begin
 try
  If DragQueryFile(msg.Drop,0,CFileName,MAX_PATH) > 0 then
  begin
  S:=CFileName;
  Label4.Caption:=extractfilename(s);
  msg.Result:=0;
  end;
 finally
  DragFinish(Msg.Drop);
  end;
  iconindex:=1;
  Image17.Picture.Icon.Handle:= ExtractAssociatedIcon(HInstance, Pchar(s), IconIndex);
  DrawIcon(Canvas.Handle,10,10,icon);
end;
end.

