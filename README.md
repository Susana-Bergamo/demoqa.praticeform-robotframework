# Automação de Testes com Robot Framework - Preenchimento de Formulário 

Teste

Este projeto tem como objetivo automatizar testes para o formulário de prática do DemoQA , garantindo qualidade e funcionalidade. Para mais detalhes, confira a [documentação completa aqui!](https://github.com/Susana-Bergamo/demoqa.praticeform-robotframework/blob/main/Documenta%C3%A7%C3%A3o%20Pratice%20Form%20-%20DemoQA%20%20Susana%20Bergamo%20%20Robot%20Framework%20.pdf)

Utilizando Robot Framework , SeleniumLibrary e o padrão Page Object Model (POM) , foram implementados testes funcionais, enfrentando desafios como anúncios sonoros e ausência de IDs exclusivos, superados com localizadores avançados e esperanças explícitas.

## Ferramentas Utilizadas
* IDE: Visual Studio Code (VS Code)
* Framework: Robot Framework
* Biblioteca: SeleniumLibrary
* Padrão de Arquitetura: Page Object Model (POM)

## Configuração de Ambiente
* Sistema Operacional: Windows 10
* Navegador: Google Chrome versão 131.0
 
## Estrutura do Projeto
  Organização das Pastas

- recursos : Contém arquivos de definição de elementos e palavras-chave específicas da página.
- testes : Armazene os casos de teste, incluindo configurações e desmontagens para iniciar e finalizar os testes.

  Arquivos Principais

- base.resource : configura ações de inicialização e finalização, como abrir o navegador, maximizar a janela e capturar telas.
- home.resource : Define elementos e ações da página inicial do DemoQA, incluindo navegação para o formulário "Formulário de Prática".
- formulario.resource : Contém elementos e palavras-chave específicas para o formulário de prática (campos, botões e envio).

## Cenários de Teste Implementados

1. Acesso ao DemoQA : Verifique se o site é acessível e o formulário está disponível.

2. Envio de Formulário Completo : Valide o sucesso no envio com todos os campos preenchidos.
   
3. Envio de Formulário com Dados Obrigatórios : Teste o envio preenchendo apenas os campos obrigatórios.
   
4. Envio de Formulário em Branco : Garante que mensagens de erro sejam exibidas para campos vazios.


## Execução dos Testes

Para rodar os testes, utilize o comando:
``` robot -d ./results tests/ ```

## Resumo dos Resultados

* Todos os testes foram executados com sucesso, permitindo identificar e corrigir defeitos rapidamente.
* Principais Aprendizados :
  - Robot Framework : Simplicidade e eficiência na automação.
  - SeleniumLibrary : Funcionalidades robustas para manipulação de elementos web.
  - Page Object Model (POM) : Redução de código duplicado e facilidade de manutenção.

## Perspectivas Futuras

* Integração com CI/CD : Automatiza a execução de testes em pipelines.
* Testes Visuais : Validar uma interface gráfica além da funcionalidade.
* Explorar Novas Ferramentas : Ampliar a geração de relatórios e melhorar a execução dos testes.


## Conclusão

A automação reforça a confiabilidade e a qualidade contínua do software. Os testes confirmaram que o formulário "Practice Form" no DemoQA atende aos critérios funcionais em diferentes cenários, incluindo preenchimento total, parcial e vazio.
