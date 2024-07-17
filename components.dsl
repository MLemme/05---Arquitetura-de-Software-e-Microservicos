workspace {

  model {
    user = person "Usuário" "Estudante ou bibliotecário que utiliza o sistema de biblioteca online."

    system = softwareSystem "Sistema de Biblioteca Online" {
      webApp = container "Aplicação Web" "Fornece a interface do usuário para emprestar e consultar livros." "Node.js"
      database = container "Banco de Dados" "Armazena informações dos livros e dos usuários." "MongoDB"

      apiComponentes = container "API" "Gerencia as chamadas entre a aplicação web e o banco de dados." "Java" {
        controller = component "Controladores" "Gerenciam a lógica de entrada e saída de dados."
        service = component "Serviços" "Executam a lógica de negócios essencial."
        repository = component "Repositórios" "Lidam com o acesso ao banco de dados."

        controller -> service "Chama"
        service -> repository "Usa para acessar o banco de dados"
      }

      webApp -> apiComponentes "Faz chamadas para"
      apiComponentes -> database "Consulta e armazena dados em"
    }

    externalSystem = softwareSystem "Sistema de Base de Dados de Livros" "Fornece informações sobre livros disponíveis."

    user -> webApp "Usa"
    system -> externalSystem "Consulta informações de"
  }

  views {
  
     container system "Containers" {
      include *
      autolayout lr
    }
    
    component apiComponentes "Componentes" {
        include *
        autolayout lr
    }

    theme default
  }
}