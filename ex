Sub GenerateStudentSubjects()
    Dim wsStudents As Worksheet, wsSubjects As Worksheet, wsOutput As Worksheet
    Dim student As Range
    Dim lastStudentRow As Long, lastSubjectRow As Long
    Dim outputRow As Long
    
    ' Define worksheets
    Set wsStudents = ThisWorkbook.Sheets("Students") ' Change if needed
    Set wsSubjects = ThisWorkbook.Sheets("Subjects") ' Change if needed
    
    ' Create or clear output sheet
    On Error Resume Next
    Set wsOutput = ThisWorkbook.Sheets("Student_Subjects")
    If wsOutput Is Nothing Then
        Set wsOutput = ThisWorkbook.Sheets.Add
        wsOutput.Name = "Student_Subjects"
    Else
        wsOutput.Cells.Clear
    End If
    On Error GoTo 0
    
    ' Headers
    wsOutput.Cells(1, 1).Value = "StudentId"
    wsOutput.Cells(1, 2).Value = "Subject"

    outputRow = 2

    ' Get last row of students
    lastStudentRow = wsStudents.Cells(Rows.Count, 1).End(xlUp).Row

    ' Loop through each student
    For Each student In wsStudents.Range("A2:A" & lastStudentRow)
        ' Add Tamil subject
        wsOutput.Cells(outputRow, 1).Value = student.Value
        wsOutput.Cells(outputRow, 2).Value = wsSubjects.Cells(2, 1).Value ' Tamil
        outputRow = outputRow + 1
        
        ' Add English subject
        wsOutput.Cells(outputRow, 1).Value = student.Value
        wsOutput.Cells(outputRow, 2).Value = wsSubjects.Cells(2, 2).Value ' English
        outputRow = outputRow + 1
    Next student

    MsgBox "Student-Subject sheet created!", vbInformation
End Sub