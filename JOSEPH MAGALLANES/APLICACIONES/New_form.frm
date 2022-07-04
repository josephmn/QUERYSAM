VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "Tabctl32.ocx"
Object = "{67C66D63-8B90-11D1-A413-00609731B708}#1.0#0"; "safcont.ocx"
Object = "{79F2369D-9E3F-11D1-A45F-0060080A803B}#8.5#0"; "safdes.ocx"
Begin VB.Form new_form 
   Caption         =   "New Form"
   ClientHeight    =   3195
   ClientLeft      =   5775
   ClientTop       =   3420
   ClientWidth     =   4680
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   Begin VB.Frame SAFNewFrame 
      Caption         =   "Frame1"
      Enabled         =   0   'False
      ForeColor       =   &H80000008&
      Height          =   480
      Index           =   0
      Left            =   -2000
      TabIndex        =   2
      Top             =   1350
      Visible         =   0   'False
      Width           =   1200
   End
   Begin CustomizationManager.SAFDesigner SAFDesigner1 
      Height          =   420
      Left            =   -2000
      TabIndex        =   1
      Top             =   2700
      Visible         =   0   'False
      Width           =   660
      _ExtentX        =   1164
      _ExtentY        =   741
   End
   Begin SAFCONTAINERLib.SAFContainer SAFContainer1 
      Height          =   375
      Index           =   0
      Left            =   -2000
      TabIndex        =   0
      Top             =   2220
      Visible         =   0   'False
      Width           =   1635
      _Version        =   65536
      _ExtentX        =   2884
      _ExtentY        =   661
      _StockProps     =   0
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
      _Version        =   393216
      TabHeight       =   520
      Enabled         =   0   'False
      ForeColor       =   -2147483640
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
Attribute VB_Name = "new_form"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
