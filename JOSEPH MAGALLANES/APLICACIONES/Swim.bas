Attribute VB_Name = "SWIMBAS"
'/************************************************************************
'* Solomon IV (tm) for Windows (tm)
'* Copyright Solomon Software (TLB, Inc.) 1993-1995. All Rights Reserved.
'*
'* File Name     : swim.bas
'*
'* Narrative     : Contains a .BAS module that will be included in every
'*                 RDT program.
'*
'* WLI      04/13/1999  Added CallPrePostApplicWait Function for executing
'*                      pre/post process. (CR202374)
'************************************************************************/
Option Explicit

' Used to insure application built correctly
' Should match APPLIC_VER in applic.dh and define.h
Global Const SWIMBAS_VER = "00.26"

' Use the db type we have already loaded
Global Const SqlTypeDefault = 99

' used to collect db login info
Global CalledByHwnd&  ' Handle of the program which called us (or we are otherwise linked to)

' Flag indicating whether cancel button pressed
Dim flgCancelPressed As Integer

' indicates whether db is opened
Dim flgDBOpen As Integer

' flag indicating where program was called from
Dim flgCalledFrom As Integer

' MJM: Added a global for the SolomonVBTApp object which must be created to talk to SWIM
Global vbtApp As SolomonVBTApp
Global solScreen As Object

Global maxlabel%, max_button As Integer, maxframe%, maxpanel%, max_note_button%
Global maxtext%, maxint%, maxfloat%, maxdate%
Global maxcheck%, maxoption%, maxcombo%, maxtabbox%, maxselbox%

'Following is for Note api's within this .bas file
'Buffer used to fetch the snote record values
Type sNoteBuffTag
    nID As Long
    stablename As String * 20
End Type
Global bSnoteIdBuffer As sNoteBuffTag

'Buffer used to see if record exists with a certain noteid
Type TableNoteTag
    nID As Long
End Type
Global TableNoteID As TableNoteTag

Global Const AllNoteOrphans = -1



'************************************************************************/
'BEGIN RMV/MV





Declare Sub floatinit Lib "swimapi.dll" Alias "#100" (ByVal dbl As Double)





' Design time calls and constants follow (duplicated in parent.dh and swim.bas)
Global Const CTL_LABEL = 1
Global Const CTL_BUTTON = 4
Global Const CTL_FORM = 80
Global Const CTL_FRAME = 81     ' 3D frame
Global Const CTL_PANEL = 82     ' 3D panel
Global Const CTL_SSCOMMAND = 83 ' 3D SSCOMMAND (used for NOTE icons)    'deb
Global Const CTL_SPREAD = 84
Global Const CTL_TLBLABEL = 85
Global Const CTL_VBTEXT = 86
Global Const CTL_TLB_FIRST = 90
Global Const CTL_TEXT = 90
Global Const CTL_INT = 91
Global Const CTL_FLOAT = 92
Global Const CTL_DATE = 93
Global Const CTL_CHECK = 100
Global Const CTL_OPTION = 101
Global Const CTL_COMBO = 102
Global Const CTL_TLB_LAST = 102
Global Const CTL_SELECTBOX = CTL_TLB_LAST + 1   ' not a true control type; used strictly
                                                ' internally by cut-copy-paste logic for
                                                ' creation of "selection" boxes (see ccpapi.c)





' use these in code in case message number changes later
' should match defines in define.h, as well as messages
' numbers stored in database
Global Const MSG_SWIM_VERSION = 5010




Global Const PARENT_APP_NAME = "PARENT.EXE"





' Used to tell how one of our programs was called
' Corresponding #defines in DEFINE.H, PARENT.BAS
Global Const FROM_OS = 0
Global Const PARENT_CALLED_APPL = 1
Global Const APPL_CALLED_PARENT = 2
Global Const APPL_CALLED_APPL = 3
Global Const APPLWAIT_CALLED_APPL = 4
Global Const APPL_CALLED_BY_QM = 5

Declare Sub sw_applinit Lib "swimapi.dll" (ByVal Form1 As Form, ByVal formwnd&, ByVal Nullform As Form, ByVal nullctrl As Control, ByVal cmd$, nullctrl As Any)
Declare Function sw_screeninit Lib "swimapi.dll" (ByVal pscreenid$, ByVal vbtApp As Object) As Object
Declare Sub sw_screenexit Lib "swimapi.dll" (ByVal pnextscreenid$, ByVal parms$)
Declare Function ApplicVer Lib "swimapi.dll" () As String
Declare Sub SetCalledByHwnd Lib "swimapi.dll" Alias "#249" (ByVal CalledByHwnd&)
Declare Function GetCalledByHwnd Lib "swimapi.dll" Alias "#250" () As Integer
Declare Function RegisterVBTApp Lib "swimapi.dll" (vbtApp As Object) As Object
Declare Sub UnregisterVBTApp Lib "swimapi.dll" ()

' These two declarations are duplicated in parent.bas
Declare Function GetSqlType Lib "swimapi.dll" () As Integer
Declare Sub SetSqlType Lib "swimapi.dll" (ByVal SqlType As Integer)



Declare Sub SuppressInsertCtl Lib "swimapi.dll" (ByVal suppressflg%)  ' System's declare, but needs to be in applic.dh





'from custom.c
Declare Sub AppCreatedCtl Lib "swimapi.dll" (ByVal newctl As Control)
Declare Sub AppCreatedForm Lib "swimapi.dll" (ByVal formx As Form)





Declare Sub dateinit Lib "swimapi.dll" Alias "#101" (NULLDATE As Sdate)





'from error.c
Declare Function SystemErr Lib "swimapi.dll" () As Integer
Declare Sub sw_error Lib "swimapi.dll" Alias "#253" (ByVal s1$, ByVal s2$, ByVal s3$, ByVal s4$)





Declare Sub ExecProg Lib "swimapi.dll" (ByVal cmdline$)
Declare Function ExecProgWait Lib "swimapi.dll" (ByVal cmdline$) As Integer
Declare Function ExecPrePostProgWait Lib "swimapi.dll" (ByVal cmdline$) As Integer
Declare Function ExecProgWithStatus Lib "swimapi.dll" (ByVal cmdline$) As Integer
Declare Sub SetParentRootDir Lib "swimapi.dll" Alias "#316" ()




Declare Sub disp_form Lib "swimapi.dll" (ByVal formx As Form, ByVal centered%)
Declare Function formwait Lib "swimapi.dll" (ByVal formx As Form) As Integer


'from parent.c
Declare Function IsParentRunning Lib "swimapi.dll" Alias "#302" () As Integer
Declare Function GetParentHeight Lib "swimapi.dll" Alias "#569" () As Long



Declare Sub ProcStatButton Lib "swimapi.dll" Alias "#257" ()
Declare Sub ProcStatFormLoad Lib "swimapi.dll" (ByVal hctl1 As Control, ByVal hctl2 As Control, ByVal hctl3 As Control, ByVal pform As Form, ByVal timerctl As Control)
Declare Sub ProcTimeUpdate Lib "swimapi.dll" Alias "#258" ()






'from pvform.c
Declare Sub pvforminit Lib "swimapi.dll" Alias "#308" (ByVal PVForm As Form, ByVal PVGrid As Control)
Declare Sub PVFormButton Lib "swimapi.dll" Alias "#260" (ByVal s$)
Declare Sub PVGridScroll Lib "swimapi.dll" (ByVal flag%, ByVal scroll%)
Declare Sub PVAlternateSort Lib "swimapi.dll" Alias "#307" (ByVal Col%)





'from sqlacces.c
Declare Function IsLoginReady Lib "swimapi.dll" () As Integer
Declare Function SqlLogin Lib "swimapi.dll" (ByVal SysDbPassword$, SysDbErr%, ByVal AppDbPassword$, AppDbErr%, ByVal SqlSrvrAppDbPass$, ByVal Passflg%) As Integer
Declare Sub SqlLogout Lib "swimapi.dll" ()







'END   RMV/MV
'************************************************************************/


'Begin DRK - Add Registry functions to support help system

' Private Declarations
Private Const READ_CONTROL = &H20000
Private Const SYNCHRONIZE = &H100000

Private Enum KEY
  KEY_QUERY_VALUE = &H1
  KEY_SET_VALUE = &H2
  KEY_CREATE_SUB_KEY = &H4
  KEY_ENUMERATE_SUB_KEYS = &H8
  KEY_NOTIFY = &H10
  KEY_READ = ((READ_CONTROL Or KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY) And (Not SYNCHRONIZE))
End Enum

Private Enum REG
  REG_NONE = 0                     '// No value type
  REG_SZ = 1                       ' // Unicode nul terminated string
  REG_EXPAND_SZ = 2                ' // Unicode nul terminated string
                                              ' // (with environment variable references)
  REG_BINARY = 3                   ' // Free form binary
  REG_DWORD_LITTLE_ENDIAN = 4
  REG_DWORD_BIG_ENDIAN = 5
  REG_DWORD = REG_DWORD_LITTLE_ENDIAN
  REG_LINK = 6                     ' // Symbolic Link (unicode)
  REG_MULTI_SZ = 7                 ' // Multiple Unicode strings
  REG_RESOURCE_LIST = 8            ' // Resource list in the resource map
  REG_FULL_RESOURCE_DESCRIPTOR = 9 ' // Resource list in the hardware description
  REG_RESOURCE_REQUIREMENTS_LIST = 10
End Enum

' Return codes from Registration functions
Private Const ERROR_SUCCESS = 0&
Private Const ERROR_OUTOFMEMORY = 6&
Private Const ERROR_INVALID_PARAMETER = 7&
Private Const ERROR_ACCESS_DENIED = 8&



' This value for "largest possible Registry buffer"
' is based on Microsoft's recommendation that any entries larger
' than this should be stored as files, with a UNC to them in the Registry
Private Const REG_BUFFER_SIZE = 2048


' System Registry API functions
Private Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal HKEY As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegQueryValueExA Lib "advapi32.dll" (ByVal HKEY As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Private Declare Function RegCreateKeyA Lib "advapi32.dll" (ByVal HKEY As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal HKEY As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal HKEY As Long) As Long

Private Declare Function ExpandEnvironmentStrings Lib "kernel32" Alias "ExpandEnvironmentStringsA" (ByVal lpSrc As String, ByVal lpDst As String, ByVal nDstSize As Long) As Long

' Public Declarations
Public Enum HKEY
  HKEY_CLASSES_ROOT = &H80000000
  HKEY_CURRENT_USER = &H80000001
  HKEY_LOCAL_MACHINE = &H80000002
  HKEY_USERS = &H80000003
  HKEY_CURRENT_CONFIG = &H80000005
End Enum

'End DRK - Add Registry functions to support help system

Private Const VbVersion6 = 6

'****************************************************************************
' Function:     CallApplic
'
' Narrative:    Allow application program to start another application.
'
' Arguements:
'
' Alter(s):
'
'****************************************************************************
Sub CallApplic(exename$, parms$)
        
        Dim s$

    s$ = exename$ + ".exe " + Str$(APPL_CALLED_APPL) + PRMSEP + parms$
    Call ExecProg(s$)

End Sub

'****************************************************************************
' Function:     CallApplicWait
'
' Narrative:    Allow application program to start another application.  In
'               addition, execution will not return until the called
'               application has been closed.
'
' Arguements:
'
' Alter(s):
'
'****************************************************************************
Sub CallApplicWait(exename$, parms$)

        Dim s$
        Dim serr As Integer
        Dim hwnd As Long

    hwnd = Form1.hwnd
    s$ = exename$ + ".exe " + Str$(APPLWAIT_CALLED_APPL) + PRMSEP + Trim$(Str$(hwnd)) + PRMSEP + parms$
    serr = ExecProgWait(s$)

End Sub
'****************************************************************************
' Function:     CallPrePostApplicWait
'
' Narrative:    Allow application to start a pre/post-process.  In
'               addition, execution will not return until the called
'               application has been closed.
'
' Arguements:
'
' Alter(s):
'
'****************************************************************************
Sub CallPrePostApplicWait(exename$, parms$)

        Dim s$
        Dim serr As Integer
        Dim hwnd As Long

    hwnd = Form1.hwnd
    s$ = exename$ + ".exe " + Str$(APPLWAIT_CALLED_APPL) + PRMSEP + Trim$(Str$(hwnd)) + PRMSEP + parms$
    serr = ExecPrePostProgWait(s$)

End Sub

'****************************************************************************
' Function:     ChkParentStart
'
' Narrative:    Prompt application programmer for starting of parent
'               application.
'
' Arguements:
'
' Alter(s):
'
'****************************************************************************
Sub ChkParentStart()

        Dim ret As Integer
        Dim wtype As Integer
        Dim s$

    If flgCalledFrom <> PARENT_CALLED_APPL And IsParentRunning() = False Then
        Call SetParentRootDir
        s$ = PARENT_APP_NAME + " " + Str$(APPL_CALLED_PARENT)
        ExecProg (s$)

    End If

    Do While IsLoginReady() <> 1
        DoEvents
    Loop

End Sub

'****************************************************************************
' Function:     CloseDB
'
' Narrative:    Close the database.
'
' Arguements:
'
' Alter(s):     flgDBOpen
'
'****************************************************************************
Sub CloseDB()
    
    ' If flgDBOpen = False Then Exit Sub
    
    ' Logout of database
    Call SqlLogout

    ' set flag indicating db is closed
    flgDBOpen = False

End Sub

Sub createctl(ctltype%)
    Dim formvar As Form
#If xyz Then
    ' Some controls has been moved to commun.frm to try a prevent VB's
    '   form 64k limits from overflowing.
    Select Case ctltype
        Case CTL_TEXT
            If maxtext > 0 Then Load commun.c_text(maxtext)
            Call proc_created(commun.c_text(maxtext), maxtext)
        Case CTL_TLBLABEL
            If maxlabel > 0 Then Load c_form.c_label(maxlabel)
            Call proc_created(c_form.c_label(maxlabel), maxlabel)
        Case CTL_BUTTON
            If max_button > 0 Then Load c_form.c_button(max_button)
            Call proc_created(c_form.c_button(max_button), max_button)

        ' DEB: Parian attempted to use SSCOMMAND for all button types
        '      (changed BUTTON in MOVEFORM.FRM to SSCOMMAND).  This
        '      caused customization to break.  Changed MOVEFORM.FRM
        '      so that BUTTON control is retained, and created a separate
        '      SSCOMMAND for use as note buttons
        Case CTL_SSCOMMAND
            If max_note_button > 0 Then Load c_form.c_note_button(max_note_button)
            Call proc_created(c_form.c_note_button(max_note_button), max_note_button)

        Case CTL_FRAME
            If maxframe > 0 Then Load c_form.c_frame(maxframe)
            Call proc_created(c_form.c_frame(maxframe), maxframe)
        Case CTL_PANEL
            If maxpanel > 0 Then Load c_form.c_panel(maxpanel)
            Call proc_created(c_form.c_panel(maxpanel), maxpanel)
        Case CTL_INT
            If maxint > 0 Then Load c_form.c_int(maxint)
            Call proc_created(c_form.c_int(maxint), maxint)
        Case CTL_FLOAT
            If maxfloat > 0 Then Load c_form.c_float(maxfloat)
            Call proc_created(c_form.c_float(maxfloat), maxfloat)
        Case CTL_DATE
            If maxdate > 0 Then Load c_form.c_date(maxdate)
            Call proc_created(c_form.c_date(maxdate), maxdate)
        Case CTL_CHECK
            If maxcheck > 0 Then Load c_form.c_check(maxcheck)
            Call proc_created(c_form.c_check(maxcheck), maxcheck)
        Case CTL_OPTION
            If maxoption > 0 Then Load c_form.c_option(maxoption)
            Call proc_created(c_form.c_option(maxoption), maxoption)
        Case CTL_COMBO
            If maxcombo > 0 Then Load c_form.c_combo(maxcombo)
            Call proc_created(c_form.c_combo(maxcombo), maxcombo)
        Case CTL_VBTEXT
            If maxtabbox > 0 Then Load commun.c_tabbox(maxtabbox)
            Call proc_created(commun.c_tabbox(maxtabbox), maxtabbox)
        Case CTL_SELECTBOX
            ' start out at one
            If maxselbox = 0 Then maxselbox = 1
            Load commun.c_selbox(maxselbox)
            Call proc_created(commun.c_selbox(maxselbox), maxselbox)
        Case CTL_FORM
            Set formvar = New c_form
            Call AppCreatedForm(formvar)
    End Select
#End If
End Sub

'****************************************************************************'****************************************************************************
' Function:     DeleteNote
'
' Narrative:    Used to delete a note or all notes for a particular
'               record type, which do not have a corresponding
'               record with same noteid.
'
' Arguements:   TableName - Type of record to delete snotes for.
'               noteid    - ID of note to delete or
'                           AllNoteOrphans - to delete all
'
' Alter(s):
'
'****************************************************************************
Sub DeleteNote(tableName$, NoteID&)
        Dim sqlcmd$
        Dim NOTE_CURSOR%
        Dim TABLE_CURSOR%
        Dim LoopCtr%
        Dim PrevNoteID&
        Dim Done%

    Call SqlCursorEx(NOTE_CURSOR, NOLEVEL, "Note_Cursor", "SNote", "SNote")
    Call SqlCursorEx(TABLE_CURSOR, SqlReadOnly + NOLEVEL, "DeleteNoteTableCursor", Trim$(tableName), "")

    If (NoteID = AllNoteOrphans) Then
        
        ' Application will have already started process and be within a transaction
        Call Status(0, False, "Searching And Deleting Orphan Notes" + NL, DISP_ONLY)
        DoEvents
        
        'This is used to count the number of note records we delete
        LoopCtr = 0

        'Get the first Record from TableName where noteid is not 0
        sqlcmd = "select noteid from " + Trim$(tableName) + " where noteid > 0 order by noteid desc"
        serr = SqlFetch1(TABLE_CURSOR, sqlcmd, TableNoteID, LenB(TableNoteID))
        
        'Setup the sql statement to obtain the snote tables > than the highest noteid we have in the TableName table
        'But less than the previous snote we were checking, which in the 1st case will be the highest possible value
        sqlcmd = "select nID, sTableName from snote where stablename like '" + Trim$(tableName) + "%' and nID > @parm1 and nID < @parm2 order by nid"
        Call sql(NOTE_CURSOR, sqlcmd)
        
        'For 1st time set previouse noteid variable to highest value a long variable supports
        PrevNoteID = 2147483647

        'while there are TableName records to process then find the snote specific to the noteid's
        'specified above
        Done = False
        While Done = False
            'If there were no TableName records with a NoteID > 0 then the following loop will
            'delete all snote records for this TableName
            If serr = NOTFOUND Then
                TableNoteID.nID = 0
                Done = True
            End If

            'This will restrict our result set to snotes with a noteid > the highest noteid in the TableName record
            Call SqlSubst(NOTE_CURSOR, "parm1", IParm(TableNoteID.nID))
            
            'This will restrict our result set to snotes with a noteid < the previous noteid we were checking
            'This will prevent us from deleting snotes that have been previously tested
            Call SqlSubst(NOTE_CURSOR, "parm2", IParm(PrevNoteID))
            Call SqlExec(NOTE_CURSOR)
            serr = SFetch1(NOTE_CURSOR, bSnoteIdBuffer, LenB(bSnoteIdBuffer))
            While serr = 0
                Call SDelete(NOTE_CURSOR, "SNote")
                If TranStatus() = 0 Then
                    LoopCtr = LoopCtr + 1
                
                    Call Status(0, False, "Table " + Trim$(tableName) + Str$(LoopCtr) + " Notes Deleted", DISP_ONLY)
                End If
                serr = SFetch1(NOTE_CURSOR, bSnoteIdBuffer, LenB(bSnoteIdBuffer))
            Wend
            
            Call Status(0, False, "Table " + Trim$(tableName) + Str$(LoopCtr) + " Notes Deleted", DISP_ONLY)
            DoEvents

            'Set the PrevNoteID variable so we know not to delete this snote, next time through the loop
            PrevNoteID = TableNoteID.nID
            
            'Get the next noteid in the TableName table
            serr = SFetch1(TABLE_CURSOR, TableNoteID, LenB(TableNoteID))
        Wend
    Else
        sqlcmd = "select nID, sTableName from snote where nID = " + Trim$(Str$(NoteID)) + " AND stablename like '" + Trim$(tableName) + "%'"
        serr = SqlFetch1(NOTE_CURSOR, sqlcmd, bSnoteIdBuffer, LenB(bSnoteIdBuffer))
        If serr = 0 Then
            Call SDelete(NOTE_CURSOR, "SNote")
        End If
    End If
    
    Call SqlFree(NOTE_CURSOR)
    Call SqlFree(TABLE_CURSOR)
End Sub

'****************************************************************************'****************************************************************************
' Function:     DispForm
'
' Narrative:    Used to display application Sub Forms. Will deal with the
'               MODEL and wait for form completion issues.
'
' Arguements:
'
' Alter(s):
'
'****************************************************************************
Sub DispForm(formx As Form, ByVal centered%)

    Call disp_form(formx, centered)
    If IS_TI() = False Then            ' CR 205411
        Do
            DoEvents
            'Will loop until the form is gone.
        Loop While formwait(formx) = True
    End If                              ' CR 205411
End Sub

'****************************************************************************
' Function:     LocateForm
'
' Narrative:    Used as a standard method of locating application forms.
'               Use pre-defined constants that indicate where the parent
'               application is located, and locate the application form
'               relative to it.
'
' Arguements:
'
' Alter(s):
'
'****************************************************************************
Sub LocateForm(X As Form)
  
    ' Center form underneath parent
    X.Move (screen.Width / 2 - X.Width / 2), GetParentHeight()
    
End Sub

'****************************************************************************
' Function:     MousePointer
'
' Narrative:    Allow setting of form mouse pointer.
'
' Arguements:
'
' Alter(s):
'
'****************************************************************************
Sub MousePointer(ByVal mp As Integer)
    screen.MousePointer = mp
End Sub

'****************************************************************************
' Function:     SetMousePointer
'
' Narrative:    Allow setting of form mouse pointer.  This one was added because
'                   in VB 5.0, MousePointer is a property on a form.  So if the
'                   MousePointer function was called in form code, it gave an error.
'                   The MousePointer function above is kept for backwards compatibility.
'
' Arguements:
'
' Alter(s):
'
'****************************************************************************
Sub SetMousePointer(ByVal mp As Integer)
    screen.MousePointer = mp
End Sub

'
'****************************************************************************
' Function:     OpenDB
'
' Narrative:    Open the database.
'
' Arguements:
'
' Alter(s):     flgDBOpen
'
'****************************************************************************
Sub OpenDB()
        
        Dim X As Integer, syserr%, apperr%              '02
        Dim msg$, def%

    ' Signon has set the db type.  We don't know it yet, but this constant
    '   will tell swim that we want to set our environment to use the same type
    '   as signon specified.
    Call SetSqlType(SqlTypeDefault)

    ' Ready to roll
    X = SqlLogin("", syserr, "", apperr, "", 0)
    
    ' database not opened
    If X <> 0 Then
        ' leave
        Call screenexit("", "")
        
    Else ' everything OK

        flgDBOpen = True
    End If
End Sub

Sub proc_created(ctl As Control, maxidx As Integer)
    maxidx = maxidx + 1
    Call AppCreatedCtl(ctl)
End Sub

'****************************************************************************
' Function:     ScreenExit
'
' Narrative:    Call SWIM sw_screenexit.  This function must be called
'               before the application program exits.  By convention, it
'               at a minimum must be in the form_unload subroutine.
'
'
' Arguements:   exename == name of next application program, or "" if none
'               parms   == any parms to pass to next application
'
' Alter(s):
'
'****************************************************************************
Sub screenexit(exename$, parms$)

    Set vbtApp = Nothing
    'Track Record A-007350
    'DEB moved all cleanup of solScreen object into SWIM screenexit
    Set solScreen = Nothing

    ' Call corresponding SWIM function
    Call sw_screenexit(exename, parms)

    ' the end of the trail
    End

End Sub

'****************************************************************************
' Function:     ScreenInit
'
' Narrative:    Must be the first routine called by application, after all
'               setaddr() calls have been made in Form.Load subroutine.
'               This subroutine will call corresponding screeninit call
'               in SWIM, as well as perform various miscellaneous tasks
'               common to all application programs.
'
' Arguements:
'
' Alter(s):
'
'****************************************************************************
Sub ScreenInit()

        Dim tmpstr$

    If SystemErr() Then Exit Sub

'    Call SuppressInsertCtl(True)
'    Load commun
'    Call SuppressInsertCtl(False)

    ' Call SWIM screeninit
    tmpstr$ = Form1.Caption

    ' Set form location on screen (before screeninit call, which can change it's location)
    LocateForm Form1

' MJM: sw_screeninit now returns an LPDISPATCH
' MJM: Create the SolomonVBTApp for communications with SWIM (this will call RegisterVBTApp)
    Set vbtApp = New SolomonVBTApp
    Set solScreen = sw_screeninit(tmpstr$, vbtApp)

    If SystemErr() Then Exit Sub


    ' Make sure mouse pointer is back to normal
    Call MousePointer(Default)
    
End Sub

'****************************************************************************
' Function:     SetReturnFromLogin
'
' Narrative:    Called when command button is pressed in Database Login
'               Form.  Set global flag indicating action.
'
' Arguements:   Button == caption of button, "Cancel" or "Login"
'
' Return(s):
'
' Alter(s):     flgCancelPressed
'
'****************************************************************************
Sub SetReturnFromLogin(Button As String)

    If Button = "Cancel" Then
        flgCancelPressed = True
    Else
        flgCancelPressed = False
    End If

End Sub

'****************************************************************************
' Function:     ApplInit
'
' Narrative:    Should be called by application form.load before any other
'               SWIM calls are made.  Perform any initialization the
'               application may need here.
'
' Arguements:
'
' Alter(s):
'
'****************************************************************************
Sub ApplInit()
        
    Dim ver$
    Dim serr As Integer
    Dim parm$
    Dim szSolPath As String
       
    'DRK - Hookup the help file for this project
    On Error Resume Next
    szSolPath = GetRegistryString(HKEY_LOCAL_MACHINE, "Software\Solomon Software, Inc.\Solomon IV Tools For Visual Basic", "ParentDirectory", "")
    If Right$(szSolPath, 1) <> "\" Then
        szSolPath = szSolPath + "\"
    End If
    app.HelpFile = szSolPath + "help\" + app.HelpFile
     
    If (IsVB6App()) Then
        ' Tell swim this is VB6.0
        Call Assign_VBversion(VbVersion6)
    End If

    ' Set mouse pointer to hourglass
    MousePointer (HOURGLASS)
    
    ' This needs to be the first swim call in the app.
    ' We pass it a pointer to the ScreenExit2 function so
    ' that swim can shut down the VB properly whenever
    ' a fatal error occurs.  Since the apps can call LoadForm
    ' before applinit, this call needs to be there also.
    Call AddressofScreenExit(AddressOf ScreenExit2)

    ' Set NULL controls for use in applications
    Set CNULL = Form1.Update1
    Set FNULL = new_form
    Set PNULL = Form1.Update1

    Call ChkParentStart
    
    ' Call SWIM counterpart
    Call sw_applinit(Form1, Form1.hwnd, FNULL, PNULL, Command$, PNULL)
    If SystemErr() Then Exit Sub
    ' get first parm
    parm$ = ApplGetParms()

    ' Applic. called by parent
    flgCalledFrom = Val(parm$)
    ' Check if parent application needs fired up
    
    If flgCalledFrom = APPLWAIT_CALLED_APPL Or flgCalledFrom = APPL_CALLED_BY_QM Then
        ' get next parm due to CallApplicWait()
        ' should indicate the Form1.hwnd of the calling program
        parm$ = ApplGetParms()
        CalledByHwnd& = Val(parm$)
        Call SetCalledByHwnd(CalledByHwnd&)
    End If

    
    ' Time to open DB
    OpenDB

    ' this must be first setaddr call of the application
    ' SWIM depends on location of pes for certain error checks
    ' NOTE: must be called after parent is started
    Call SetAddr(NOLEVEL, "bpes", bpes, ByVal 0&, LenB(bpes))
    Call SetAddr(NOLEVEL, "bcuryinfo", bCuryInfo, ByVal 0&, LenB(bCuryInfo))
    
    If SystemErr() Then Exit Sub

    ' Get name of program
    bpes.CurrTitle = Form1.Caption

    ' this must be called after first setaddr for bpes
    If flgCalledFrom = APPL_CALLED_BY_QM Then
        bpes.QMMode = True
    Else
        bpes.QMMode = False
    End If
    
    ' check version number of application for compatibility with SWIMAPI.DLL
    ver$ = ApplicVer()
    If ver$ <> APPLIC_VER Then
        Mess (MSG_SWIM_VERSION)
        Exit Sub
    End If

    ' Make sure SWIM.BAS and APPLIC.DH are compatible
    If APPLIC_VER <> SWIMBAS_VER Then
        Call sw_error("Version number in APPLIC.DH is not the same as the version number in SWIM.BAS", "", "", "")
        Exit Sub
    End If

    ' initialize SWIM overflow value
    Call floatinit(OVERFLOW)

    ' Initialize a NULL date for application
    Call dateinit(NULLDATE)
    
    If SystemErr() Then
        Exit Sub
        ' Make sure that update control is on form (after exit sub because only compile checking is needed)
        Form1.Update1.Tag = ""
    End If

    ' Initialize misc applic globals
    NL$ = Chr$(13) + Chr$(10)
    PRMSEP = Chr$(9)

End Sub

Public Sub LoadForm(Frm As Form)
    ' This needs to be the first swim call in the app.
    ' We pass it a pointer to the ScreenExit2 function so
    ' that swim can shut down the VB properly whenever
    ' a fatal error occurs.  Since the apps can call LoadForm
    ' before applinit, this call needs to be here also.
    Call AddressofScreenExit(AddressOf ScreenExit2)

    Call LoadFormEx(Frm, Frm.hwnd)  ' TLATER: We can probably eliminate this by calling GetProperty (which needs to be coded)for hwnd property.
    
End Sub

Sub ScreenExit2()
    Unload Form1
End Sub


'Begin DRK - Add Registry functions to support help system

'****************************************************************************
' Function:     GetRegistryLong
'
' Narrative:    Get a long value anywhere in the registry
'               Returns the long value
'
' Arguements:   pKey - The Key to be opened
'               pKeyName - A null-terminated string specifying the subkey to query
'               pValueName - The key value name to use
'               pDefault - default long to return if no long is found
'
'****************************************************************************
Public Function GetRegistryLong(ByVal pKey As HKEY, pKeyName As String, pValueName As String, pDefault As Long) As Long
  
Dim llRetVal As Long
Dim lhOurKey As Long
Dim pValue As Variant

  
  GetRegistryLong = pDefault
  
  llRetVal = RegOpenKey(pKey, pKeyName, KEY_READ, lhOurKey)
  If (llRetVal = ERROR_SUCCESS) Then llRetVal = RegQueryValue(lhOurKey, pValueName, pValue)
  If (llRetVal = ERROR_SUCCESS) Then
    ' KLUDGE - This is an implicit assumption about the type of data returned
    ' Need to clarify how RegQueryValue works under these circumstances
    GetRegistryLong = pValue
  End If
  
End Function

'****************************************************************************
' Function:     GetRegistryString$
'
' Narrative:    Get a string value anywhere in the registry
'               Returns the string value
'
' Arguements:   pKey - The Key to be opened
'               pKeyName - A null-terminated string specifying the subkey to query
'               pValueName - The key value name to use
'               pDefault - default string to return if no string is found
'
'****************************************************************************
Public Function GetRegistryString$(ByVal pKey As HKEY, pKeyName As String, pValueName As String, pDefault As String)
  
Dim llRetVal As Long
Dim lhOurKey As Long
Dim pValue As Variant

  
  GetRegistryString$ = pDefault
  
  llRetVal = RegOpenKey(pKey, pKeyName, KEY_READ, lhOurKey)
  If (llRetVal = ERROR_SUCCESS) Then llRetVal = RegQueryValue(lhOurKey, pValueName, pValue)
  If (llRetVal = ERROR_SUCCESS) Then GetRegistryString$ = pValue
  
End Function

'****************************************************************************
' Function:     PutRegistryLong
'
' Narrative:    Store a long value anywhere in the registry
'               Returns usual Windows error codes
'                   =0 (ERROR_SUCCESS) is OK
'                   <>0 is a failure
'
' Arguements:   pKey - The Key to be opened
'               pKeyName - A null-terminated string specifying the subkey to query
'               pValueName - The key value name to use
'               pLongValue - A long to place in the key/subkey/value
'
'****************************************************************************
Public Function PutRegistryLong(ByVal pKey As HKEY, pKeyName As String, pValueName As String, pLongValue As Long) As Long

Dim llRetVal As Long
Dim lhOurKey As Long


  ' Construct new keys as necessary
  llRetVal = RegCreateKey(pKey, pKeyName, lhOurKey)
  
    ' Insert our value
  If (llRetVal = ERROR_SUCCESS) Then llRetVal = RegSetValue(lhOurKey, pValueName, REG_DWORD, pLongValue)
  
  ' Close the key. This will cause Windows to flush it, but not immediately
  If (llRetVal = ERROR_SUCCESS) Then llRetVal = RegCloseKey(lhOurKey)
  PutRegistryLong = llRetVal
End Function

'****************************************************************************
' Function:     PutRegistryString
'
' Narrative:    Store a string value anywhere in the registry
'               Returns usual Windows error codes
'                   =0 (ERROR_SUCCESS) is OK
'                   <>0 is a failure
'
' Arguements:   pKey - The Key to be opened
'               pKeyName - A null-terminated string specifying the subkey to query
'               pValueName - The key value name to use
'               pStringValue - Value to place in the key/subkey/value
'
'****************************************************************************
Public Function PutRegistryString(ByVal pKey As HKEY, pKeyName As String, pValueName As String, pStringValue As String) As Long

Dim llRetVal As Long
Dim lhOurKey As Long


  ' Construct new keys as necessary
  llRetVal = RegCreateKey(pKey, pKeyName, lhOurKey)
  
    ' Insert our value
  If (llRetVal = ERROR_SUCCESS) Then llRetVal = RegSetValue(lhOurKey, pValueName, REG_SZ, pStringValue$)
  
  ' Close the key. This will cause Windows to flush it, but not immediately
  If (llRetVal = ERROR_SUCCESS) Then llRetVal = RegCloseKey(lhOurKey)
  PutRegistryString = llRetVal
End Function

'****************************************************************************
' Function:     RegOpenKey
'
' Narrative:    Wrapper function for RegOpenKeyExA
'
'
' Arguements:   phKey - A Key to open.
'               lpSubKey - A null-terminated string specifying the subkey to query
'               pSAM - Specifies an access mask that describes the desired security access for the new key.
'               phkResult - A variable that receives a handle to the opened key. .
'
'****************************************************************************
Private Function RegOpenKey(ByVal phKey As Long, lpSubKey As String, ByVal pSAM As KEY, phkResult As Long) As Long

Dim lReserved As Long
 
  RegOpenKey = RegOpenKeyExA(phKey, ByVal lpSubKey, lReserved, pSAM, phkResult)
  
End Function

'****************************************************************************
' Function:     RegQueryValue
'
' Narrative:    Wrapper function for RegQueryValueExA
'
'
' Arguements:   phKey - Identifies an open key. The key opened or created by RegCreateKey (lpszSubKey)
'                       is a subkey of hkey. This value should not be NULL
'               lpSubKey - A null-terminated string specifying the subkey to query
'               phkResult - Variant value of key/subkey.
'
'****************************************************************************
Private Function RegQueryValue(ByVal phKey As Long, pSubKey As String, pValue As Variant) As Long
  
Dim lRetVal As Long
Dim lpReserved As Long
Dim lpType As Long
Dim lpData As String
Dim lpcbValue As Long


  lpReserved = 0
  lpcbValue = REG_BUFFER_SIZE
  lpData = String$(lpcbValue, Chr$(0))
  
  ' We can only use RegQueryValueEx if we used RegOpenKeyEx to open it
  lRetVal = RegQueryValueExA(phKey, ByVal pSubKey, lpReserved, lpType, ByVal lpData, lpcbValue)

  If lRetVal = ERROR_SUCCESS Then
    MakeRegistryBufferIntoVB lpData, lpcbValue, lpType, pValue
  End If
  
  RegQueryValue = lRetVal
  
End Function

'****************************************************************************
' Function:     RegCreateKey
'
' Narrative:    Wrapper function for RegCreateKeyA
'
'
' Arguements:   phKey - Identifies an open key. The key opened or created by RegCreateKey (lpszSubKey)
'                       is a subkey of hkey. This value should not be NULL
'               lpSubKey - A null-terminated string specifying the subkey to open or create
'               phkResult - The handle of the key that is opened or created.
'
'****************************************************************************
Private Function RegCreateKey(ByVal phKey As Long, lpSubKey As String, phkResult As Long) As Long

  RegCreateKey = RegCreateKeyA(phKey, ByVal lpSubKey, phkResult)
  
End Function

'****************************************************************************
' Function:     RegSetValue
'
' Narrative:    Wrapper function for RegSetValueExA
'
'
' Arguements:   phKey - Specifies the handle of the open key (which can be HKEY_CLASSES_ROOT).
'                       This value should not be NULL.
'               pSubKey - A null-terminated string specifying the subkey of phkey with which a
'                         text string is associated. If lpszSubKey is NULL or points to an
'                         empty string, RegSetValue sets the value of hkey.
'               pType   - Specifies the data type.
'               pData   - data to be stored
'
'
'****************************************************************************
Private Function RegSetValue(ByVal phKey As Long, pSubKey As String, ByVal pType As Long, ByVal pData As Variant) As Long

Dim lBuffer As String
Dim lBufferLen As Long
Dim lReserved As Long


  MakeVBIntoRegistryBuffer pData, pType, lBuffer, lBufferLen

  lReserved = 0
  RegSetValue = RegSetValueExA(phKey, ByVal pSubKey, lReserved, pType, ByVal lBuffer, lBufferLen)
  
End Function


'****************************************************************************
' Function:     MakeRegistryBufferIntoVB
'
' Narrative:    Reformat the Registry pBuffer data type into something more VB friendly
'               Values are returned in pValue & pBuffer will be unchanged.
'               pBufferLen is the size of the buffer, and for strings it wil include the
'               terminating nulls (this is different from how Windows returns the value names)
'
'
' Arguements:   pBuffer = String buffer to be converted to a variant
'               pBufferLen  = Length of string buffer to convert to a variant
'               pType = Variant type to return
'               pValue = Returned string buffer value converted to variant
'
'
'****************************************************************************
Private Sub MakeRegistryBufferIntoVB(pBuffer As String, ByVal pBufferLen As Long, ByVal pType As REG, pValue As Variant)

Dim lHack As Long

Dim lLongValue As Long
Dim lStringValue As String
Dim llLength As Long


    ' We put this in a variable, not a constant, because of problems with VB
    ' Constants are implicitly typed as integers, and that would cause an overflow in this case
    lHack = &H100
    lLongValue = 0
    pValue = 0

    
    Select Case pType
    
        Case REG_BINARY
        
        Case REG_DWORD, REG_DWORD_LITTLE_ENDIAN
          lLongValue = (&H1000000 * (Asc(Mid$(pBuffer, 4, 1)) Mod &H80)) _
            + (&H10000 * Asc(Mid$(pBuffer, 3, 1))) _
            + (lHack * Asc(Mid$(pBuffer, 2, 1))) _
            + (&H1 * Asc(Mid$(pBuffer, 1, 1)))
          If ((Asc(Mid$(pBuffer, 4, 1)) And &H80) <> 0) Then lLongValue = -(lLongValue Xor &H7FFFFFFF)
          pValue = lLongValue
          
        Case REG_DWORD_BIG_ENDIAN
          lLongValue = (&H1000000 * (Asc(Mid$(pBuffer, 1, 1)) Mod &H80)) _
            + (&H10000 * Asc(Mid$(pBuffer, 2, 1))) _
            + (lHack * Asc(Mid$(pBuffer, 3, 1))) _
            + (&H1 * Asc(Mid$(pBuffer, 4, 1)))
          If ((Asc(Mid$(pBuffer, 1, 1)) And &H80) <> 0) Then lLongValue = -(lLongValue Xor &H7FFFFFFF)
          pValue = lLongValue
        
        Case REG_LINK
        
        Case REG_MULTI_SZ
          ' We probably want to return these as an array of strings, now that VB4 Variants support arrays of strings
          lStringValue = Left$(pBuffer, InStr(pBuffer, Chr$(0) & Chr$(0)) - 1)
          pValue = lStringValue
        
        Case REG_RESOURCE_LIST
        
        Case REG_SZ
          ' pBufferLen is the buffer length, not the string length (i.e. it includes the terminating null)
          lStringValue = Left$(pBuffer, pBufferLen - 1)
          pValue = lStringValue
          
        Case REG_EXPAND_SZ
          lStringValue = String$(REG_BUFFER_SIZE, Chr$(0))
          llLength = ExpandEnvironmentStrings(ByVal pBuffer, ByVal lStringValue, REG_BUFFER_SIZE)
          pValue = Left$(lStringValue, llLength)
        
        Case Else ' REG_NONE
        
    End Select
    
End Sub

'****************************************************************************
' Function:     MakeVBIntoRegistryBuffer
'
' Narrative:    Reformat a VB variant into a buffer for use with the Registry.
'               Values are returned in pValue & pBuffer will be unchanged.
'
'
' Arguements:   pValue = Incoming variant value to be converted to a string
'               pType  = Variant type of pValue
'               pBuffer  = String buffer to hold the variant value
'               pBufferLen  = Length of the string buffer used to hold the variant value
'
'
'****************************************************************************
Private Sub MakeVBIntoRegistryBuffer(pValue As Variant, pType As REG, pBuffer As String, pBufferLen As Long)

  ' Sort out the type of data
  If (pType = REG_NONE) Then
  
    Select Case VarType(pValue)
    
        Case vbInteger, vbLong, vbByte, vbBoolean
            pType = REG_DWORD
            
        Case vbString
            pType = REG_SZ
            
        Case Else ' Default to a string representation for the moment - maybe should be binary if we work out how to manipulate them
            pType = REG_SZ
            
    End Select
    
  End If
    
  
  Select Case pType
  
    Case REG_DWORD, REG_DWORD_LITTLE_ENDIAN
      pBuffer = Chr$((CLng(pValue)) And &HFF) _
        & Chr$((CLng(pValue) \ &H100) And &HFF) _
        & Chr$((CLng(pValue) \ &H10000) And &HFF) _
        & Chr$((CLng(pValue) \ &H1000000) And &HFF)
      pBufferLen = 4
    
    Case REG_DWORD_BIG_ENDIAN
      pBuffer = Chr$((CLng(pValue) \ &H1000000) And &HFF) _
        & Chr$((CLng(pValue) \ &H10000) And &HFF) _
        & Chr$((CLng(pValue) \ &H100) And &HFF) _
        & Chr$((CLng(pValue)) And &HFF)
      pBufferLen = 4
 
    Case REG_SZ, REG_EXPAND_SZ
    
      Select Case VarType(pValue)
      
        Case vbString
          pBuffer = pValue & Chr$(0)
          
        Case Else
          pBuffer = Format$(pValue) & Chr$(0)
          
      End Select
    
      pBufferLen = Len(pBuffer)
    
    Case Else
    ' Fail - we don't recognize this type
    Error -1
    
  End Select
  
End Sub

'End DRK - Add Registry functions to support help system
'****************************************************************************
' Function:     IsVB6App
'
' Narrative:    Returns a True if the application was compiled using VB6.0
'
'
' Arguments:   None
'
'
'****************************************************************************
Private Function IsVB6App() As Boolean

    Dim s As String
    Dim X As Object

    On Error GoTo VB5App:

    ' have to use late-binding or you'll get compile error under VB 5.0
    Set X = app
    s = X.RetainedProject       ' this should fail if it is a VB 5.0 app

    IsVB6App = True
    Exit Function
    
VB5App:
    IsVB6App = False

End Function

