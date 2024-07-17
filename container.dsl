workspace {

  model {
    user = person "Usuário" "Estudante ou bibliotecário que utiliza o sistema de biblioteca online."

    system = softwareSystem "Sistema de Biblioteca Online" {
      webApp = container "Aplicação Web" "Fornece a interface do usuário para emprestar e consultar livros." "Node.js"
      database = container "Banco de Dados" "Armazena informações dos livros e dos usuários." "MongoDB"
      api = container "API" "Gerencia as chamadas entre a aplicação web e o banco de dados." "Java"

      webApp -> api "Faz chamadas para"
      api -> database "Consulta e armazena dados em"
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

    theme default
  }
}