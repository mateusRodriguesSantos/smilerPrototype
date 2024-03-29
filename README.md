# smilerPrototype
Projeto TCC - APP Smiler

Esse projeto é uma aplicação iOS, com o objetivo de auxiliar vítimas de diversas situações de perigo à encontrar socorro. Por meio, do envio de uma mensagem SMS a vários contatos de emergência, por meio de gestos captados pelos sensores de movimento do device. Nas mensagens é enviado um texto simples que descreve a situação e um link com a localização em tempo real da vítima.

Como utilizar esse repositório?

1 - Certifique-se de ter uma máquina Apple com a capacidade de executar o Xcode, CocoaPods, HomeBrew, RVM e Ruby:

Faça a instalação do Xcode, HomeBrew, CocoaPods, RVM, Ruby em sua máquina Apple.

2 - Instale as dependências do projeto:

Execute o comando "pod install", pelo terminal, na raiz do projeto Xcode - na pasta "Prototype".

3 - Faça o git clone do repositório rodando o seguinte comando em um diretório de sua preferência:

git clone https://github.com/mateusRodriguesSantos/smilerPrototype.git

4 - Em um device com o sistema MacOS, abra o arquivo 'Smiler.xcworkspace' - o projeto em branco, exemplo:

![image](https://user-images.githubusercontent.com/51207923/118400001-37778100-b636-11eb-87b3-2d11cfd848d5.png)

5 - Antes de rodar o projeto, é necessário adicionar a chave API_Key da API SMS Dev e as chaves de teste e de uso da API MessageBird:

- Para isso, é necessário adicionar o arquivo 'API_Info.plist' com a chaves das APIs. Crie o arquivo clicando com o botão direito na pasta 'Prototype' e crie um arquivo 'Property List', como na imagem abaixo:

![image](https://user-images.githubusercontent.com/51207923/118400286-56c2de00-b637-11eb-92f4-e0d341b3f315.png)

- Agora só basta adicionar as API_Key(s) ao arquivo criado com o nome 'API_Info.plist', como abaixo:


<img width="999" alt="Screen Shot 2021-06-13 at 17 31 05" src="https://user-images.githubusercontent.com/51207923/121821131-54bb6180-cc6d-11eb-97d4-b231effec531.png">


***Para obter as chaves das APIs, basta entrar em contato com um dos administradores do projeto

4 - Agora que é possível buildar o projeto no XCode, fique atento as regras de boas prátias do git:

- Como desenvolver no projeto?
  - Crie uma bracha adicional, com o nome do recurso adicionado, como "feature/network". Lembre-se de criar a branch a partir da branch develop, para evitar conflitos de merge ou rebase.

- Como adicionar o que fix na branch develop?
  - Crie pull request utilizando o gitHub e compartilhe com os membros do projeto para obter ao máximo duas aprovações do PR(Pull Request). Após a aprovação, faça o merge do PR e em seguida exclua a branch adicional.
