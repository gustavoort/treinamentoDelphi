inherited viewPacote: TviewPacote
  Caption = 'viewPacote'
  ClientHeight = 544
  ClientWidth = 947
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Name = 'Tahoma'
  ExplicitWidth = 947
  ExplicitHeight = 544
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnCabecalho: TPanel
    Width = 947
    inherited SpeedButton5: TSpeedButton
      Left = 807
    end
    inherited SpeedButton7: TSpeedButton
      Left = 877
      ExplicitLeft = 903
    end
  end
  inherited PageControl1: TPageControl
    Width = 947
    Height = 514
    ExplicitTop = 30
    ExplicitWidth = 947
    ExplicitHeight = 514
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 939
      inherited DBGrid1: TDBGrid
        Width = 939
        Height = 486
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Name = 'Tahoma'
      end
    end
    inherited TabSheet2: TTabSheet
      ExplicitWidth = 939
      ExplicitHeight = 486
      inherited Label2: TLabel
        Width = 29
        ExplicitWidth = 29
      end
      inherited Label3: TLabel
        Width = 30
        ExplicitWidth = 30
      end
      inherited Label4: TLabel
        Width = 50
        ExplicitWidth = 50
      end
      inherited Label5: TLabel
        Width = 54
        ExplicitWidth = 54
      end
      inherited Panel1: TPanel
        Left = 909
        Height = 486
        ExplicitLeft = 909
        ExplicitHeight = 486
        inherited SpeedButton6: TSpeedButton
          Top = 455
        end
      end
    end
  end
end
