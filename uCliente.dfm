inherited viewCliente: TviewCliente
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgPrincipal: TPageControl
    ActivePage = tsFormulario
    inherited tsPesquisa: TTabSheet
      inherited gDados: TDBGrid
        DataSource = dsCliente
      end
    end
    inherited tsFormulario: TTabSheet
      object Label1: TLabel [0]
        Left = 3
        Top = 3
        Width = 33
        Height = 13
        Caption = 'NOME'
        FocusControl = DBEdit1
      end
      object Label2: TLabel [1]
        Left = 3
        Top = 43
        Width = 31
        Height = 13
        Caption = 'EMAIL'
        FocusControl = DBEdit2
      end
      object Label3: TLabel [2]
        Left = 3
        Top = 83
        Width = 48
        Height = 13
        Caption = 'CPF_CNPJ'
        FocusControl = DBEdit3
      end
      object Label4: TLabel [3]
        Left = 3
        Top = 123
        Width = 57
        Height = 13
        Caption = 'ENDERECO'
        FocusControl = DBEdit4
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 19
        Width = 251
        Height = 21
        DataField = 'NOME'
        DataSource = dsCliente
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 59
        Width = 310
        Height = 21
        DataField = 'EMAIL'
        DataSource = dsCliente
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 3
        Top = 99
        Width = 225
        Height = 21
        DataField = 'CPF_CNPJ'
        DataSource = dsCliente
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 3
        Top = 139
        Width = 894
        Height = 21
        DataField = 'ENDERECO'
        DataSource = dsCliente
        TabOrder = 4
      end
    end
  end
  object qrClientes: TUniQuery [2]
    Connection = cnPadrao
    SQL.Strings = (
      'select * from cliente')
    Left = 224
    Top = 288
    object qrClientesID: TIntegerField
      DisplayWidth = 7
      FieldName = 'ID'
      Required = True
    end
    object qrClientesNOME: TStringField
      DisplayWidth = 70
      FieldName = 'NOME'
      Size = 50
    end
    object qrClientesEMAIL: TStringField
      DisplayWidth = 19
      FieldName = 'EMAIL'
      Size = 100
    end
    object qrClientesCPF_CNPJ: TStringField
      DisplayWidth = 17
      FieldName = 'CPF_CNPJ'
    end
    object qrClientesENDERECO: TStringField
      DisplayWidth = 300
      FieldName = 'ENDERECO'
      Size = 300
    end
  end
  inherited cnPadrao: TUniConnection
    ProviderName = 'interBase'
    Port = 3050
    Database = 'D:\Projetos\treinamentoDelphi\App\Data\Dados.fdb'
    Username = 'SYSDBA'
    Server = '127.0.0.1'
    Connected = True
    LoginPrompt = False
    EncryptedPassword = '92FF9EFF8CFF8BFF9AFF8DFF94FF9AFF86FF'
  end
  object dsCliente: TUniDataSource
    DataSet = qrClientes
    Left = 256
    Top = 288
  end
end
