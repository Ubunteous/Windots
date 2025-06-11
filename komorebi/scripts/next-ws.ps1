$ws = [int](komorebic query focused-workspace-index)
komorebic focus-workspace ([int]($ws+1)%3 + [int] [Math]::Truncate($ws/3)*3)
