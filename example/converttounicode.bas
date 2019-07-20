Attribute VB_Name = "Module1"
Option Explicit

Public Function ConvertToUnicode(ByRef Target As Range) As String

    Dim topLeftValue As String

    Dim objRequest As Object
    Dim strUrl As String
    Dim blnAsync As Boolean
    Dim strResponse As String

    topLeftValue = Target.Cells(1, 1).Value
    strUrl = "http://localhost:1337/?bangla=" & URLEncode(topLeftValue)
    
    Set objRequest = CreateObject("MSXML2.XMLHTTP")
    blnAsync = True
    
    With objRequest
        .Open "GET", strUrl, blnAsync
        .SetRequestHeader "Content-Type", "text/plain; charset=utf-8"
        .send
        'spin wheels whilst waiting for response
        While objRequest.readyState <> 4
            DoEvents
        Wend
        strResponse = .responseText
    End With

    ConvertToUnicode = strResponse

End Function

Public Function URLEncode( _
   ByVal StringVal As String, _
   Optional SpaceAsPlus As Boolean = False _
) As String
  Dim bytes() As Byte, b As Byte, i As Integer, space As String

  If SpaceAsPlus Then space = "+" Else space = "%20"

  If Len(StringVal) > 0 Then
    With New ADODB.Stream
      .Mode = adModeReadWrite
      .Type = adTypeText
      .Charset = "UTF-8"
      .Open
      .WriteText StringVal
      .Position = 0
      .Type = adTypeBinary
      .Position = 3 ' skip BOM
      bytes = .Read
    End With

    ReDim result(UBound(bytes)) As String

    For i = UBound(bytes) To 0 Step -1
      b = bytes(i)
      Select Case b
        Case 97 To 122, 65 To 90, 48 To 57, 45, 46, 95, 126
          result(i) = Chr(b)
        Case 32
          result(i) = space
        Case 0 To 15
          result(i) = "%0" & Hex(b)
        Case Else
          result(i) = "%" & Hex(b)
      End Select
    Next i

    URLEncode = Join(result, "")
  End If
End Function

