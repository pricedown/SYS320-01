﻿<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations. 
************************************************************* 
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}

# DONE: qualifies correct password strengths, returns true if OK
function checkPassword($user_password) {
   if ($user_password.Length -lt 6) {
      return $false
   }

   if ($user_password -notmatch "[^a-zA-Z0-9]") {
      return $false
   }
 
   if ($user_password -notmatch "[0-9]") {
      return $false
   }  

   if ($user_password -notmatch "[a-zA-Z]") {
      return $false
   }  

   return $true
}