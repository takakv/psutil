# psutils

A set of powershell utilities that can be added to path to automate or ease certain tasks.

## Allowing Scripts

It may be the case that running unsigned powershell scripts is blocked by your *Execution Policy*. To allow scripts, the following command can be used:

```ps
Set-ExecutionPolicy Bypass CurrentUser
```

More info on [PSdocs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies).

## Adding scripts to path

All scripts can be added to path simply by adding the parent folder / local repo to your Windows user path.

First open the *System Properties* window, by pressing `Win+S` and typing *env* to the Start Search, and then clicking on *Edit the system encironment variables*, or by pressing `Win+R` and typing `SystemPropertiesAdvanced` to Run and pressing Enter.

Then, click on *Environment Variables...* and under *User variables* highlight the row with *Path*. Then click on `Edit->New->Browse` and find the folder containing the utilities in the explorer. Hit *ok* on eeach window to cose it. THe utilities should now all be available from powershell. If not, try closing and reopening the powershell window or executing `refreshenv` to refresh the variables. If it still doesn't work, recheck your environment variables or script folder.

## checksum

`checksum` is an utility to validate a file against a user provided checksum.

Syntax:

```ps
checksum <path-to-file> [hash] [algorithm]
```

The algorithm can be any algorithm accepted by powershell's `Get-FileHash` and defaults to *SHA256*. If no hash is provided, the script will simply return the file's hash value.
