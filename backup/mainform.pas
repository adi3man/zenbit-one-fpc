unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  ComCtrls, ExtCtrls, Spin, Menus, CheckLst, ComboEx, ExtendedNotebook,
  CheckBoxThemed, DateTimePicker;

type

  { TMainMenuForm }

  TMainMenuForm = class(TForm)
    Button_CariProduk: TButton;
    Button_JalankanBulkProvider: TButton;
    Button_JalankanBulkProduk: TButton;
    Button_SimpanPerubahanProviders: TButton;
    Button_CariProviders: TButton;
    Button_ExecuteBulkAction: TButton;
    Button_AturKolom: TButton;
    Button_Refresh: TButton;
    Button_Reset: TButton;
    Button_SimpanPerubahanProduk: TButton;
    CheckBox_AutoFillColumn: TCheckBox;
    CheckBox_AutoRefresh: TCheckBox;
    ComboBox_BulkActionProvider: TComboBox;
    ComboBox_BulkAction: TComboBox;
    ComboBox_BulkActionProduk: TComboBox;
    ComboBox_Filter1: TComboBox;
    ComboBox_Filter_ModulSpl: TComboBox;
    ComboBox_Filter_StatusTrx: TComboBox;
    ComboBox_Filter2: TComboBox;
    ComboBox_Filter3: TComboBox;
    DateTimePicker_TglAwalFilter: TDateTimePicker;
    DateTimePicker_TglAkhirFilter: TDateTimePicker;
    Edit_FilterBox1: TEdit;
    Edit_FilterBox2: TEdit;
    Edit_FilterBox3: TEdit;
    LabeledEdit_CariNamaGrup: TLabeledEdit;
    LabeledEdit_CariKodeProduk: TLabeledEdit;
    LabeledEdit_CariProdukHrgGrup: TLabeledEdit;
    LabeledEdit_CariNamaProvider: TLabeledEdit;
    LabeledEdit_CariKodeProvider: TLabeledEdit;
    LabeledEdit_CariNamaProduk: TLabeledEdit;
    LabeledEdit_CariProviderHrgGrup: TLabeledEdit;
    Label_AccountName: TLabel;
    Label_RealTimeDateTime: TLabel;
    Label_TglAwalFilter: TLabel;
    Label_TglAkhirFilter: TLabel;
    Label_NoOfProses: TLabel;
    Label_NoOfSukses: TLabel;
    Label_NoOfGagal: TLabel;
    Label_CountProses: TLabel;
    Label_CountSukses: TLabel;
    Label_CountGagal: TLabel;
    Label_BulkAction: TLabel;
    Label_Detik: TLabel;
    MainMenu1: TMainMenu;
    Memo_JawabanProvider: TMemo;
    MenuItem1: TMenuItem;
    PageControl1: TPageControl;
    PageControl_Produk: TPageControl;
    SpinEdit_AutoRefreshInterval: TSpinEdit;
    StringGrid1: TStringGrid;
    StringGrid_ListProviders: TStringGrid;
    StringGrid_ListProduks: TStringGrid;
    StringGrid_TransaksiList: TStringGrid;
    TabSheet_ParsingProduk: TTabSheet;
    TabSheet_GrupHarga: TTabSheet;
    TabSheet_Produks: TTabSheet;
    TabSheet_Providers: TTabSheet;
    TabSheet_Produk: TTabSheet;
    TabSheet_Reseller: TTabSheet;
    TabSheet_Modul: TTabSheet;
    TabSheet_Transaksi: TTabSheet;
    Timer_DateAndTimeRefresh: TTimer;
    ToggleBox_AutoFillKolumProvider: TToggleBox;
    ToggleBox_AutoFillKolumProduk: TToggleBox;
    procedure Button_ResetClick(Sender: TObject);
    procedure CheckBox_AutoFillColumnChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer_DateAndTimeRefreshTimer(Sender: TObject);
    procedure ToggleBox_AutoFillKolumProdukChange(Sender: TObject);
    procedure ToggleBox_AutoFillKolumProviderChange(Sender: TObject);
  private

  public

  end;

var
  MainMenuForm: TMainMenuForm;

implementation

{$R *.lfm}

{ TMainMenuForm }

procedure TMainMenuForm.Button_ResetClick(Sender: TObject);
begin
  ComboBox_Filter1.ItemIndex:=-1;
  ComboBox_Filter2.ItemIndex:=-1;
  ComboBox_Filter3.ItemIndex:=-1;
  ComboBox_Filter_StatusTrx.ItemIndex:=0;
  ComboBox_Filter_ModulSpl.ItemIndex:=-1;
  Edit_FilterBox1.Text:='';
  Edit_FilterBox2.Text:='';
  Edit_FilterBox3.Text:='';
  Edit_FilterBox1.SetFocus;
  Edit_FilterBox2.SetFocus;
  Edit_FilterBox3.SetFocus;
  DateTimePicker_TglAwalFilter.Date := Date - 1;
  DateTimePicker_TglAkhirFilter.Date := Date;
  Button_Reset.SetFocus;
end;

procedure TMainMenuForm.CheckBox_AutoFillColumnChange(Sender: TObject);
begin
    StringGrid_TransaksiList.AutoFillColumns := CheckBox_AutoFillColumn.Checked;
end;

procedure TMainMenuForm.FormShow(Sender: TObject);
begin
  Label_RealTimeDateTime.Caption := FormatDateTime('dddd, dd mmm yyyy - hh:nn:ss', Now);
  DateTimePicker_TglAwalFilter.Date := Date - 1;
  DateTimePicker_TglAkhirFilter.Date := Date;
end;

procedure TMainMenuForm.Timer_DateAndTimeRefreshTimer(Sender: TObject);
begin
  Label_RealTimeDateTime.Caption := FormatDateTime('dddd, dd mmm yyyy - hh:nn:ss', Now);
end;

procedure TMainMenuForm.ToggleBox_AutoFillKolumProdukChange(Sender: TObject);
begin
  StringGrid_ListProduks.AutoFillColumns := ToggleBox_AutoFillKolumProduk.Checked;
end;

procedure TMainMenuForm.ToggleBox_AutoFillKolumProviderChange(Sender: TObject);
begin
  StringGrid_ListProviders.AutoFillColumns := ToggleBox_AutoFillKolumProvider.Checked;
end;

end.

