<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>README - Script de Remoção de OU</title>
</head>
<body>
    <h1>Script PowerShell - Remoção da OU "Departamentos"</h1>
    
    <p>Este script remove a proteção contra exclusão acidental da OU <strong>"Departamentos"</strong> e, em seguida, exclui a OU e todas as suas sub-OUs de forma recursiva.</p>
    
    <h2>Instruções de Uso</h2>
    <ol>
        <li>Abra o PowerShell com permissões administrativas no servidor que possui as ferramentas do Active Directory instaladas.</li>
        <li>Substitua <code>SeuDominio</code> pelo nome real do domínio no script (por exemplo: <code>DC=Empresa,DC=local</code>).</li>
        <li>Execute o script para remover a OU "Departamentos" e todas as sub-OUs.</li>
    </ol>
    
    <h2>Script</h2>
    <pre>
<code>
# Definir o caminho da OU "Departamentos"
$ouPath = "OU=Departamentos,DC=SeuDominio,DC=local"

# Remover a proteção contra exclusão acidental
Set-ADOrganizationalUnit -Identity $ouPath -ProtectedFromAccidentalDeletion $false
Write-Host "Proteção contra exclusão acidental removida."

# Remover a OU "Departamentos" e suas sub-OUs recursivamente
Remove-ADOrganizationalUnit -Identity $ouPath -Recursive -Confirm:$false
Write-Host "OU 'Departamentos' removida com sucesso."
</code>
    </pre>
    
    <h2>Exemplo de Caminho LDAP</h2>
    <p>Se o seu domínio for <strong>Empresa.local</strong>, o caminho LDAP ficará assim:</p>
    <pre><code>$ouPath = "OU=Departamentos,DC=Empresa,DC=local"</code></pre>

    <h2>Requisitos</h2>
    <ul>
        <li>Permissões administrativas no Active Directory</li>
        <li>Ferramentas de Administração do Active Directory instaladas</li>
    </ul>

    <p>Certifique-se de que você tem um backup antes de excluir OUs importantes no AD!</p>
</body>
</html>

