function Get-AlertsActive {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateSet('Actual', 'Exercise', 'System', 'Test', 'Draft')]
        [String[]]
        $Status,

        [Parameter()]
        [ValidateSet('Alert', 'Update', 'Cancel')]
        [string[]]
        $MessageType,

        [Parameter()]
        [string[]]
        $EventName,

        [Parameter()]
        [String[]]
        $EventCode,

        [Parameter()]
        [ValidateSet('Land', 'Marine')]
        [String]
        $RegionType,
        
        [Parameter()]
        [String]
        $Point,
        
        [Parameter()]
        [ValidateSet('AL','AT','GL','GM','PA','PI')]
        [String[]]
        $Region,
        
        [Parameter()]
        [String[]]
        $Area,
        
        [Parameter()]
        [string[]]
        $Zone,
        
        [Parameter()]
        [ValidateSet('Immediate', 'Expected', 'Future', 'Past', 'Unknown')]
        [string[]]
        $Urgency,
        
        [Parameter()]
        [ValidateSet('Extreme', 'Severe', 'Moderate', 'Minor', 'Unknown')]
        [string[]]
        $Severity,
        
        [Parameter()]
        [ValidateSet('Unknown', 'Unlikely', 'Possible', 'Likely', 'Observed')]
        [string[]]
        $Certainty,
        
        [Parameter()]
        [int]
        $Limit
    )

    begin {
        $uriRequest = [System.UriBuilder]'https://api.weather.gov/alerts/active'
    }
    
    process {

        $Obj = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)

        $PSBoundParameters.GetEnumerator() | % {
            $Obj.add("$($_.key)","$($_.value)")
        }
        
        $uriRequest.Query = $Obj.ToString()
 
        $r = Invoke-WebRequest -uri $uriRequest.Uri.ToString().ToLower()

        if ($r.StatusCode -eq 200) {
            $Content = [System.Text.Encoding]::Utf8.GetString($r.Content) | ConvertFrom-Json

            $Makeitpretty = [PSCustomObject]@{
                UpdateTime = $Content.updated
                Alerts     = $Content.features | ForEach-Object {
                    Write-Output $_.properties
                }
            }
            Write-Output $Makeitpretty
        } else {
            Throw 'Bad query built'
        }
    }
    
    end {
        
    }
}