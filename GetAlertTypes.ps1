function Get-AlertTypes {
    [CmdletBinding()]
    param ()
    
    begin {
        $alerts = 'https://api.weather.gov/alerts'
        $type_url = $alerts + '/types'

        $r = Invoke-WebRequest -Uri $type_url -Headers @{ 'Accept' = 'application/ld+json' }

        if (! ($r.StatusCode -eq 200)) {
            Write-Error 'It Broke fam'
        }

        $Content = [System.Text.Encoding]::Utf8.GetString($r.Content)

        $types = $Content | ConvertFrom-Json | select -ExpandProperty eventTypes

    }
    
    process {
        Write-Output $types
    }
    
    end {

    }
}