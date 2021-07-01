---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version:
schema: 2.0.0
---

# Get-Quarantine

## SYNOPSIS

## SYNTAX

```
Get-Quarantine [[-pages] <Int32>] [[-pagesize] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This is an alternative to the function Get-QuarantineMessage.
This function bypasses the 1000 item per page limit by creating an array of results for up to 1000 pages and 1 million results.
That is the log limit applied by Microsoft.
I recommend limiting results as much as possible for performance reasons.
Use Get-QuarantineMessage to restrict results further.

## EXAMPLES

### EXAMPLE 1
```
Specify the number of pages with 1000 results to return
```

Get-Quarantine -pages 15

### EXAMPLE 2
```
Return the default of 1 page with up to 1000 results
```

Get-Quarantine

### EXAMPLE 3
```
Specify the pagesize to limit output to only x number of results
```

Get-Quarantine -pagesize 15

## PARAMETERS

### -pages
{{ Fill pages Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -pagesize
{{ Fill pagesize Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 1000
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires the ExchangeOnline module be installed, imported, and Connected.

## RELATED LINKS

[Get-QuarantineMessage
Release-QuarantineMessage
Unblock-Quarantine
Export-QuarantineMessage
Export-Quarantine]()
