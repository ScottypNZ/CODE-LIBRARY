
VBA FUZZY LOGIC
=====================

### INDEX

 * [LEVENSHTEIN_PLUS](#LEVENSHTEIN-PLUS)
 * [LEVENSHTEIN_PERCENT](#LEVENSHTEIN-PERCENT)
 * [LEVENSHTEIN](#LEVENSHTEIN)
 * [JACCARD](#JACCARD)
 * [HAMMING](#HAMMING)
 * [DAMERAU](#DAMERAU)
 * [FUZZY FIND](#FUZZY-FIND)
 * [FUZZY MATCH MULTI STAGE](#FUZZY-MATCH-MULTI-STAGE)
 * [SIMILARITY FUZZY](#SIMILARITY-FUZZY)
 
-------------------------
###   LEVENSHTEIN_PLUS

```VBA
Option Explicit

Public Function LEVENSHTEIN(String1 As String, String2 As String) As Long

    '@Description: This function takes two strings of any length and calculates the Levenshtein Distance between them. Levenshtein Distance measures how close two strings are by checking how many Insertions, Deletions, or Substitutions are needed to turn one string into the other. Lower numbers mean the strings are closer than high numbers. Unlike Hamming Distance, Levenshtein Distance works for strings of any length and includes 2 more operations. However, calculation time will be slower than Hamming Distance for same length strings, so if you know the two strings are the same length, its preferred to use Hamming Distance.
    '@URL: https://x-vba.com/xplus/string-metrics.html#LEVENSHTEIN
    '@License: MIT
    '@Param: string1 is the first string
    '@Param: string2 is the second string that will be compared to the first string
    '@Returns: Returns an integer of the Levenshtein Distance between two string
    '@Example: =LEVENSHTEIN("Cat", "Bat") -> 1; Since all that is needed is 1 change (changing the "B" in Bat to "C")
    '@Example: =LEVENSHTEIN("Cat", "Ca") -> 1; Since only one Insertion needs to occur (adding a "t" at the end)
    '@Example: =LEVENSHTEIN("Cat", "Cta") -> 2; Since the "t" in "Cta" needs to be substituted into an "a", and the final character "a" needs to be substituted into a "t"

    ' **Error Checking**
    ' Quick returns for common errors
    If String1 = String2 Then
        LEVENSHTEIN = 0
        Exit Function
    ElseIf String1 = Empty Then
        LEVENSHTEIN = Len(String2)
        Exit Function
    ElseIf String2 = Empty Then
        LEVENSHTEIN = Len(String1)
        Exit Function
    End If
    

    ' **Algorithm Code**
    ' Creating the distance metrix and filling it with values
    Dim numberOfRows As Integer
    Dim numberOfColumns As Integer
    
    numberOfRows = Len(String1)
    numberOfColumns = Len(String2)
    
    Dim distanceArray() As Integer
    ReDim distanceArray(numberOfRows, numberOfColumns)
    
    Dim r As Integer
    Dim c As Integer
    
    For r = 0 To numberOfRows
        For c = 0 To numberOfColumns
            distanceArray(r, c) = 0
        Next
    Next
    
    For r = 1 To numberOfRows
        distanceArray(r, 0) = r
    Next
    
    For c = 1 To numberOfColumns
        distanceArray(0, c) = c
    Next
    
    ' Non-recursive Levenshtein Distance matrix walk
    Dim operationCost As Integer
    
    For c = 1 To numberOfColumns
        For r = 1 To numberOfRows
            If Mid(String1, r, 1) = Mid(String2, c, 1) Then
                operationCost = 0
            Else
                operationCost = 1
            End If
                                                           
            distanceArray(r, c) = WorksheetFunction.Min(distanceArray(r - 1, c) + 1, distanceArray(r, c - 1) + 1, distanceArray(r - 1, c - 1) + operationCost)
        Next
    Next
    
    LEVENSHTEIN = distanceArray(numberOfRows, numberOfColumns)

End Function

```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

###   LEVENSHTEIN_PERCENT
```VBA
Option Explicit

Function DTVLookup(TheValue As Variant, TheRange As Range, TheColumn As Long, Optional PercentageMatch As Double = 100) As Variant
If TheColumn < 1 Then
    DTVLookup = CVErr(xlErrValue)
    Exit Function
End If
If TheColumn > TheRange.Columns.Count Then
    DTVLookup = CVErr(xlErrRef)
    Exit Function
End If
Dim c As Range
For Each c In TheRange.Columns(1).Cells
    If UCase(TheValue) = UCase(c) Then
        DTVLookup = c.Offset(0, TheColumn - 1)
        Exit Function
    ElseIf PercentageMatch <> 100 Then
        If Levenshtein3(UCase(TheValue), UCase(c)) >= PercentageMatch Then
            DTVLookup = c.Offset(0, TheColumn - 1)
            Exit Function
        End If
    End If
Next c
DTVLookup = CVErr(xlErrNA)
End Function

Function Levenshtein3(ByVal String1 As String, ByVal String2 As String) As Long

Dim I As Long, j As Long, string1_length As Long, string2_length As Long
Dim distance(0 To 60, 0 To 50) As Long, smStr1(1 To 60) As Long, smStr2(1 To 50) As Long
Dim min1 As Long, min2 As Long, min3 As Long, minmin As Long, MaxL As Long

string1_length = Len(String1):  string2_length = Len(String2)

distance(0, 0) = 0
For I = 1 To string1_length:    distance(I, 0) = I: smStr1(I) = Asc(LCase(Mid$(String1, I, 1))): Next
For j = 1 To string2_length:    distance(0, j) = j: smStr2(j) = Asc(LCase(Mid$(String2, j, 1))): Next
For I = 1 To string1_length
    For j = 1 To string2_length
        If smStr1(I) = smStr2(j) Then
            distance(I, j) = distance(I - 1, j - 1)
        Else
            min1 = distance(I - 1, j) + 1
            min2 = distance(I, j - 1) + 1
            min3 = distance(I - 1, j - 1) + 1
            If min2 < min1 Then
                If min2 < min3 Then minmin = min2 Else minmin = min3
            Else
                If min1 < min3 Then minmin = min1 Else minmin = min3
            End If
            distance(I, j) = minmin
        End If
    Next
Next

' Levenshtein3 will properly return a percent match (100%=exact) based on similarities and Lengths etc...
MaxL = string1_length: If string2_length > MaxL Then MaxL = string2_length
Levenshtein3 = 100 - CLng((distance(string1_length, string2_length) * 100) / MaxL)

End Function

```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

###   LEVENSHTEIN

```VBA
Option Explicit

Function LEVENSHTEIN1(a As String, b As String) As Integer
 
    Dim I As Integer
    Dim j As Integer
    Dim cost As Integer
    Dim d() As Integer
    Dim min1 As Integer
    Dim min2 As Integer
    Dim min3 As Integer
 
    If Len(a) = 0 Then
        LEVENSHTEIN = Len(b)
        Exit Function
    End If
 
    If Len(b) = 0 Then
        LEVENSHTEIN = Len(a)
        Exit Function
    End If
 
    ReDim d(Len(a), Len(b))
 
    For I = 0 To Len(a)
        d(I, 0) = I
    Next
 
    For j = 0 To Len(b)
        d(0, j) = j
    Next
 
    For I = 1 To Len(a)
        For j = 1 To Len(b)
            If Mid(a, I, 1) = Mid(b, j, 1) Then
                cost = 0
            Else
                cost = 1
            End If
            min1 = (d(I - 1, j) + 1)
            min2 = (d(I, j - 1) + 1)
            min3 = (d(I - 1, j - 1) + cost)
            d(I, j) = Application.WorksheetFunction.Min(min1, min2, min3)
        Next
    Next
 
    LEVENSHTEIN = d(Len(a), Len(b))
 
End Function

```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

###   JACCARD

```VBA
Function Similar(Val1 As String, Val2 As String) As Double


    Dim V1Arr As Variant
    Dim V2Arr As Variant
    Dim I As Long
    Dim a As Long, b As Long


    V1Arr = Split(Val1, " ")
    V2Arr = Split(Val2, " ")


    For I = LBound(V1Arr) To UBound(V1Arr)
        If InStr(Val2, V1Arr(I)) > 0 Then
            a = a + 1
        Else
            b = b + 1
        End If
    Next I


    For I = LBound(V2Arr) To UBound(V2Arr)
        If InStr(Val1, V2Arr(I)) = 0 Then b = b + 1
    Next I


    Similar = a / (a + b)


End Function

```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

###  HAMMING 

```VBA
Option Explicit

Public Function HAMMING( _
    String1 As String, _
    String2 As String) _
As Integer

    '@Description: This function takes two strings of the same length and calculates the Hamming Distance between them. Hamming Distance measures how close two strings are by checking how many Substitutions are needed to turn one string into the other. Lower numbers mean the strings are closer than high numbers.
    '@URL: https://x-vba.com/xplus/string-metrics.html#HAMMING
    '@License: MIT
    '@Param: string1 is the first string
    '@Param: string2 is the second string that will be compared to the first string
    '@Returns: Returns an integer of the Hamming Distance between two string
    '@Example: =HAMMING("Cat", "Bat") -> 1; Since all that is needed is 1 change (changing the "B" in Bat to "C")
    '@Example: =HAMMING("Cat", "Bag") -> 2; 2 changes are needed, changing the "B" to "C" and the "g" to "t"
    '@Example: =HAMMING("Cat", "Dog") -> 3; Every single character needs to be substituted in this case

    If Len(String1) <> Len(String2) Then
        HAMMING = CVErr(xlErrValue)
    End If
    
    Dim totalDistance As Integer
    totalDistance = 0
    
    Dim I As Integer
    
    For I = 1 To Len(String1)
        If Mid(String1, I, 1) <> Mid(String2, I, 1) Then
            totalDistance = totalDistance + 1
        End If
    Next
    
    HAMMING = totalDistance
    
End Function
```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

### DAMERAU

```VBA

Option Explicit

Public Function DAMERAU( _
    String1 As String, _
    String2 As String) _
As Integer

    '@Description: This function takes two strings of any length and calculates the Damerau-Levenshtein Distance between them. Damerau-Levenshtein Distance differs from Levenshtein Distance in that it includes an additional operation, called Transpositions, which occurs when two adjacent characters are swapped. Thus, Damerau-Levenshtein Distance calculates the number of Insertions, Deletions, Substitutions, and Transpositons needed to convert string1 into string2. As a result, this function is good when it is likely that spelling errors have occured between two string where the error is simply a transposition of 2 adjacent characters.
    '@URL: https://x-vba.com/xplus/string-metrics.html#DAMERAU
    '@License: MIT
    '@Param: string1 is the first string
    '@Param: string2 is the second string that will be compared to the first string
    '@Returns: Returns an integer of the Damerau-Levenshtein Distance between two string
    '@Example: =DAMERAU("Cat", "Bat") -> 1; Since all that is needed is 1 change (changing the "B" in Bat to "C")
    '@Example: =DAMERAU("Cat", "Ca") -> 1; Since only one Insertion needs to occur (adding a "t" at the end)
    '@Example: =DAMERAU("Cat", "Cta") -> 1; Since the "t" and "a" can be transposed as they are adjacent to each other. Notice how LEVENSHTEIN("Cat","Cta")=2 but DAMERAU("Cat","Cta")=1

    ' **Error Checking**
    ' Quick returns for common errors
    If String1 = String2 Then
        DAMERAU = 0
    ElseIf String1 = Empty Then
        DAMERAU = Len(String2)
    ElseIf String2 = Empty Then
        DAMERAU = Len(String1)
    End If
    
    Dim inf As Long
    Dim da As Object
    inf = Len(String1) + Len(String2)
    Set da = CreateObject("Scripting.Dictionary")
    
    ' 35 - 38 = filling the dictionary
    Dim I As Integer
    For I = 1 To Len(String1)
        If da.exists(Mid(String1, I, 1)) = False Then
            da.Add Mid(String1, I, 1), "0"
        End If
    Next
    
    For I = 1 To Len(String2)
        If da.exists(Mid(String2, I, 1)) = False Then
            da.Add Mid(String2, I, 1), "0"
        End If
    Next
    
    ' 39 = creating h matrix
    Dim H() As Long
    ReDim H(Len(String1) + 1, Len(String2) + 1)
    
    Dim k As Integer
    For I = 0 To (Len(String1) + 1)
        For k = 0 To (Len(String2) + 1)
            H(I, k) = 0
        Next
    Next
    
    ' 40 - 45 = updating the matrix
    For I = 0 To Len(String1)
        H(I + 1, 0) = inf
        H(I + 1, 1) = I
    Next
    For k = 0 To Len(String2)
        H(0, k + 1) = inf
        H(1, k + 1) = k
    Next
    

    ' 46 - 60 = running the array
    Dim db As Long
    Dim i1 As Long
    Dim k1 As Long
    Dim cost As Long
    
    For I = 1 To Len(String1)
        db = 0
        For k = 1 To Len(String2)
            i1 = CInt(da(Mid(String2, k, 1)))
            k1 = db
            cost = 1
            
            If Mid(String1, I, 1) = Mid(String2, k, 1) Then
                cost = 0
                db = k
            End If
            
            H(I + 1, k + 1) = WorksheetFunction.Min(H(I, k) + cost, _
                                                    H(I + 1, k) + 1, _
                                                    H(I, k + 1) + 1, _
                                                    H(i1, k1) + (I - i1 - 1) + 1 + (k - k1 - 1))
                           
            
        Next
        
        If da.exists(Mid(String1, I, 1)) Then
            da.Remove Mid(String1, I, 1)
            da.Add Mid(String1, I, 1), CStr(I)
        Else
            da.Add Mid(String1, I, 1), CStr(I)
        End If
        
    Next

    DAMERAU = H(Len(String1) + 1, Len(String2) + 1)

End Function

```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

### FUZZY FIND  

```VBA
Option Explicit

Function FuzzyFind2(lookup_value As String, tbl_array As Range) As String

Dim I As Integer, str As String, Value As String
Dim a As Integer, b As Integer, cell As Variant
Dim Found As Boolean

b = 0

For Each cell In tbl_array
  str = cell
  I = 1
  Found = True
  Do While Found = True
    Found = False
    If InStr(I, str, lookup_value) > 0 Then
        a = a + 1
        Found = True
        I = InStr(I, str, lookup_value) + 1
    End If
  Loop

  If a > b Then
    b = a
    Value = str
  End If
  a = 0
Next cell
FuzzyFind2 = Value

End Function
```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------


### FUZZY MATCH MULTI STAGE  
```VBA

Option Explicit

Type RankInfo
    Offset As Integer
    PERCENTAGE As Single
End Type

Dim mudRankData() As RankInfo
Dim miBestMatchPtr As Integer

Dim TopMatch         As Integer
Dim strCompare       As String


Function FuzzyPercent(ByVal String1 As String, _
                      ByVal String2 As String, _
                      Optional Algorithm As Integer = 3, _
                      Optional Normalised As Boolean = False) As Single
'*************************************
'** Return a % match on two strings **
'*************************************
Dim intLen1 As Integer, intLen2 As Integer
Dim intCurLen As Integer
Dim intTo As Integer
Dim intPos As Integer
Dim intPtr As Integer
Dim intScore As Integer
Dim intTotScore As Integer
Dim intStartPos As Integer
Dim sngScore As Single
Dim strWork As String

'-------------------------------------------------------
'-- If strings havent been normalised, normalise them --
'-------------------------------------------------------
If Normalised = False Then
    String1 = LCase$(Application.Trim(String1))
    String2 = LCase$(Application.Trim(String2))
End If

'----------------------------------------------
'-- Give 100% match if strings exactly equal --
'----------------------------------------------
If String1 = String2 Then
    FuzzyPercent = 1
    Exit Function
End If

intLen1 = Len(String1)
intLen2 = Len(String2)

If intLen1 = 0 Or intLen2 = 0 Then
    FuzzyPercent = 0
    Exit Function
End If

'----------------------------------------
'-- Give 0% match if string length < 2 --
'----------------------------------------
If intLen1 < 2 Then
    FuzzyPercent = 0
    Exit Function
End If

intTotScore = 0                   'initialise total possible score
intScore = 0                      'initialise current score

'--------------------------------------------------------
'-- If Algorithm = 1 or 3, Search for single characters --
'--------------------------------------------------------
If (Algorithm And 1) <> 0 Then
    If intLen1 < intLen2 Then
        FuzzyAlg1 String1, String2, intScore, intTotScore
    Else
        FuzzyAlg1 String2, String1, intScore, intTotScore
    End If
End If

'-----------------------------------------------------------
'-- If Algorithm = 2 or 3, Search for pairs, triplets etc. --
'-----------------------------------------------------------
If (Algorithm And 2) <> 0 Then
    If intLen1 < intLen2 Then
        FuzzyAlg2 String1, String2, intScore, intTotScore
    Else
        FuzzyAlg2 String2, String1, intScore, intTotScore
    End If
End If

'------------------------------------------------------
'-- If Algorithm = 4,5,6,7, use Dan Ostander's code. --
'------------------------------------------------------
If (Algorithm And 4) <> 0 Then
    If intLen1 < intLen2 Then
        sngScore = FuzzyAlg4(String1, String1)
    Else
        sngScore = FuzzyAlg4(String2, String1)
    End If
    intScore = intScore + (sngScore * 100)
    intTotScore = intTotScore + 100
End If

FuzzyPercent = intScore / intTotScore

End Function

Private Sub FuzzyAlg1(ByVal String1 As String, _
                      ByVal String2 As String, _
                      ByRef Score As Integer, _
                      ByRef TotScore As Integer)
Dim intLen1 As Integer, intPos As Integer, intPtr As Integer, intStartPos As Integer

intLen1 = Len(String1)
TotScore = TotScore + intLen1              'update total possible score
intPos = 0
For intPtr = 1 To intLen1
    intStartPos = intPos + 1
    intPos = InStr(intStartPos, String2, Mid$(String1, intPtr, 1))
    If intPos > 0 Then
        If intPos > intStartPos + 3 Then     'No match if char is > 3 bytes away
            intPos = intStartPos
        Else
            Score = Score + 1          'Update current score
        End If
    Else
        intPos = intStartPos
    End If
Next intPtr
End Sub
Private Sub FuzzyAlg2(ByVal String1 As String, _
                        ByVal String2 As String, _
                        ByRef Score As Integer, _
                        ByRef TotScore As Integer)
Dim intCurLen As Integer, intLen1 As Integer, intTo As Integer, intPtr As Integer, intPos As Integer
Dim strWork As String

intLen1 = Len(String1)
For intCurLen = 1 To intLen1
    strWork = String2                          'Get a copy of String2
    intTo = intLen1 - intCurLen + 1
    TotScore = TotScore + Int(intLen1 / intCurLen)  'Update total possible score
    For intPtr = 1 To intTo Step intCurLen
        intPos = InStr(strWork, Mid$(String1, intPtr, intCurLen))
        If intPos > 0 Then
            Mid$(strWork, intPos, intCurLen) = String$(intCurLen, &H0) 'corrupt found string
            Score = Score + 1     'Update current score
        End If
    Next intPtr
Next intCurLen

End Sub
Private Function FuzzyAlg4(strIn1 As String, strIn2 As String) As Single

Dim L1               As Integer
Dim In1Mask(1 To 24) As Long     'strIn1 is 24 characters max
Dim iCh              As Integer
Dim n                As Long
Dim strTry           As String
Dim strTest          As String

TopMatch = 0
L1 = Len(strIn1)
strTest = UCase(strIn1)
strCompare = UCase(strIn2)
For iCh = 1 To L1
    In1Mask(iCh) = 2 ^ iCh
Next iCh      'Loop thru all ordered combinations of characters in strIn1
For n = 2 ^ (L1 + 1) - 1 To 1 Step -1
    strTry = ""
    For iCh = 1 To L1
        If In1Mask(iCh) And n Then
            strTry = strTry & Mid(strTest, iCh, 1)
        End If
    Next iCh
    If Len(strTry) > TopMatch Then FuzzyAlg4Test strTry
Next n
FuzzyAlg4 = TopMatch / CSng(L1)
End Function
Sub FuzzyAlg4Test(strIn As String)

Dim l          As Integer
Dim strTry   As String
Dim iCh        As Integer

l = Len(strIn)
If l <= TopMatch Then Exit Sub
strTry = "*"
For iCh = 1 To l
    strTry = strTry & Mid(strIn, iCh, 1) & "*"
Next iCh
If strCompare Like strTry Then
    If l > TopMatch Then TopMatch = l
End If
End Sub

Function FuzzyVLookup(ByVal LookupValue As String, _
                      ByVal TableArray As Range, _
                      ByVal IndexNum As Integer, _
                      Optional NFPercent As Single = 0.05, _
                      Optional Rank As Integer = 1, _
                      Optional Algorithm As Integer = 3, _
                      Optional AdditionalCols As Integer = 0, _
                      Optional LookupColOffset As Integer = 0, _
                      Optional GroupColOffset As Integer = 0, _
                      Optional GroupValue As Variant = "") As Variant
'********************************************************************************
'** Function to Fuzzy match LookupValue with entries in                        **
'** column 1 of table specified by TableArray.                                 **
'** TableArray must specify the top left cell of the range to be searched      **
'** The function stops scanning the table when an empty cell in column 1       **
'** is found.                                                                  **
'** For each entry in column 1 of the table, FuzzyPercent is called to match   **
'** LookupValue with the Table entry.                                          **
'** 'Rank' is an optional parameter which may take any value > 0               **
'**        (default 1) and causes the function to return the 'nth' best        **
'**         match (where 'n' is defined by 'Rank' parameter)                   **
'** If the 'Rank' match percentage < NFPercent (Default 5%), #N/A is returned. **
'** IndexNum is the column number of the entry in TableArray required to be    **
'** returned, as follows:                                                      **
'** If IndexNum > 0 and the 'Rank' percentage match is >= NFPercent            **
'**                 (Default 5%) the column entry indicated by IndexNum is     **
'**                 returned.                                                  **
'** if IndexNum = 0 and the 'Rank' percentage match is >= NFPercent            **
'**                 (Default 5%) the offset row (starting at 1) is returned.   **
'**                 This value can be used directly in the 'Index' function.   **
'**                                                                            **
'** Algorithm can take one of the following values:                            **
'** Algorithm = 1:                                                             **
'**     This algorithm is best suited for matching mis-spellings.              **
'**     For each character in 'String1', a search is performed on 'String2'.   **
'**     The search is deemed successful if a character is found in 'String2'   **
'**     within 3 characters of the current position.                           **
'**     A score is kept of matching characters which is returned as a          **
'**     percentage of the total possible score.                                **
'** Algorithm = 2:                                                             **
'**     This algorithm is best suited for matching sentences, or               **
'**     'firstname lastname' compared with 'lastname firstname' combinations   **
'**     A count of matching pairs, triplets, quadruplets etc. in 'String1' and **
'**     'String2' is returned as a percentage of the total possible.           **
'** Algorithm = 3: Both Algorithms 1 and 2 are performed.                      **
'** Algorithm = 4: Dan Ostrander's algorithm                                   **
'**                                                                            **
'** The following parameters allow matching by group, and only those values    **
'** which are in the group specified will be considered for matching.          **                  **
'** GroupColOffset                                                             **
'** This parameter specifies the offset column which contains the group values **
'** To trigger group matching, this must be a non-zero integer                 **
'** GroupValue                                                                 **
'** This parameter specifies the Group to be considered for matching           **
'********************************************************************************
Dim bWanted As Boolean
Dim rCur As Range
Dim rSearchRange As Range

Dim sngMinPercent As Single

Dim lEndRow As Long

Dim vCurValue As Variant

'--------------------------------------------------------------
'--    Validation                                            --
'--------------------------------------------------------------

LookupValue = LCase$(Application.Trim(LookupValue))

If IsMissing(NFPercent) Then
    sngMinPercent = 0.05
Else
    If (NFPercent <= 0) Or (NFPercent > 1) Then
        FuzzyVLookup = "*** 'NFPercent' must be a percentage > zero ***"
        Exit Function
    End If
    sngMinPercent = NFPercent
End If

If Rank < 1 Then
    FuzzyVLookup = "*** 'Rank' must be an integer > 0 ***"
    Exit Function
End If

ReDim mudRankData(1 To Rank)

lEndRow = TableArray.Rows.Count
If VarType(TableArray.Cells(lEndRow, 1).Value) = vbEmpty Then
    lEndRow = TableArray.Cells(lEndRow, 1).End(xlUp).Row
End If
Set rSearchRange = Range(TableArray.Cells(1, 1), TableArray.Cells(lEndRow, 1))

'---------------
'-- Main loop --
'---------------

If Len(GroupValue) <> 0 Then
    With rSearchRange.Offset(, GroupColOffset)
        For Each rCur In rSearchRange.Offset(, GroupColOffset)
            vCurValue = rCur.Value
            If VarType(vCurValue) = vbString Then
                bWanted = LCase$(CStr(vCurValue)) = LCase$(CStr(GroupValue))
            Else
                bWanted = Val(vCurValue) = Val(GroupValue)
            End If
            If bWanted Then
                FuzzyVlookupMain LookupValue:=LookupValue, _
                                TableArray:=rCur.Offset(, GroupColOffset * -1), _
                                IndexNum:=IndexNum, _
                                NFPercent:=NFPercent, _
                                Rank:=Rank, _
                                Algorithm:=Algorithm, _
                                AdditionalCols:=AdditionalCols, _
                                LookupColOffset:=LookupColOffset
            End If
        Next rCur
    End With
Else
    For Each rCur In rSearchRange
        FuzzyVlookupMain LookupValue:=LookupValue, _
                        TableArray:=rCur, _
                        IndexNum:=IndexNum, _
                        NFPercent:=NFPercent, _
                        Rank:=Rank, _
                        Algorithm:=Algorithm, _
                        AdditionalCols:=AdditionalCols, _
                        LookupColOffset:=LookupColOffset
    Next rCur
End If

If mudRankData(Rank).PERCENTAGE < sngMinPercent Then
    '--------------------------------------
    '-- Return '#N/A' if below NFPercent --
    '--------------------------------------
    FuzzyVLookup = CVErr(xlErrNA)
Else
    miBestMatchPtr = mudRankData(Rank).Offset - TableArray.Cells(1, 1).Row + 1
    If IndexNum > 0 Then
        '-----------------------------------
        '-- Return column entry specified --
        '-----------------------------------
        FuzzyVLookup = TableArray.Cells(miBestMatchPtr, IndexNum)
    Else
        '-----------------------
        '-- Return offset row --
        '-----------------------
        FuzzyVLookup = miBestMatchPtr
    End If
End If
End Function
Private Sub FuzzyVlookupMain(ByVal LookupValue As String, _
                                    ByVal TableArray As Range, _
                                    ByVal IndexNum As Integer, _
                                    Optional NFPercent As Single = 0.05, _
                                    Optional Rank As Integer = 1, _
                                    Optional Algorithm As Integer = 3, _
                                    Optional AdditionalCols As Integer = 0, _
                                    Optional LookupColOffset As Integer = 0)
Dim I As Integer
Dim intRankPtr As Integer
Dim intRankPtr1 As Integer
Dim strListString As String
Dim sngCurPercent As Single
Dim sngMinPercent As Single
Dim vCurValue As Variant

vCurValue = ""
For I = 0 To AdditionalCols
    vCurValue = vCurValue & CStr(TableArray.Offset(0, I + LookupColOffset).Value)
Next I
If VarType(vCurValue) = vbString Then
    strListString = LCase$(Application.Trim(vCurValue))
    
    '------------------------------------------------
    '-- Fuzzy match strings & get percentage match --
    '------------------------------------------------
    sngCurPercent = FuzzyPercent(String1:=LookupValue, _
                                 String2:=strListString, _
                                 Algorithm:=Algorithm, _
                                 Normalised:=True)
    
    If sngCurPercent >= sngMinPercent Then
        '---------------------------
        '-- Store in ranked array --
        '---------------------------
        For intRankPtr = 1 To Rank
            If sngCurPercent > mudRankData(intRankPtr).PERCENTAGE Then
                For intRankPtr1 = Rank To intRankPtr + 1 Step -1
                    With mudRankData(intRankPtr1)
                        .Offset = mudRankData(intRankPtr1 - 1).Offset
                        .PERCENTAGE = mudRankData(intRankPtr1 - 1).PERCENTAGE
                    End With
                Next intRankPtr1
                With mudRankData(intRankPtr)
                    .Offset = TableArray.Row
                    .PERCENTAGE = sngCurPercent
                End With
                Exit Sub
            End If
        Next intRankPtr
    End If
    
End If
End Sub
Function FuzzyHLookup(ByVal LookupValue As String, _
                      ByVal TableArray As Range, _
                      ByVal IndexNum As Integer, _
                      Optional NFPercent As Single = 0.05, _
                      Optional Rank As Integer = 1, _
                      Optional Algorithm As Integer = 3) As Variant
'********************************************************************************
'** Function to Fuzzy match LookupValue with entries in                        **
'** row 1 of table specified by TableArray.                                    **
'** TableArray must specify the top left cell of the range to be searched      **
'** The function stops scanning the table when an empty cell in row 1          **
'** is found.                                                                  **
'** For each entry in row 1 of the table, FuzzyPercent is called to match      **
'** LookupValue with the Table entry.                                          **
'** 'Rank' is an optional parameter which may take any value > 0               **
'**        (default 1) and causes the function to return the 'nth' best        **
'**         match (where 'n' is defined by 'Rank' parameter)                   **
'** If the 'Rank' match percentage < NFPercent (Default 5%), #N/A is returned. **
'** IndexNum is the row number of the entry in TableArray required to be       **
'** returned, as follows:                                                      **
'** If IndexNum > 0 and the 'Rank' percentage match is >= NFPercent            **
'**                 (Default 5%) the row entry indicated by IndexNum is        **
'**                 returned.                                                  **
'** if IndexNum = 0 and the 'Rank' percentage match is >= NFPercent            **
'**                 (Default 5%) the offset col (starting at 0) is returned.   **
'**                 This value can be used directly in the 'OffSet' function.  **
'**                                                                            **
'** Algorithm can take one of the following values:                            **
'** Algorithm = 1:                                                             **
'**     For each character in 'String1', a search is performed on 'String2'.   **
'**     The search is deemed successful if a character is found in 'String2'   **
'**     within 3 characters of the current position.                           **
'**     A score is kept of matching characters which is returned as a          **
'**     percentage of the total possible score.                                **
'** Algorithm = 2:                                                             **
'**     A count of matching pairs, triplets, quadruplets etc. in 'String1' and **
'**     'String2' is returned as a percentage of the total possible.           **
'** Algorithm = 3: Both Algorithms 1 and 2 are performed.                      **
'********************************************************************************
Dim r As Range

Dim strListString As String
Dim strWork As String

Dim sngMinPercent As Single
Dim sngWork As Single
Dim sngCurPercent  As Single

Dim miBestMatchPtr As Integer
Dim intPtr As Integer
Dim intRankPtr As Integer
Dim intRankPtr1 As Integer

Dim iEndCol As Integer

Dim vCurValue As Variant
'--------------------------------------------------------------
'--    Validation                                            --
'--------------------------------------------------------------
LookupValue = LCase$(Application.Trim(LookupValue))

If IsMissing(NFPercent) Then
    sngMinPercent = 0.05
Else
    If (NFPercent <= 0) Or (NFPercent > 1) Then
        FuzzyHLookup = "*** 'NFPercent' must be a percentage > zero ***"
        Exit Function
    End If
    sngMinPercent = NFPercent
End If

If Rank < 1 Then
    FuzzyHLookup = "*** 'Rank' must be an integer > 0 ***"
    Exit Function
End If

ReDim mudRankData(1 To Rank)
'**************************
iEndCol = TableArray.Columns.Count
If VarType(TableArray.Cells(1, iEndCol).Value) = vbEmpty Then
    iEndCol = TableArray.Cells(1, iEndCol).End(xlToLeft).Column
End If

'---------------
'-- Main loop --
'---------------
For Each r In Range(TableArray.Cells(1, 1), TableArray.Cells(1, iEndCol))
    vCurValue = r.Value
    If VarType(vCurValue) = vbString Then
        strListString = LCase$(Application.Trim(vCurValue))
        
        '------------------------------------------------
        '-- Fuzzy match strings & get percentage match --
        '------------------------------------------------
        sngCurPercent = FuzzyPercent(String1:=LookupValue, _
                                     String2:=strListString, _
                                     Algorithm:=Algorithm, _
                                     Normalised:=True)
        
        If sngCurPercent >= sngMinPercent Then
            '---------------------------
            '-- Store in ranked array --
            '---------------------------
            For intRankPtr = 1 To Rank
                If sngCurPercent > mudRankData(intRankPtr).PERCENTAGE Then
                    For intRankPtr1 = Rank To intRankPtr + 1 Step -1
                        With mudRankData(intRankPtr1)
                            .Offset = mudRankData(intRankPtr1 - 1).Offset
                            .PERCENTAGE = mudRankData(intRankPtr1 - 1).PERCENTAGE
                        End With
                    Next intRankPtr1
                    With mudRankData(intRankPtr)
                        .Offset = r.Column
                        .PERCENTAGE = sngCurPercent
                    End With
                    Exit For
                End If
            Next intRankPtr
        End If
        
    End If
Next r

If mudRankData(Rank).PERCENTAGE < sngMinPercent Then
    '--------------------------------------
    '-- Return '#N/A' if below NFPercent --
    '--------------------------------------
    FuzzyHLookup = CVErr(xlErrNA)
Else
    miBestMatchPtr = mudRankData(Rank).Offset - TableArray.Cells(1, 1).Column + 1
    If IndexNum > 0 Then
        '-----------------------------------
        '-- Return row entry specified --
        '-----------------------------------
        FuzzyHLookup = TableArray.Cells(IndexNum, miBestMatchPtr)
    Else
        '-----------------------
        '-- Return offset col --
        '-----------------------
        FuzzyHLookup = miBestMatchPtr
    End If
End If
End Function

```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

###  SIMILARITY FUZZY
```VBA
Option Explicit

Public Function Similarity(ByVal String1 As String, _
    ByVal String2 As String, _
    Optional ByRef RetMatch As String, _
    Optional min_match = 1) As Single
Dim b1() As Byte, b2() As Byte
Dim lngLen1 As Long, lngLen2 As Long
Dim lngResult As Long

If UCase(String1) = UCase(String2) Then
    Similarity = 1
Else:
    lngLen1 = Len(String1)
    lngLen2 = Len(String2)
    If (lngLen1 = 0) Or (lngLen2 = 0) Then
        Similarity = 0
    Else:
        b1() = StrConv(UCase(String1), vbFromUnicode)
        b2() = StrConv(UCase(String2), vbFromUnicode)
        lngResult = Similarity_sub(0, lngLen1 - 1, _
        0, lngLen2 - 1, _
        b1, b2, _
        String1, _
        RetMatch, _
        min_match)
        Erase b1
        Erase b2
        If lngLen1 >= lngLen2 Then
            Similarity = lngResult / lngLen1
        Else
            Similarity = lngResult / lngLen2
        End If
    End If
End If
End Function

Private Function Similarity_sub(ByVal start1 As Long, ByVal end1 As Long, _
                                ByVal start2 As Long, ByVal end2 As Long, _
                                ByRef b1() As Byte, ByRef b2() As Byte, _
                                ByVal FirstString As String, _
                                ByRef RetMatch As String, _
                                ByVal min_match As Long, _
                                Optional recur_level As Integer = 0) As Long
'* CALLED BY: Similarity *(RECURSIVE)

Dim lngCurr1 As Long, lngCurr2 As Long
Dim lngMatchAt1 As Long, lngMatchAt2 As Long
Dim I As Long
Dim lngLongestMatch As Long, lngLocalLongestMatch As Long
Dim strRetMatch1 As String, strRetMatch2 As String

If (start1 > end1) Or (start1 < 0) Or (end1 - start1 + 1 < min_match) _
Or (start2 > end2) Or (start2 < 0) Or (end2 - start2 + 1 < min_match) Then
    Exit Function '(exit if start/end is out of string, or length is too short)
End If

For lngCurr1 = start1 To end1
    For lngCurr2 = start2 To end2
        I = 0
        Do Until b1(lngCurr1 + I) <> b2(lngCurr2 + I)
            I = I + 1
            If I > lngLongestMatch Then
                lngMatchAt1 = lngCurr1
                lngMatchAt2 = lngCurr2
                lngLongestMatch = I
            End If
            If (lngCurr1 + I) > end1 Or (lngCurr2 + I) > end2 Then Exit Do
        Loop
    Next lngCurr2
Next lngCurr1

If lngLongestMatch < min_match Then Exit Function

lngLocalLongestMatch = lngLongestMatch
RetMatch = ""

lngLongestMatch = lngLongestMatch _
+ Similarity_sub(start1, lngMatchAt1 - 1, _
start2, lngMatchAt2 - 1, _
b1, b2, _
FirstString, _
strRetMatch1, _
min_match, _
recur_level + 1)
If strRetMatch1 <> "" Then
    RetMatch = RetMatch & strRetMatch1 & "*"
Else
    RetMatch = RetMatch & IIf(recur_level = 0 _
    And lngLocalLongestMatch > 0 _
    And (lngMatchAt1 > 1 Or lngMatchAt2 > 1) _
    , "*", "")
End If

RetMatch = RetMatch & Mid$(FirstString, lngMatchAt1 + 1, lngLocalLongestMatch)

lngLongestMatch = lngLongestMatch _
+ Similarity_sub(lngMatchAt1 + lngLocalLongestMatch, end1, _
lngMatchAt2 + lngLocalLongestMatch, end2, _
b1, b2, _
FirstString, _
strRetMatch2, _
min_match, _
recur_level + 1)

If strRetMatch2 <> "" Then
    RetMatch = RetMatch & "*" & strRetMatch2
Else
    RetMatch = RetMatch & IIf(recur_level = 0 _
    And lngLocalLongestMatch > 0 _
    And ((lngMatchAt1 + lngLocalLongestMatch < end1) _
    Or (lngMatchAt2 + lngLocalLongestMatch < end2)) _
    , "*", "")
End If
Similarity_sub = lngLongestMatch
End Function
```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------
