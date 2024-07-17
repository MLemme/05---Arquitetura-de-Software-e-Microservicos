workspace {

    model {
        user = person "Usuário" "Um usuário da biblioteca."
        librarySystem = softwareSystem "Sistema de Biblioteca Online" "Gerencia os livros e usuários."
        
        user -> librarySystem "Usa"
    }
    
    views {
        systemContext librarySystem {
            include *
            autolayout lr
        }
        
        theme default
    }
}

