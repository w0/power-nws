
function Get-Icons {
    [CmdletBinding()]
    param ()
    
    begin {
        $r = Invoke-WebRequest -Uri 'https://api.weather.gov/icons' -Headers @{ 'Accept' = 'application/ld+json' }

        if (! ($r.StatusCode -eq 200)) {
            Write-Error 'It Broke fam'
        }

        $Content = [System.Text.Encoding]::Utf8.GetString($r.Content)

        $Icons = $Content | ConvertFrom-Json | select Icons

    }
    
    process {
        Write-Output $Icons
    }
    
    end {
        
    }
}