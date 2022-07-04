VERSION 5.00
Object = "{DA357F2F-39C1-11D1-88AA-00609731B697}#6.3#0"; "saf.ocx"
Object = "{67C66D63-8B90-11D1-A413-00609731B708}#1.0#0"; "safcont.ocx"
Object = "{79F2369D-9E3F-11D1-A45F-0060080A803B}#8.4#0"; "safdes.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "Tabctl32.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame SAFNewFrame 
      Caption         =   "Frame1"
      Enabled         =   0   'False
      Height          =   480
      Index           =   0
      Left            =   -2000
      TabIndex        =   2
      Top             =   1350
      Visible         =   0   'False
      Width           =   1200
   End
   Begin SAF.SAFUpdate Update1 
      Left            =   120
      Top             =   2520
      _ExtentX        =   688
      _ExtentY        =   688
   End
   Begin SAFCONTAINERLib.SAFContainer SAFContainer1 
      Height          =   480
      Index           =   0
      Left            =   -2000
      TabIndex        =   0
      Top             =   1350
      Visible         =   0   'False
      Width           =   1200
      _Version        =   65536
      _ExtentX        =   2117
      _ExtentY        =   847
      _StockProps     =   0
   End
   Begin CustomizationManager.SAFDesigner SAFDesigner1 
      Height          =   480
      Left            =   -2000
      TabIndex        =   1
      Top             =   1350
      Visible         =   0   'False
      Width           =   1200
      _ExtentX        =   2117
      _ExtentY        =   847
   End
   Begin TabDlg.SSTab SAFNewTab 
      Height          =   480
      Index           =   0
      Left            =   -2000
      TabIndex        =   3
      Top             =   1350
      Visible         =   0   'False
      Width           =   1845
      _ExtentX        =   3254
      _ExtentY        =   847
      _Version        =   327681
      TabHeight       =   520
      Enabled         =   0   'False
      TabCaption(0)   =   "Tab 0"
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).ControlCount=   0
      TabCaption(1)   =   "Tab 1"
      Tab(1).ControlEnabled=   0   'False
      Tab(1).ControlCount=   0
      TabCaption(2)   =   "Tab 2"
      Tab(2).ControlEnabled=   0   'False
      Tab(2).ControlCount=   0
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

    'Load application sub-form(s)
        'Call LoadForm( SubFormName)




    'Call to Initialize the Application (required in all applications)
        Call ApplInit




    'Setaddr call(s)
        'Call Setaddr(LEVEL0, "bTableName", bTableName, nTableName, LenB(bTableName))




    'SqlCursor call(s)
        'Call sqlcursorex(CSR_TableName, LEVEL0, "CSR_TableName", "TableName", "TableName")



    
    'Call to Initialize the Screen (required in all applications)
        Call ScreenInit



    
    'DetailSetup call for simple grid
        'MemHandle_Spread1 = detailsetup(CSR_TableName, Spread1_TableName, PNULL, bTableName, LenB(bTableName), PNULL, 0, PNULL, 0, PNULL, 0)

End Sub

Private Sub Form_Unload(Cancel As Integer)


    'Terminate the application (required in all applications)
        Call screenexit("", "")


End Sub
