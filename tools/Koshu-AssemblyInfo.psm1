Param(
    [Parameter(Position=0,Mandatory=1)] [hashtable]$config
)

#------------------------------------------------------------
# Commands
#------------------------------------------------------------

function Generate-AssemblyInfo {
    [CmdletBinding()]
    param(
        [Parameter(Position=0,Mandatory=1,ValueFromPipeline=$False)][string]$description, 
        [Parameter(Position=0,Mandatory=1,ValueFromPipeline=$False)][string]$company, 
        [Parameter(Position=0,Mandatory=1,ValueFromPipeline=$False)][string]$product, 
        [Parameter(Position=0,Mandatory=1,ValueFromPipeline=$False)][string]$copyright, 
        [Parameter(Position=0,Mandatory=1,ValueFromPipeline=$False)][string]$version,
        [Parameter(Position=0,Mandatory=1,ValueFromPipeline=$False)][string]$buildVersion,
        [Parameter(Position=0,Mandatory=1,ValueFromPipeline=$False)][string]$file,
        [Parameter(Position=0,Mandatory=0,ValueFromPipeline=$False)][string]$clsCompliant = "true"
    )
    
    $asmInfo = "using System;
using System.Reflection;
using System.Runtime.InteropServices;

[assembly: CLSCompliantAttribute($clsCompliant)]
[assembly: ComVisibleAttribute(false)]
[assembly: AssemblyDescriptionAttribute(""$description"")]
[assembly: AssemblyCompanyAttribute(""$company"")]
[assembly: AssemblyProductAttribute(""$product"")]
[assembly: AssemblyCopyrightAttribute(""$copyright"")]
[assembly: AssemblyVersionAttribute(""$version"")]
[assembly: AssemblyInformationalVersionAttribute(""$version"")]
[assembly: AssemblyFileVersionAttribute(""$buildVersion"")]"

    $dir = [System.IO.Path]::GetDirectoryName($file)
    if ([System.IO.Directory]::Exists($dir) -eq $false) {
        write-host "Creating directory $dir"
        [System.IO.Directory]::CreateDirectory($dir)
    }
    
    write-host "Generating assembly info file: $file"
    out-file -filePath $file -encoding UTF8 -inputObject $asmInfo
}


#------------------------------------------------------------
# Export
#------------------------------------------------------------

export-modulemember -function Generate-AssemblyInfo