# Script PowerShell - Remoção da OU "Departamentos" e Sub-OUs

Este script remove a proteção contra exclusão acidental da OU **"Departamentos"** e, em seguida, exclui a OU junto com todas as suas sub-OUs no Active Directory.

## Instruções de Uso

1. **Abra o PowerShell com permissões administrativas** no servidor que possui as ferramentas do Active Directory instaladas.
2. **Substitua** `SeuDominio` pelo nome real do domínio no script. O formato do domínio deve seguir o padrão `DC=Domínio,DC=local`.
   - Exemplo: Se o seu domínio for **Empresa.local**, altere para:
     ```powershell
     $ouPath = "OU=Departamentos,DC=Empresa,DC=local"
     ```
3. **Execute o script**. O script realizará as seguintes etapas:
   - Remove a proteção contra exclusão acidental da OU "Departamentos".
   - Exclui a OU "Departamentos" e todas as sub-OUs de forma recursiva.

## Script

```powershell
# --- SCRIPT PARA REMOVER A OU "DEPARTAMENTOS" E SUAS SUB-OU's ---
# Este script remove a proteção contra exclusão acidental da OU "Departamentos" 
# e, em seguida, exclui a OU junto com todas as suas sub-OU's.
# Lembre-se de substituir "SeuDominio" pelo nome real do seu domínio no formato DC=Domínio,DC=local.

# Definir o caminho da OU "Departamentos"
$ouPath = "OU=Departamentos,DC=SeuDominio,DC=local"
# --------------------------------------------------------------- 
# Substitua "SeuDominio" pelo nome do seu domínio, por exemplo:
# $ouPath = "OU=Departamentos,DC=Empresa,DC=local"
# ---------------------------------------------------------------

# Passo 1: Remover a proteção contra exclusão acidental da OU "Departamentos"
Set-ADOrganizationalUnit -Identity $ouPath -ProtectedFromAccidentalDeletion $false
Write-Host "Proteção contra exclusão acidental removida."

# Passo 2: Remover a OU "Departamentos" e suas sub-OUs recursivamente
Remove-ADOrganizationalUnit -Identity $ouPath -Recursive -Confirm:$false
Write-Host "OU 'Departamentos' removida com sucesso."
