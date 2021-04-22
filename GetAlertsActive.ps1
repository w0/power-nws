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
        $active = 'https://api.weather.gov/alerts/active'
    }
    
    process {
        $r = Invoke-WebRequest $active

        $Content = [System.Text.Encoding]::Utf8.GetString($r.Content) | ConvertFrom-Json

        $Makeitpretty = [PSCustomObject]@{
            UpdateTime = $Content.updated
            Alerts     = $Content.features | ForEach-Object {
                Write-Output $_.properties
            }
        }
        
        Write-Output $Makeitpretty
    }
    
    end {
        
    }
}