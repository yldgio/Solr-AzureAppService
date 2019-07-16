Param(
    $solrVersion
)

$solrName = "solr-$solrVersion"

Write-Output 'Setting Security to TLS 1.2'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Write-Output 'Prevent the progress meter from trying to access the console'
$global:progressPreference = 'SilentlyContinue'

$homeDirectory = env:HOME

$siteRoot = "$homeDirectory\site\wwwroot"

Write-Output "Downloading Solr $solrVersion to $siteRoot"
$downloadSource = "https://archive.apache.org/dist/lucene/solr/$solrVersion/$solrName.zip"
Start-BitsTransfer -Source $downloadSource -Destination "$siteRoot\solr.zip"
Expand-Archive "$siteRoot\solr.zip" -DestinationPath $siteRoot
