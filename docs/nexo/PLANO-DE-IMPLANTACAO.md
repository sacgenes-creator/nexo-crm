# NEXO CRM — plano de implantação

> Documento operacional da implantação do CRM e do agente de atendimento NEXO para o negócio Ensaios Fotográficos Pequenos Sonhos.
>
> Status: início da implantação. Este documento não contém senhas, tokens, fotos de clientes nem dados pessoais.

## 1. Resultado esperado

Transformar o fork do DeskcommCRM em uma operação real de atendimento pelo WhatsApp, com:

- marca NEXO no painel;
- organização Pequenos Sonhos;
- atendimento híbrido entre IA e humano;
- leitura de texto, áudio e imagens recebidas;
- qualificação adaptativa para crianças, bebês, gestantes, adultos, casais, famílias, avós com netos e animais;
- recomendação do ensaio adequado somente depois de entender a intenção;
- apresentação de provas sociais e oferta no momento correto;
- registro de lead, estágio, histórico e próximo passo;
- identificação de dúvida, desconfiança, objeção, intenção de compra e pedido de atendimento humano;
- follow-up de quem parou de responder;
- encaminhamento contextualizado para uma pessoa quando a IA não deve continuar;
- conexão com pagamento após a escolha do pacote;
- respeito à LGPD, consentimento, opt-out e autorização de uso de imagem/voz.

A IA deve se apresentar com transparência como assistente virtual da equipe. Ela não deve fingir ser Junior, sua esposa ou outra pessoa real. A voz autorizada pode ser usada como identidade sonora da marca, com aviso apropriado de que o atendimento é automatizado.

## 2. Decisões de arquitetura

1. O núcleo do DeskcommCRM será preservado para permitir atualizações futuras.
2. Marca, cores e identidade visual serão configuradas pelo white-label do produto, não fixadas em componentes.
3. Funil, agente, conhecimento, memória, follow-ups e roteador serão configurados pelas telas do CRM. Não serão inseridos diretamente no banco.
4. O WhatsApp será conectado pelo WAHA usando QR Code apenas depois da instalação segura.
5. A publicação do agente só ocorrerá após teste em sandbox e aprovação humana.
6. Qualquer ação irreversível, pagamento, promessa comercial fora da base ou uso de imagem que gere dúvida será encaminhado para humano.
7. Segredos ficarão somente no ambiente da instalação, nunca no GitHub.

## 3. Marca

- Produto/painel: NEXO
- Operação inicial: Ensaios Fotográficos Pequenos Sonhos
- Direção visual solicitada: preto e dourado, acabamento profissional e ambiente ilustrativo
- Idioma principal: português do Brasil
- Tom: humano, acolhedor, direto, emocional sem pressão artificial
- Posicionamento: tecnologia que organiza o atendimento e ajuda a transformar fotos comuns em lembranças especiais

Itens ainda necessários antes da publicação:

- logotipo final em boa resolução;
- ícone quadrado;
- imagem de capa;
- tom dourado hexadecimal definitivo;
- domínio definitivo do painel.

## 4. Público atendido

O agente deve identificar, sem presumir:

- quem fará o ensaio;
- quantidade de pessoas;
- idade aproximada quando relevante;
- ocasião ou objetivo;
- tema desejado;
- prazo;
- qualidade e tipo da foto disponível;
- dúvidas e receios;
- se o contato já é cliente ou está recomprando.

Segmentos cobertos:

- bebês e crianças;
- gestantes;
- adultos;
- casais;
- famílias;
- pais e filhos;
- avós e netos;
- animais de estimação.

A primeira resposta nunca deve despejar pacotes. Primeiro reconhece o pedido e faz uma pergunta curta de diagnóstico.

## 5. Jornada comercial inicial

### Entrada

1. Receber a mensagem.
2. Identificar intenção e público.
3. Responder diretamente ao que foi perguntado.
4. Fazer somente uma pergunta útil por vez.
5. Registrar o contato e manter a conversa em contexto.

### Diagnóstico

Coletar apenas o que ainda falta:

- para quem são as fotos;
- tema ou ocasião;
- quantidade de pessoas;
- prazo;
- se já possui uma foto nítida;
- expectativa principal.

Não repetir pergunta já respondida. Não pedir autorização genérica como “posso explicar?” quando o lead já fez uma pergunta objetiva.

### Demonstração e confiança

Usar prova social compatível com a dúvida:

- resultado de cliente;
- depoimento autorizado;
- exemplo antes/depois;
- recompra;
- explicação simples do processo;
- Instagram oficial quando isso ajudar a validar o negócio.

Não enviar todas as provas em sequência. Escolher a prova que reduz a objeção atual.

### Oferta

Apresentar opções somente depois de entender a necessidade. Explicar:

- quantidade de fotos;
- quantidade de temas;
- prazo;
- formato digital;
- o que o cliente precisa enviar;
- valor vigente;
- link correto do pacote escolhido.

Há valores conflitantes em materiais anteriores. Antes de publicar o agente, o catálogo vigente deverá ser confirmado na tela do CRM. Nenhum valor deve ser inferido pelo modelo.

### Pagamento e produção

1. Cliente escolhe o pacote.
2. Agente envia o link exato cadastrado no catálogo.
3. Confirmação real do pagamento deve vir da integração/webhook ou de um humano; nunca da palavra do modelo.
4. Depois da confirmação, solicitar os dados estritamente necessários e a foto.
5. Validar tecnicamente a foto sem prometer resultado perfeito.
6. Registrar tema, prazo e observações.
7. Criar próximo passo visível para produção e entrega.

### Pós-venda

- informar andamento quando houver dado real;
- entregar ou encaminhar para entrega;
- confirmar recebimento;
- colher feedback;
- oferecer recompra ou novo tema apenas no momento adequado;
- registrar indicação e nova compra sem misturar pedidos.

## 6. Funil proposto

1. Novo contato
2. Entendendo o pedido
3. Foto e tema em validação
4. Opções apresentadas
5. Aguardando escolha
6. Aguardando pagamento
7. Pagamento confirmado
8. Em produção
9. Pronto para entrega
10. Entregue
11. Pós-venda e recompra
12. Atendimento humano
13. Ganho
14. Perdido

A configuração final deve ter exatamente uma etapa de ganho e uma de perda, conforme o contrato do CRM.

## 7. Regras obrigatórias do agente

- Não oferecer pacote na primeira mensagem sem entender o pedido.
- Não inventar preço, prazo, desconto, tema, disponibilidade ou confirmação de pagamento.
- Não repetir perguntas.
- Não enviar texto longo quando uma resposta curta resolve.
- Não disparar uma sequência inteira sem observar a resposta do lead.
- Não ignorar áudio, imagem ou contexto anterior.
- Não afirmar que uma foto está aprovada antes da validação técnica.
- Não prometer preservação facial perfeita.
- Não solicitar documento, CPF ou dado desnecessário.
- Não expor linguagem interna do CRM.
- Não dizer que é humano nem simular digitação humana para enganar.
- Respeitar pedido de parada e bloquear novas mensagens comerciais.
- Acionar humano quando houver reclamação, dúvida sobre pagamento, pedido fora da política, risco de uso indevido de imagem, urgência não coberta ou baixa confiança.
- Sempre deixar um próximo passo claro e registrado.

## 8. Conteúdo que alimentará a base de conhecimento

- descrição oficial do serviço;
- processo do envio à entrega;
- catálogo vigente de pacotes e links;
- lista de temas;
- critérios de foto adequada;
- prazos e horários;
- política de alteração e refação;
- política de cancelamento e reembolso;
- tratamento de foto com mais de uma pessoa;
- autorização e uso de imagem;
- perguntas frequentes;
- provas sociais autorizadas;
- respostas para objeções reais;
- identidade e tom da marca.

Arquivos de clientes devem permanecer privados. Provas sociais só entram com autorização documentada.

## 9. Follow-ups iniciais

Os intervalos finais serão configurados na tela e testados antes da publicação.

- Lead parou durante o diagnóstico: lembrete curto, contextual e sem oferta forçada.
- Lead recebeu opções e não escolheu: ajuda para escolher conforme a necessidade.
- Lead escolheu e não pagou: lembrete único com o pacote escolhido.
- Pagamento confirmado e foto não enviada: solicitar o material necessário.
- Pedido entregue: confirmar recebimento e satisfação.
- Cliente satisfeito: recompra, novo tema ou indicação em momento separado.

Todo follow-up deve ser cancelado quando o lead responder, comprar, pedir para parar ou for assumido por humano.

## 10. Testes obrigatórios antes de publicar

1. “Quero foto do meu filho.”
2. “É para mim, sou adulta.”
3. “Quero fazer com meu marido e meus filhos.”
4. Envio de áudio perguntando preço.
5. Envio de foto ruim.
6. Pedido direto de valor.
7. Pedido de desconto.
8. Lead desconfiado perguntando se é golpe.
9. Cliente dizendo que já pagou sem confirmação.
10. Cliente que já comprou e quer outro tema.
11. Pedido para falar com uma pessoa.
12. Reclamação sobre resultado.
13. Pedido para parar de receber mensagens.
14. Tema não cadastrado.
15. Pergunta fora do escopo.

Para cada caso, validar texto enviado, ação proposta, estágio, log, próximo passo e eventual handoff.

## 11. Sequência técnica

1. Auditar o fork e as instruções internas.
2. Definir infraestrutura: VPS, domínio e banco.
3. Instalar em ambiente de teste.
4. Configurar white-label NEXO.
5. Criar a organização Pequenos Sonhos.
6. Conectar credenciais de IA sem expô-las.
7. Criar o funil.
8. Importar a base de conhecimento.
9. Criar follow-ups.
10. Criar o agente em rascunho.
11. Conectar WhatsApp em modo de teste.
12. Executar os 15 casos de teste.
13. Corrigir respostas e regras.
14. Obter aprovação humana.
15. Publicar gradualmente.
16. Monitorar conversão, handoffs, erros e opt-outs.

## 12. Dependências e custos que precisam ser decididos

O código é aberto, mas uma operação real não é totalmente gratuita. Ela exige:

- servidor VPS compatível;
- domínio;
- banco Supabase na nuvem ou no próprio servidor;
- uso de modelo de IA;
- eventual transcrição de áudio;
- eventual serviço de e-mail;
- backup.

A decisão recomendada depende do servidor disponível. O caminho de banco local é indicado quando houver recursos suficientes e responsabilidade de backup; o Supabase na nuvem simplifica o início, mas possui limites.

## 13. Estado atual

Concluído:

- conta GitHub conectada;
- fork criado em `sacgenes-creator/nexo-crm`;
- acesso administrativo confirmado;
- arquitetura e doutrina do projeto lidas;
- branch de implantação criada: `codex/nexo-implantacao`;
- requisitos iniciais consolidados neste documento.

Próximo bloqueio real:

- definir onde o sistema será instalado. O instalador precisa rodar dentro de uma VPS; GitHub guarda o código, mas não mantém o CRM e o WhatsApp funcionando.
