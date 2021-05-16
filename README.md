# smilerPrototype
Projeto TCC - APP Smiler

Esse projeto é uma aplicação iOS, com o objetivo de auxiliar vítimas de diversas situações de perigo à encontrar socorro. Por meio, do envio de uma mensagem SMS a vários contatos de emergência, por meio de gestos captados pelos sensores de movimento do device. Nas mensagens é enviado um texto simples que descreve a situação e um link com a localização em tempo real da vítima.

Como utilizar esse repositório?

1 - Faça o git clone do repositório rodando o seguinte comando em um diretório de sua preferência:

git clone https://github.com/mateusRodriguesSantos/smilerPrototype.git

2 - Em seguida, faça migre para a branch develop, com o comando:

git checkout develop 

3 - Em um device com o sistema MacOS, abra o arquivo 'Smiler.xcworkspace' - o projeto em branco, exemplo:

![image](https://user-images.githubusercontent.com/51207923/118400001-37778100-b636-11eb-87b3-2d11cfd848d5.png)

4 - Antes de rodar o projeto, é necessário adicionar a chave API_Key da API SMS Dev:

- Para isso, é necessário adicionar o arquivo 'SMSDevAPI_Info.plist' com a chave da API. Crie o arquivo clicando com o botão direito na pasta 'Prototype' e crie um arquivo 'Property List', como na imagem abaixo:

![image](https://user-images.githubusercontent.com/51207923/118400286-56c2de00-b637-11eb-92f4-e0d341b3f315.png)

- Agora só basta adicionar a API_Key ao arquivo criado com o nome 'SMSDevAPI_Info.plist', como abaixo:

![image](https://user-images.githubusercontent.com/51207923/118400381-c1741980-b637-11eb-9995-4be180c292aa.png)

***Para obter a chave KEY da API SMS DEV, basta entrar em contato com um dos administradores do projeto

5 - Agora que é possível buildar o projeto no XCode, fique atento as regras de boas prátias do git:

- Como desenvolver no projeto?
  - Crie uma bracha adicional, com o nome do recurso adicionado, como "feature/network". Lembre-se de criar a branch a partir da branch develop, para evitar conflitos de merge ou rebase.

- Como adicionar o que fix na branch develop?
  - Crie pull request utilizando o gitHub e compartilhe com os membros do projeto para obter ao máximo duas aprovações do PR(Pull Request). Após a aprovação, faça o merge do PR e em seguida exclua a branch adicional.
