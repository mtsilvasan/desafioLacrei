#autor: MTSilva
#data: 7/7/25
#language: pt

Feature: Navegação Mobile (≤600px)

  @CT-001 @mobile @layout
  Cenário: Layout da barra de navegação
    Quando a página é carregada
    Então a barra de navegação deve ocupar 100% da largura
    E os links devem ter pelo menos 48px de altura (WCAG)
    E o texto dos links não deve quebrar em múltiplas linhas

  @CT-002 @mobile @camposedição
  Cenário: Campos de formulário
    Quando o usuario acessa às páginas do aplicativo
    Então os campos de input devem ter:
      | propriedade    | valor        |
      | width          | 100%         |
      | font-size      | ≥16px        |
    
  @CT-003 @mobile @botões
  Cenário: Botões de formulário tamanho
    Quando o usuario acessa às páginas do aplicativo
    Então os botões devem ter:
      | propriedade    | valor        |
      | min_width      | 48px         |
      | min-height     | 48px         |
    
  @CT-004 @mobile @botões 
  Cenário: Botões de formulário distancia
    Quando o usuario acessa às páginas do aplicativo
    Então a distancia entre os botões deve ser:
      | propriedade    | valor        |
      | margin-left    | 8px          |

  @CT-005 @mobile @links
  Cenário: Tempo Carga Links 
    Quando o usuario toca nos links 
    Então a página de destino deve carregar em ≤2 segundos

  @CT-006 @mobile @links
  Cenário: Carga Links 
    Quando o usuario toca nos links 
    Então a página de destino deve estar dentro das margens da tela
    E não ter texto não debe ser sobreposto sobre outro texto

    
