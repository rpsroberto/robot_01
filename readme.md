# 🧪 Projeto de Automação — Organo (Robot Framework)

Este projeto contém uma suíte de testes automatizados desenvolvida com **Robot Framework**, utilizando **SeleniumLibrary** e **FakerLibrary** para validação do formulário de criação de cards na aplicação **Organo**.

Os testes validam o fluxo de:

* Preenchimento automático do formulário
* Geração de dados com Faker (nome, cargo e imagem)
* Seleção de time no dropdown
* Criação de um ou vários cards
* Validação da criação do card no time correto

---

## 📌 Tecnologias Utilizadas

* **Robot Framework**
* **SeleniumLibrary**
* **FakerLibrary**
* **Python 3.10+**
* **ChromeDriver / Selenium Manager**
* **VSCode (opcional)**

---

## 📁 Estrutura do Projeto

```
curso-robot/
│
├── resources/
│   └── shared
|       └── setup_teardown.robot
|   └── pages
|       └── cadastro.robot
|   └── main.robot        # Keywords reutilizáveis
|
│
├── tests/
│   └── preenchimento_correto.robot   # Suíte de testes principal
│   └── preenchimento_incorreto.robot # Suíte de testes 
|
├── drivers/ (opcional)
│
└── README.md
```

---

## ⚙️ Instalação

### 1️⃣ Clone o repositório

```bash
git clone https://github.com/
cd curso-robot
```

### 2️⃣ Crie um ambiente virtual

```bash
python -m venv venv
```

Ative:

Windows:

```bash
venv\Scripts\activate
```

Linux/Mac:

```bash
source venv/bin/activate
```

### 3️⃣ Instale as dependências

```bash
pip install -r requirements.txt
```

Ou diretamente:

```bash
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-faker
```

---

## ▶️ Como Executar os Testes

Na raiz do projeto:

```bash
robot tests/preenchimento_correto.robot
```

Para gerar relatório mais detalhado:

```bash
robot -d resultados tests/preenchimento_correto.robot
```

---

## 🧠 Funcionalidades Testadas

### ✔️ 1. Preenchimento correto do formulário

O teste valida:

* Nome gerado automaticamente
* Cargo aleatório
* URL de imagem faker (100x100)
* Seleção do time
* Criação do card na lista correta

---

### ✔️ 2. Criação de múltiplos cards

Testa se o sistema permite criar vários cards seguidos sem falha.

---

### ✔️ 3. Criação de um card para cada time

Percorre todos os times disponíveis e cria 1 card por time, garantindo que todos estão funcionando.

---

## 🛠 Keywords Importantes

Exemplo do método de geração de dados:

```robot
Gerar Dados
    ${nome}=    Name
    ${cargo}=   Job
    ${imagem}=  Set Variable    https://picsum.photos/100/100
    [Return]    ${nome}    ${cargo}    ${imagem}
```

---

## 📊 Relatórios Gerados

Após a execução, são criados automaticamente:

* **log.html** → Detalhes da execução passo a passo
* **report.html** → Resumo dos testes
* **output.xml** → Output técnico para CI/CD

---

## 🚀 Melhorias Futuras

* Integração com CI (GitHub Actions)
* Execução paralela com Pabot
* Suporte para ambiente de homologação e produção
* Screenshot automático em caso de falha

---

## 🤝 Contribuições

Sinta-se à vontade para abrir:

* **Issues**
* **Pull Requests**
* **Sugestões**

---

## 📜 Licença

Este projeto é distribuído sob a licença MIT.
Você é livre para usar, modificar e distribuir.

---