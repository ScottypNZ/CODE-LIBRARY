# CODE-LIBRARY
REMOVE PACKAGES OVERVIEW   
https://www.askvg.com/guide-how-to-remove-all-built-in-apps-in-windows-10/ 

LIST PACKAGES   
Get-AppxPackage | Select Name, PackageFullName   

REMOVE PACKAGES   
Get-AppxPackage *3dbuilder* | Remove-AppxPackage   
Get-AppxPackage *SOLITARE* | Remove-AppxPackage   
Get-AppxPackage *MIXEDREALITY* | Remove-AppxPackage   
Get-AppxPackage *WEBMEDIA* | Remove-AppxPackage   
Get-AppxPackage *MicrosoftEdgeDev* | Remove-AppxPackage   
Get-AppxPackage *MicrosoftEdge* | Remove-AppxPackage   
Get-AppxPackage *MicrosoftSolitaire* | Remove-AppxPackage   
Get-AppxPackage *Microsoft.Fresh* | Remove-AppxPackage   
Get-AppxPackage *Flipboard* | Remove-AppxPackage   
Get-AppxPackage *cbs* | Remove-AppxPackage   


