unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  TMS.TMSFNCWebPushServer, TMS.TMSFNCWebPushDB, TMS.TMSFNCWebPushSender,
  IdContext, IdCustomHTTPServer;

type
  TForm1 = class(TForm)
    btnStart: TButton;
    memLog: TMemo;
    btnSendToAll: TButton;
    edtTitle: TEdit;
    lblTitle: TLabel;
    lblBody: TLabel;
    edtBody: TEdit;
    chkUrl: TCheckBox;
    edtUrl: TEdit;
    lblLog: TLabel;
    TMSFNCWebPushDB1: TTMSFNCWebPushDB;
    TMSFNCWebPushSender1: TTMSFNCWebPushSender;
    TMSFNCWebPushServer1: TTMSFNCWebPushServer;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnSendToAllClick(Sender: TObject);
    procedure TMSFNCWebPushSender1NotificationSent(Sender: TObject;
      AResponseCode: Integer; AResponse, AEndpoint, APayload, AUserID,
      ABrowserID: string);
    procedure TMSFNCWebPushSender1NotificationError(Sender: TObject;
      AResponseCode: Integer; AResponse, AEndpoint, APayload, AUserID,
      ABrowserID: string; var ADelete: Boolean);
    procedure TMSFNCWebPushServer1HTTPRequest(Sender: TObject;
      AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo;
      AResponseInfo: TIdHTTPResponseInfo; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnStartClick(Sender: TObject);
begin
  TMSFNCWebPushServer1.Active := True;
  btnStart.Enabled := False;
end;

procedure TForm1.btnSendToAllClick(Sender: TObject);
var
  url: string;
begin
  url := '';
  if chkUrl.Checked then
    url := edtUrl.Text;

  TMSFNCWebPushSender1.SendNotificationAll(edtTitle.Text, edtBody.Text, '', url);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //Not mandatory but Firefox and Safari won't accept if not present
  //Please use your own contact information
  TMSFNCWebPushSender1.Claims.Subject := 'mailto:admin@example.com';

  TMSFNCWebPushServer1.DefaultHTTPPort := 8081;
  TMSFNCWebPushServer1.DefaultHTTPSPort := 8443;
end;

procedure TForm1.TMSFNCWebPushSender1NotificationError(Sender: TObject;
  AResponseCode: Integer; AResponse, AEndpoint, APayload, AUserID,
  ABrowserID: string; var ADelete: Boolean);
begin
  memLog.Lines.Add('Error sending notification to ' + AUserID + ' (' + AResponseCode.ToString + '): ' + AResponse);
end;

procedure TForm1.TMSFNCWebPushSender1NotificationSent(Sender: TObject;
  AResponseCode: Integer; AResponse, AEndpoint, APayload, AUserID,
  ABrowserID: string);
begin
  memLog.Lines.Add('Sent to ' + AUserID);
end;

procedure TForm1.TMSFNCWebPushServer1HTTPRequest(Sender: TObject;
  AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo;
  AResponseInfo: TIdHTTPResponseInfo; var AHandled: Boolean);
begin
  memLog.Lines.Add('Got request from: ' + ARequestInfo.URI);
end;

end.
