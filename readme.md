# Koshu.AssemblyInfo

Koshu plugin for generating assembly info files.

## Usage

### Configuration

This plugin currently does not support configuration.

	config @{
		"Koshu.AssemblyInfo"=@{}
	}

### Generate assembly info

    Generate-AssemblyInfo `
        -file ".\SharedAssemblyInfo.cs" `
        -description "Description" `
        -company "Company name" `
        -product "Product name" `
        -version "1.0.0" `
        -buildVersion "1.0.0.0" `
        -copyright "2014, Company name" `
        -clsCompliant "false"

## License
MIT (http://opensource.org/licenses/mit-license.php)

## Contact
Kristoffer Ahl (project founder)  
Email: koshu@77dynamite.net  
Twitter: http://twitter.com/kristofferahl  
Website: http://www.77dynamite.com/