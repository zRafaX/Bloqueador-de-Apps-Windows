# Bloqueador de Aplicativos no Windows

Este script .bat foi projetado para melhorar a segurança do sistema operacional Windows, impedindo o uso não autorizado de aplicativos específicos ao forçar a solicitação de credenciais de administrador para executá-los.

## Funcionalidades
- Configurações no registro para exigir permissão de administrador antes de executar aplicativos bloqueados.
- Exemplos pré-configurados para bloquear aplicativos como Discord, Microsoft Edge, Steam e Epic Games Launcher.
- Permite personalizações para adicionar ou remover aplicativos bloqueados conforme necessário.

## Requisitos
- Sistema operacional Windows.
- Privilégios de administrador para executar o script.

## Como Usar
1. **Baixe o script**
   - Baixe os dois arquivos deste repositório.

2. **Edite o script (opcional)**
   - Abra o arquivo em um editor de texto.
   - Adicione ou remova aplicativos bloqueados modificando as linhas que iniciam com `set "file="`. Substitua o caminho do executável pelo caminho do aplicativo que deseja bloquear.

3. **Execute como Administrador**
   - Clique com o botão direito no arquivo e selecione "Executar como administrador".
   - O script solicitará permissões para modificar o registro.

4. **Verifique os aplicativos bloqueados**
   - Tente abrir os aplicativos especificados. O sistema solicitará credenciais de administrador para executar esses aplicativos.

## Personalizações
### Adicionar um novo aplicativo:
1. Encontre o caminho completo do executável do aplicativo que deseja bloquear.
2. Adicione uma nova linha no script usando o modelo:
   ```bat
   set "file=C:\\Caminho\\Do\\Aplicativo.exe"
   reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%file%" /d "~ RUNASADMIN" /f
   ```

## Limitações
- Este script só funciona em contas de usuário sem privilégios administrativos.
- Caso o usuário possua acesso para alterar as configurações do registro, ele poderá reverter as alterações realizadas.

## Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e enviar pull requests com melhorias ou sugestões.
