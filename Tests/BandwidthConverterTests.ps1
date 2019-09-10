

Import-Module $PSScriptRoot\..\BandwidthConverter\BandwidthConverter.psd1 -Force

Describe "Bandwidt Converter"{
    Context "Bits per second" {
        $size = 50mb

        It "Kbps" {
            ConvertTo-BitsPerSecond -BytesPerSecond $size -Kpbs | Should -Be 409600
        }

        It "Mbps" {
            ConvertTo-BitsPerSecond -BytesPerSecond $size -Mbps | Should -Be 400
        }

        It "Gbps" {
            ConvertTo-BitsPerSecond -BytesPerSecond $size -Gpbs | Should -Be 0.390625
        }

        It "Tbps" {
            ConvertTo-BitsPerSecond -BytesPerSecond $size -Tbps | Should -Be 0.0003814697265625
        }
    }
}