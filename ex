Sub GenerateStudentSubjects()
    Dim wsStudents As Worksheet, wsSubjects As Worksheet, wsOutput As Worksheet
    Dim student As Range, subject As Range
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
    wsOutput.Cells(1, 3).Value = "Result"

    outputRow = 2

    ' Get last row of students
    lastStudentRow = wsStudents.Cells(Rows.Count, 1).End(xlUp).Row
    
    ' Get last row of subjects
    lastSubjectRow = wsSubjects.Cells(Rows.Count, 1).End(xlUp).Row

    ' Loop through each student
    For Each student In wsStudents.Range("A2:A" & lastStudentRow)
        ' Loop through each subject
        For Each subject In wsSubjects.Range("A2:A" & lastSubjectRow)
            wsOutput.Cells(outputRow, 1).Value = student.Value
            wsOutput.Cells(outputRow, 2).Value = subject.Value
            wsOutput.Cells(outputRow, 3).Value = subject.Offset(0, 1).Value ' Result column
            outputRow = outputRow + 1
        Next subject
    Next student

    MsgBox "Student-Subject sheet created with results!", vbInformation
End Sub