/**
 * Função para pesquisar e exibir os resultados em uma seção HTML.
 *
 * Itera sobre um conjunto de dados (assumido como um array de objetos) e
 * para cada objeto, cria um elemento HTML representando um resultado da pesquisa.
 * O resultado final é inserido na seção HTML com o ID "resultados-pesquisa".
 */
function pesquisar() {
    // Seleciona a seção HTML onde os resultados serão exibidos.
    let section = document.getElementById("resultados-pesquisa");
  
    // Inicializa uma string vazia para armazenar o HTML dos resultados.
    let resultados = "";
  
    // Itera sobre os dados e constrói o HTML para cada resultado.
    for (let dado of dados) {
      resultados += `
        <div class="item-resultado">
          <h2>${dado.titulo}</h2>
          <p class="descricao-meta">${dado.descricao}</p>
          <a href="${dado.steam}" target="_blank">Jogo na Steam</a>
        </div>
      `;
    }
  
    // Atualiza o conteúdo HTML da seção com os resultados construídos.
    section.innerHTML = resultados;
  }