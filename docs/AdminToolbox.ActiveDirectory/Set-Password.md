---
external help file: AdminToolbox.ActiveDirectoryManifest-help.xml
Module Name: AdminToolbox.ActiveDirectory
online version:
schema: 2.0.0
---

# Set-Password

## SYNOPSIS

## SYNTAX

```
Set-Password [-Username] <Object> [-Password] <SecureString> [<CommonParameters>]
```

## DESCRIPTION
Sets a Active Directory Password and provides an option to require a password change on login

## EXAMPLES

### EXAMPLE 1
```
Specifies the username being set and then prompts for a password.
```

Set-Password -username domain\username

## PARAMETERS

### -Username
Username of account for having a password specified

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Password that is being set for the account

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires the Active Directory Module

## RELATED LINKS