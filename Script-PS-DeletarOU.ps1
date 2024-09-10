# Definir o caminho da OU "Departamentos"
$ouPath = "OU=Departamentos,DC=SeuDominio,DC=local"
                      # <-- Substitua "SeuDominio" pelo nome real do seu domínio.

# Remover a proteção contra exclusão acidental
Set-ADOrganizationalUnit -Identity $ouPath -ProtectedFromAccidentalDeletion $false

Write-Host "Proteção contra exclusão acidental removida."

# Definir o caminho da OU "Departamentos"
$ouPath = "OU=Departamentos,DC=SeuDominio,DC=local" # <-- Substitua "SeuDominio" e "Departamentos" pelo nome real do seu domínio e OU.

# Remover a OU "Departamentos" e suas sub-OUs recursivamente
Remove-ADOrganizationalUnit -Identity $ouPath -Recursive -Confirm:$false

Write-Host "OU 'Departamentos' removida com sucesso."

