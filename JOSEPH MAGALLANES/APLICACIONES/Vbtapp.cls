VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "SolomonVBTApp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'local variable(s) to hold property value(s)
Private m_nextFormIndex As Integer
Private m_loadedForms() As Form
Private m_HelpFileStore As String


Private Sub AddLoadedForm(newForm As Form)
'*****************************************************************************
'* Function:     AddLoadedForm
'*
'* Author:       Mike Morel
'*
'* Created:      3-97
'*
'* Narrative:
'*
'* Parameters:   None
'*
'* Return(s):
'*
'* Preconditions: None
'*
'* Globals:       None
'*
'* Notes:         None
'*
'*****************************************************************************
        Dim i As Integer
        
    ReDim Preserve m_loadedForms(m_nextFormIndex) As Form
    m_nextFormIndex = m_nextFormIndex + 1
    i = UBound(m_loadedForms)     ' last element
    Set m_loadedForms(i) = newForm
    
End Sub


Public Function CreateControl(className As String, ByRef hwnd As Long, ByVal FormToPlaceCtrl As Object) As Object
'*****************************************************************************
'* Function:     CreateControl
'*
'* Author:       Mike Morel
'*
'* Created:      3-97
'*
'* Narrative:    Create new instance of SAFContainer, or new form.
'*
'* Parameters:
'*               className        literal class name of control we'll eventually place
'*                                in the new instance of SAFContainer.  Not really
'*                                used here except to tell if we have a form or not
'*
'*               hWnd             If we're create a Form, use this to pass back its hwnd
'*
'*               FormToPlaceCtrl  If creating control (not a form), the caller MUST
'*                                specify which form to create the control on. That
'*                                is passed in here.
'*
'* Return(s):    object reference to new control or form
'*
'* Preconditions: None
'*
'* Globals:       None
'*
'* Notes:         None
'*
'*****************************************************************************
        Dim ndx As Integer
        Dim formvar As Form
        Dim ctrl As Object
        
    On Error Resume Next
        
    Set CreateControl = Nothing
    
    Select Case LCase(className)
        Case "vb.form"
            ' create and load new form
            
            ' YOU MUST HAVE NEW_FORM.FRM IN THIS PROJECT
            Set formvar = New new_form
            
            If formvar Is Nothing Then Exit Function
            
            ' need to load now
            Load formvar
            
            ' put new form in local array
            AddLoadedForm formvar
            
            ' return it
            hwnd = formvar.hwnd
            Set CreateControl = formvar
            Exit Function
            
        Case "saftools.safframe"
            Set ctrl = FormToPlaceCtrl.Controls("SAFNewFrame")
            If ctrl Is Nothing Then Exit Function
            
            ndx = Val(ctrl(0).Tag) + 1
            ctrl(0).Tag = Str(ndx)
            
            Load ctrl(ndx)
            
            hwnd = 0&
            Set CreateControl = ctrl(ndx)
            Exit Function
            
        Case "tabdlg.sstab.1"
            Set ctrl = FormToPlaceCtrl.Controls("SAFNewTab")
            If ctrl Is Nothing Then Exit Function
            
            ndx = Val(ctrl(0).Tag) + 1
            ctrl(0).Tag = Str(ndx)
            
            Load ctrl(ndx)
            
            hwnd = 0&
            Set CreateControl = ctrl(ndx)
            Exit Function
            
        Case Else
        
            ' locate container on specified form
            Set ctrl = FormToPlaceCtrl.Controls("SAFContainer1")
            If ctrl Is Nothing Then Exit Function
            
            ' Use Tag of first element to contain counter.  Get next value
            ' and increment, and save it.  Note this will fail if the
            ' SAFContainer does not have index property specified
            ndx = Val(ctrl(0).Tag) + 1
            ctrl(0).Tag = Str(ndx)
            
            ' make sure we can't see the SAFContainer
            If ctrl(0).Visible = True Then
                ctrl(0).Visible = False
            End If
        
            ' create new container
            Load ctrl(ndx)
            
            ' return it
            hwnd = 0&
            Set CreateControl = ctrl(ndx)
            Exit Function
            
    End Select
    
End Function


Public Function UnloadForm(lpdForm As Object) As Boolean
'*****************************************************************************
'* Function:     UnloadForm
'*
'* Author:       Dave Busch
'*
'* Created:      3-97
'*
'* Narrative:    Unload form passed into the method.
'*
'* Parameters:   None
'*
'* Return(s):    FALSE if nothing unloaded
'*               TRUE if form was unloaded
'*
'* Preconditions: None
'*
'* Globals:       None
'*
'* Notes:         None
'*
'*****************************************************************************
    If lpdForm Is Nothing Then
        UnloadForm = False
    Else
        Unload lpdForm
        UnloadForm = True
    End If
    
End Function


Private Sub Class_Initialize()
    m_HelpFileStore = App.HelpFile
End Sub

Private Sub Class_Terminate()
'*****************************************************************************
'* Function:     Class_Terminate
'*
'* Author:       Mike Morel
'*
'* Created:      3-97
'*
'* Narrative:    Called when class is terminated.
'*
'* Parameters:   None
'*
'* Return(s):    None
'*
'* Preconditions: None
'*
'* Globals:       None
'*
'* Notes:         None
'*
'*****************************************************************************
    
    ' Unload form that was created using CreateControl (and therefore
    ' added to the m_loadedForms array)
    Dim theForm As Form
    Dim i As Integer
    
    For i = 0 To m_nextFormIndex - 1
        Set theForm = m_loadedForms(i)
        Unload theForm
    Next
    
End Sub

Public Sub DeleteControl(ByVal CtrlToDelete As Object)
'*****************************************************************************
'* Function:     DeleteControl
'*
'* Author:       Dave Busch
'*
'* Created:      1-15-98
'*
'* Narrative:    Delete specified instance of SAFContainer.
'*
'* Parameters:
'*               CtrlToDelete  IDispatch of control to delete
'*
'* Return(s):     None
'*
'* Preconditions: None
'*
'* Globals:       None
'*
'* Notes:         None
'*
'*****************************************************************************
    On Error Resume Next
        
    ' create new container
    Unload CtrlToDelete
   
End Sub

Public Sub ChangeHelpFile(ByVal NewHelpFile As String)
'*****************************************************************************
'* Function:     ChangeHelpFile
'*
'* Author:       Chuck Weininger
'*
'* Created:      9/8/98
'*
'* Narrative:    Sets the application's helpfile to the one specified
'*               in the NewHelpFile parm.  The original helpfile is
'*               stored in m_HelpFileStore in the Class_Initialize function.
'*
'* Parameters:
'*               NewHelpFile  string containing name of new helpfile.
'*
'* Return(s):     None
'*
'* Preconditions: None
'*
'* Globals:       None
'*
'* Notes:         None
'*
'*****************************************************************************
    App.HelpFile = NewHelpFile
End Sub

Public Sub RestoreHelpFile()
'*****************************************************************************
'* Function:     RestoreHelpFile
'*
'* Author:       Chuck Weininger
'*
'* Created:      9/8/98
'*
'* Narrative:    Restores the application's helpfile to the one stored
'*               in the m_HelpFileStore variable.  This variable is initialized
'*               in the Class_Initialize function.
'*
'* Parameters:    None
'*
'* Return(s):     None
'*
'* Preconditions: None
'*
'* Globals:       m_HelpFileStore is used to restore the helpfile name.
'*
'* Notes:         None
'*
'*****************************************************************************
    
    App.HelpFile = m_HelpFileStore
    
End Sub

Public Sub DisplayForm(lpdForm As Object)
    lpdForm.Show
End Sub

Public Sub HideForm(lpdForm As Object)
    lpdForm.Hide
End Sub

