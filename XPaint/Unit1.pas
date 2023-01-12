unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtDlgs, Vcl.Menus, JPEG;

type
  TToolType = (ttLine, ttRect, ttEllipse, ttRoundRect, ttPen, ttBrush, ttFill, ttSpray, ttErase);
  TBrushShape = (bshRect, bshEllipse, bshRoundRect);
  // То, что выше, это пользовательские перечислимые типы для инструментов и формы кисти;
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    SavePictureDialog1: TSavePictureDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    StatusBar1: TStatusBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Edit1: TEdit;
    ColorBox1: TColorBox;
    Label1: TLabel;
    N1: TMenuItem;
    Load1: TMenuItem;
    Save1: TMenuItem;
    Exit1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    Panel1: TPanel;
    procedure Exit1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    //Опишем пользовательские процедуры;
    Procedure DrawFigure(a, b: TPoint; PM: TPenMode); // Рисует фигуры (Ellipse, Rect, RoundRect);

  end;

var
  Form1: TForm1;
  ActiveTool: TToolType;  // Активный инструмент;
  BrushShape: TBrushShape; // Форма кисти;
  isDrawing: boolean; // true - рисуем, false - не рисуем;
  MP1, MP2: TPoint;   // Начальная и конечная позиции мыши;
  BrushSize: integer; // Размер кисти;
  BrushRadius: integer; // Радиус кисти;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  BrushShape:= bshEllipse;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  BrushShape:= bshRect;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  BrushShape:= bshRoundRect;
end;

procedure TForm1.ColorBox1Change(Sender: TObject);
begin
  // При изменении цвета в палитре меняем цвет пера на соответствующий;
  Image1.Canvas.Brush.Color:=ColorBox1.Selected;
  Image1.Canvas.Pen.Color:=ColorBox1.Selected;
end;

procedure TForm1.DrawFigure(a: TPoint; b: TPoint; PM: TPenMode);
begin
  case ActiveTool of   //Выбираем инструмент;
    ttLine:
    begin
      Image1.Canvas.LineTo(b.X,b.Y);
    end;
    ttRect:
    begin
      Image1.Canvas.Rectangle(a.X,a.Y,b.X,b.Y);
    end;
    ttEllipse:
    begin
      Image1.Canvas.Ellipse(a.X,a.Y,b.X,b.Y);
    end;
    ttRoundRect:
    begin
      Image1.Canvas.RoundRect(a.X,a.Y,b.X,b.Y,40,40);  // Значения 40 - закругление краёв прямоугольника;
    end;
  end;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DoubleBuffered:=True;
  isDrawing:=false; //По умолчанию не рисуем;
  // Закрашиваем рабочую область белым цветом;
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.FillRect(Image1.ClientRect);
  BrushShape:= bshEllipse; // По умолчанию - форма кисти - эллипс;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  isDrawing:=true; // Начали рисовать
  Image1.Canvas.Brush.Color:=ColorBox1.Selected;
  Image1.Canvas.Pen.Color:=ColorBox1.Selected;
  // Указываем начальное и конечное местоположение курсора мыши;
  MP1:=Point(X,Y);
  MP2:=MP1;
  Image1.Canvas.MoveTo(X,Y);

end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  StatusBar1.Panels[0].Text:=Format('X=%d, Y=%d', [X, Y]);
  Image1.Canvas.Pen.Width:=StrToInt(Edit1.Text); // Установили размер пера;
  BrushSize:=StrToInt(Edit1.Text); // Устаналиваем размер кисти;
  if isDrawing then  // Если рисуем, то...
    Begin
      case ActiveTool of  //Выбираем инструмент для рисования
         ttRect, ttRoundRect, ttEllipse:
          Begin
            Form1.DrawFigure(MP1, MP2, pmNotXor);
            MP2:=Point(X, Y);
            Form1.DrawFigure(MP1, MP2, pmNotXor);
          End;
          ttBrush:
          begin
            BrushRadius:=BrushSize div 2;
            case BrushShape of
              bshRect:
              begin
                Image1.Canvas.Rectangle(X-BrushRadius, Y-BrushRadius, X+BrushRadius, Y+BrushRadius);
              end;
              bshEllipse:
              begin
                Image1.Canvas.Ellipse(X-BrushRadius, Y-BrushRadius, X+BrushRadius, Y+BrushRadius);
              end;
              bshRoundRect:
              begin
                Image1.Canvas.RoundRect(X-BrushRadius, Y-BrushRadius, X+BrushRadius, Y+BrushRadius, BrushRadius, BrushRadius);
              end;
            end;
          end;
          ttErase: // Стиралка представляет собой кисть, рисующую белым цветом;
          begin
            BrushRadius:=BrushSize div 2;
            Image1.Canvas.Pen.Color:=clWhite;
            Image1.Canvas.Ellipse(X-BrushRadius, Y-BrushRadius, X+BrushRadius, Y+ BrushRadius);
          end;
      end;
    End;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  Var
    i: integer;
begin
   if isDrawing then
   Begin
     case ActiveTool of
     ttLine, ttRect, ttRoundRect, ttEllipse:
     begin
       Form1.DrawFigure(MP1, MP2, pmCopy);
       MP2:=Point(X, Y);
       Form1.DrawFigure(MP1, MP2, pmCopy);
     end;
     ttFill:
     begin
       Image1.Canvas.FloodFill(X, Y, Image1.Canvas.Pixels[X,Y], fsSurface);
     end;
     ttSpray:
     Begin
       Randomize;
       for i := 0 to BrushSize do
         begin
           Image1.Canvas.Pixels[X+Random(BrushSize)-(BrushSize div 2), Y+Random(BrushSize)-(BrushSize div 2)]:=ColorBox1.Selected;
         end;
     End;
     end;
   End;
   isDrawing:=false; // Закончили рисовать;
end;

procedure TForm1.Load1Click(Sender: TObject);
var
  WorkPath: string;
begin
  WorkPath:= ExtractFilePath(ParamStr(0));
  OpenPictureDialog1.InitialDir:= WorkPath + 'Images\';
  if OpenPictureDialog1.Execute
  then
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TForm1.Save1Click(Sender: TObject);
var
  WorkPath: string;
begin
  WorkPath:= ExtractFilePath(ParamStr(0));
  SavePictureDialog1.InitialDir:= WorkPath + 'Images\';
  if SavePictureDialog1.Execute
  then
    Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  ActiveTool:= ttBrush;
  StatusBar1.Panels[1].Text:='Выбран инструмент рисования: Кисть';
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
ActiveTool:= ttLine;
  StatusBar1.Panels[1].Text:='Выбран инструмент рисования: Линия';
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  ActiveTool:= ttSpray;
  StatusBar1.Panels[1].Text:='Выбран инструмент рисования: Спрей';
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  ActiveTool:= ttRoundRect;
  StatusBar1.Panels[1].Text:='Выбран инструмент рисования: Закруглённый прямоугольник ';
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
ActiveTool:= ttErase;
  StatusBar1.Panels[1].Text:='Выбран инструмент редактирования: Стиратель';
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  ActiveTool:= ttRect;
  StatusBar1.Panels[1].Text:='Выбран инструмент рисования: Прямоугольник';
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
  ActiveTool:= ttFill;
  StatusBar1.Panels[1].Text:='Выбран инструмент рисования: Заливка';
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
  ActiveTool:= ttEllipse;
  StatusBar1.Panels[1].Text:='Выбран инструмент рисования: Эллипс';
end;

end.
