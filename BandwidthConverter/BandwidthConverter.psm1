
<#
.SYNOPSIS
    Convert bytes to bits per second.
.DESCRIPTION
    ConvertTo-BitsPerSecond converts bytes per second to bits per second.
.EXAMPLE
    PS C:\> ConvertTo-BitsPerSecond -BytesPerSecond 50MB -Kbps
    409600

    Converts 50 megabyte per second to kilobits per second.

#>
function ConvertTo-BitsPerSecond {
    [CmdletBinding()]
    param (
        [Parameter(ParameterSetName = "Kbps")]
        [Parameter(ParameterSetName = "Mbps")]
        [Parameter(ParameterSetName = "Gbps")]
        [Parameter(ParameterSetName = "Tbps")]
        [Parameter(Mandatory=$true,
                   ValueFromPipeline,
                   ValueFromPipelineByPropertyName,
                   Position = 0)]
        [int]
        $BytesPerSecond,

        # Kbps
        [Parameter(Mandatory=$true, ParameterSetName="Kbps")]
        [Switch]
        $Kpbs,

        # Mpbs
        [Parameter(Mandatory=$true, ParameterSetName="Mbps")]
        [Switch]
        $Mbps,

        # Gbps
        [Parameter(Mandatory=$true, ParameterSetName="Gbps")]
        [Switch]
        $Gpbs,

        # Tbps
        [Parameter(Mandatory=$true, ParameterSetName="Tbps")]
        [Switch]
        $Tbps

    )

    switch ($PSCmdlet.ParameterSetName) {
        "Kbps" { $divisor = 1KB }
        "Mbps" { $divisor = 1MB }
        "Gbps" { $divisor = 1GB }
        "Tbps" { $divisor = 1TB }
    }

    Write-Output ($BytesPerSecond * 8 / $divisor)
}