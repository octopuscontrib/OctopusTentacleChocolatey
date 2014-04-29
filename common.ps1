# Inspired from the VisualStudio2013Ultimate chocolatey package by mwrock
function Parse-Arguments ($vsArgs)
{
	$result = @{ 
	}

	$MATCH_PATTERN = "/([a-zA-Z]+):([`"'])?([a-zA-Z0-9- _\.]+)([`"'])?"
	$PARAMATER_NAME_INDEX = 1
	$VALUE_INDEX = 3

	$Thumbprint = ""

	if($vsArgs -match $MATCH_PATTERN ){
	    
	    #Construct a hastable of paramaters sent
	    #Format is /Key:Value (optional quotes) - Value can have [a-zA-Z0-9- _\.]+
	    Write-Host "Arguments specified"
	    $vsArgValues = @{ }
	    $vsArgs | Select-String $MATCH_PATTERN -AllMatches  | % matches | % { 
	        $vsArgValues.Add(
	            $_.Groups[$PARAMATER_NAME_INDEX].Value.Trim(),
	            $_.Groups[$VALUE_INDEX].Value.Trim()) 
	    }

	    #Return back the product key
	    if($vsArgValues['Thumbprint']) {
	        $result["Thumbprint"] = $vsArgValues['Thumbprint']
	    };

	  	if($vsArgValues['Port']) {
	        $result["Port"] = $vsArgValues['Port']
	    };

	    if($vsArgValues['OctopusUrl']) {
	        $result["OctopusUrl"] = $vsArgValues['OctopusUrl']
	    };

	    if($vsArgValues['Role']) {
	        $result["Role"] = $vsArgValues['Role']
	    };

	    if($vsArgValues['Environment']) {
	        $result["Environment"] = $vsArgValues['Environment']
	    };

	    if($vsArgValues['ApiKey']) {
	        $result["ApiKey"] = $vsArgValues['ApiKey']
	    };

	    if($vsArgValues['InstanceName']) {
	        $result["InstanceName"] = $vsArgValues['InstanceName']
	    };

	    if($vsArgValues['UseSSL']) {
	        $result["UseSSL"] = $vsArgValues['UseSSL']
	    };

		$result | Out-String | Write-Host
	}

	New-Object PSObject -Property $result
}
