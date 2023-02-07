# Algafood API
Este é um projeto RESTful API construído usando o Java como linguagem e a framework Spring para a construção da API. Semelhante ao ifood.
Preparada para GMT -3.
Preparada para Load Balance (Poor Man).

<h2>Recursos</h2>
<ul>
  <li>Gerenciamento de Restaurantes</li>
  <li>Gerenciamento de Produtos</li>
  <li>Gerenciamento de Pedidos</li>
  <li>Gerenciamento de Usuários</li>
  <li>Gerenciamento de Formas de Pagamento</li>
  <li>Relatórios Estatísticos</li>
  <li>Gerenciamento de Permissões de Acessos</li>
</ul>

<h2>Tecnologias utilizadas</h2>
<ul>
  <li>Java 11</li>
  <li>Spring Boot</li>
  <li>Spring Data JPA</li>
  <li>Spring Data Redis</li>
  <li>Spring HATEOAS</li>
  <li>Spring Session</li>
  <li>PostgreSQL</li>
  <li>OAuth2 com JWT</li>
  <li>Springfox 3 - Swagger UI</li>
  <li>Flyway</li>
  <li>Lombok</li>
  <li>ModelMapper</li>
  <li>JasperReports</li>
</ul>

<h2>Configuração do ambiente de desenvolvimento</h2>
<ol>
  <li>Instale o Docker e o Docker Compose em seu ambiente.</li>
  <li>Clone este repositório em sua máquina local.</li>
  <li>Se estiver utilizando Windows, alterar o separador de linha do arquivo wait-for-it.sh na raiz do projeto para LF.
 Buildar a imagem apagando os caches caso tenha com o seguinte comando: docker build -t algafood --no-cache --build-arg JAR_FILE=algafood-api-0.0.1-SNAPSHOT.jar . </li>
  <li>Execute o comando ./mvnw clean package -Pdocker para buildar o projeto.
  <li>Execute o comando docker-compose up na pasta raiz do projeto para construir o ambiente e iniciar a aplicação. OU o comando docker-compose up --scale algafood-api=[numero_de_containers] para escalar a aplicação com quantos containers desejar, pois o projeto está preparado para Load Balance (Poor man).</li>
</ol>

<h2>Documentação da API</h2>
A documentação da API pode ser acessada em http://localhost/swagger-ui/index.html ao rodar a aplicação localmente.

E o Root Entry Point: http://localhost/v1.

Obs: O usuário tem que estar devidamente autenticado.
URL de autenticação usando Password Flow: http://localhost/oauth/token 

<h2>Contribuição</h2>
Contribuições são sempre bem-vindas! Sinta-se livre para abrir uma issue ou enviar um pull request.

Em caso de dúvidas, sinta-se a entrar em contato, me mande mensagem através do meu linkedin:
https://www.linkedin.com/in/kievmaia/
