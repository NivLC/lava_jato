# Etapa 1 - Conceito

A etapa 1 visa principalmente entender o princípio de funcionamento de um limpador ultrassônico e analisar topologias de *design*, introduzindo uma abordagem alternativa às técnicas popularmente utilizadas no mercado.

## Contextualização: O Limpador Ultrassônico

Um limpador ultrassônico é um equipamento utilizado para realizar a limpeza de objetos por meio de ondas ultrassônicas, permitindo remover sujeiras, resíduos, óleos e partículas de regiões de difícil acesso e é utilizado em áreas como eletrônica, odontologia, indústria, laboratórios e manutenção de peças.

O funcionamento do equipamento baseia-se na transformação de energia elétrica em vibrações mecânicas de alta frequência: Um sinal elétrico alternado é aplicado a um transdutor piezoelétrico, que converte a energia elétrica em vibrações mecânicas e as transmite para o líquido no recipiente de limpeza.

O transdutor piezoelétrico sofre deformação mecânica quando submetido a uma tensão elétrica, expandindo alternadamente se a tensão for alternada e vibrando na frequência do sinal elétrico. Quando a frequência da vibração é maior que 20 kHz, o resultado são ondas ultrassônicas.

Quando as ondas ultrassônicas se propagam pelo líquido surgem pequenas bolhas de vapor ou gás. Essas bolhas crescem dependendo da frequência do sinal e, posteriormente, implodem rapidamente devido às variações de pressão provocadas pela onda ultrassônica, desprendendo partículas de sujeira, gordura e outros contaminantes.

Dessa forma, a limpeza ocorre sem a necessidade de contato mecânico direto entre uma ferramenta e o objeto. 

<center>
<img src="img/bubbles.png" width="800">
</center>

Podem haver, entanto, áreas onde as ondas sonoras são canceladas e não haverá formação de bolhas. O cancelamento gera ondas estacionárias que criam bolsões de ar na solução de limpeza que não são dissolvidos. Essas áreas são chamadas de "zonas mortas".
O contrário também pode acontecer, onde áreas de muita intensidade são formadas e pode acabar danificando o material no recipiente. Essas áreas são chamadas "zonas quentes".

<center>
<img src="img/foil.webp" width="500">
</center>


Neste caso, a limpeza não será uniforme e pode diminuir signficativamente sua eficiência.


### O Piezoelétrico

O cristal piezoelétrico pode ser descrito como um filtro passa-faixa, apresentado grande impedância fora dessa faixa.

A representação elétrica do cristal pode ser feita seguindo o modelo **Butterworth-Van Dyke (BVD)**, representado pelo circuito abaixo. 

<center>
<img src="img/bvd.png" height="200">
</center>

O circuito tem duas partes:

- **Braço *motional***: Representação elétrica da vibração mecânica do cristal.
    - $L_m$: Representa a inércia da massa do cristal vibrando.
    - $C_m$: Representa a elasticidade do cristal.
    - $R_m$: Representa perdas de energia do mecanismo, como fricção, resistência do ar, etc.

- **Capacitância de placa**: Surge porque os eletrodos nas extremidades do cristal são placas de prata, formando uma estrutura metal-dielétrico-metal.

### Impedância vs Frequência

Por se tratar de uma estrutura de duas partes, o piezo tem duas frequências de ressonância: série e paralelo ($f_S$ e $f_P$).

- $f_S$

Há uma frequência específica onde o capacitor e o indutor se anulam e ocorre uma ressonância série.
Nesse ponto, tanto o módulo quanto a fase de $L_m$ e $C_m$ se anulam e sobra quase que apenas a resistência real $R_m$, portanto a impedância do braço é mínima e a corrente tende a passar por ele.
Essa frequência é chamada de $ressonância$.

- $f_P$

Logo após a ressonância, a influência do indutor começa a sobrepassar a do capacitor e o braço começa a ter característica indutiva, montando um indutor em paralelo com $C_p$. Isso forma um tanque LC paralelo.
Nesse ponto, as fases se cancelam, mas não o módulo. Portanto a impedância é máxima.
Essa frequência é chamada de $anti$-$ressonância$.

<center>
<img src="img/freqs.png" width="600">
</center>
<br>

Visualizando na forma linear:

<center>
<img src="img/freqs_lin.png" width="600">
</center>
<br>

Cada piezo tem sua própria frequência de oscilação dada por sua construção física. Operar um piezo fora da oscilação significa ter a transferência de potência significativamente reduzida.

### A Impedância do Meio

A impedância do meio não é constante. Depende da quatidade de líquido, temperatura, quantidade de objetos no recipiente, fixação do cristal no recipiente, etc.

Com a variação da impedância do meio, a frequência de ressonância do cristal também irá variar.

Portanto, calibrar o circuito para operar exatamente na oscilação é uma tarefa complicada (especialmente no caso de opções presentes no mercado que utilizam osciladores analógicos).

Uma possível solução seria considerar uma malha de *feedback* de corrente e tensão para o embarcado que poderia então ajustar a frequência de chaveamento durante a operação. Devido à complexidade, essa funcionalidade se faz **opcional**.

### Casamento de Impedância

Em sistemas onde a carga é uma impedância, é necessário realizar o casamento de impedância ara que não haja reflexões, como no caso de antenas/conectores.

Como a carga do limpador ultrassônico é o cristal, é importante considerar uma topologia que case a impedância de saída do circuito com a impedância do cristal na ressonância para minimizar a potência reativa.

### Controle: Frequência vs Tensão

Como vimos anteriormente, é possível controlar a potência do cristal de duas formas: Tensão e frequência.

Se tivermos, por exemplo um piezo que oscila a 120 kHz e a impedância nesse ponto é de 140 Ohms, considerando uma entrada de 20V temos:

$$ P = R \cdot I² = R \cdot (\frac{V}{R})² = 140 \cdot (\frac{20}{140})² \approx 2.86 W $$

Agora o tirarmos da ressonância e operarmos em, por exemplo, 125 kHz onde a impedância é 1.02 kOhms:

$$ P = R \cdot I² = R \cdot (\frac{V}{R})² = 1020 \cdot (\frac{20}{1020})² \approx 0.39 W $$

Agora, com o mesmo cristal, se alterarmos a tensão de 20V para 10V, a potência cairá 4 vezes:

$$ P = R \cdot I² = R \cdot (\frac{V}{R})² = 140 \cdot (\frac{10}{140})² \approx 0.71 W $$

Os limpadores comerciais genéricos tendem a usar um oscilador (normalmente Colppits ou Hartley) para gerar a frequência de oscilação do cristal e fazem o controle da potência variando a tensão. Uma característica dessa abordagem é que o oscilador é personalizado para um cristal específico.

O controle por frequência, no entanto, oferece duas funções principais:

1) Ajuste da potência de vibração do cristal, possibilitando limpezas delicadas por longos períodos de tempo sem danificar o objeto;
2) **Substituição do cristal para o equipamento operar em outra faixa de frequência.**

Assim, o projeto pode ser operado com diferentes cristais.

### Fonte: Corrente vs Tensão

A tensão aplicada ao cristal dita a magnitude do movimento.

O cristal pode ser considerado uma carga capacitiva. Com corrente constante, a tensão no capacitor é linear, portanto há um controle fino do movimento.

Neste projeto não há necessidade de controle fino da vibração, portanto podemos simplificar o projeto com fonte de tensão.

### *Drive* do cristal: Analógico vs Digital

O cristal pode ser excitado com diferentes formas de onda, entre elas: **Senoidal e quadrada**.

- Senoidal: Tende a ser utilizada para ultrassom de potência e para minimizar conteúdo harmônico em projetos onde é importante manter uma forma de onda pura no meio de propagação. Para fazer o *drive* analógico é necessário um amplificador analógico, aumentando o custo do projeto.

- Quadrada: Tende a ser utilizada em projetos onde pureza espectral não é um fator crítico. Pode ser gerada pelo chaveamento de transistores.

Dependendo da potência do cristal, um amplificador analógico poderia sobreaquecer e ocorreria uma falha na excitação do cristal.

Na mesma linha, as mudanças bruscas de tensão na onda quadrada gera picos de corrente que podem sobreaquecer o cristal levar à falha mecânica.

### Simultaneidade de cristais

## Topologias

`OBS: Valores de tensão/corrente nessa etapa são estipulados e estão suscetíveis a mudanças`

Há diversas possibilidades de topologias para o projeto, das quais uma será escolhida na próxima etapa. Alguns exemplos são:

### 1) Optoacoplador

<center>
<img src="img/opto.png" width="700">
</center>

Nesta opção, o dispositivo é alimentado diretamente pela tomada e apresenta isolamento galvânico, sendo a opção mais segura em termos de manuseamento e a que atinge maior potência.

Um *flyback* faz a conversão de níveis de tensão, enquanto um *push-pull* faz a inversão AC.

Há uma malha de *feedback* de corrente que se faz presente em todas as topologias, sendo **opcional** ao projeto.

Apresenta maior complexidade de projeto, necessitando de várias técnicas e componentes.


### 2) Ponte H

<center>
<img src="img/full_bridge.png" width="700">
</center>


Nesta opção, é usada uma fonte externa ou um transformador com retificação.

Se faz necessário uso de conversores abaixadores para conversão dos níveis de tensão.

Uma ponte H faz a inversão AC. Como o cristal é uma carga capacitiva, a comutação da chaves gera picos de corrente que podem ser prejudiciais ao cristal.

### 3) Meia-ponte H

<center>
<img src="img/half_bridge.png" width="700">
</center>

Essa opção apresenta a mesma ideia da opção anterior, mas com duas chaves a menos. No entanto, a tensão sobre a ponte deve ser o dobro para realizar o mesmo trabalho.

### 4) Fonte externa + Casamento de impedância

<center>
<img src="img/fonte_colmeia.png" width="700">
</center>

Nesta opção, uma fonte externa (de 12V a 24V) é usada para alimentar o circuito e abaixadores convertem os níveis de tensão.

Um *push-pull* com chaves *low-side* faz a inversão AC e reflete a impedância do secundário (cristal) para o primário.


## Objetivos Gerais do Projeto

- Entender o funcionamento de um limpador ultrassônico
- Pesquisar e entender o comportamento do piezoelétrico, assim como formas de controle


## Referências


- [The Butterworth-Van Dyke (BVD) Equivalent Circuit](https://www.bohrium.com/en/sciencepedia/feynman/keyword/bvd_equivalent_circuit)

- [Indoor Ionic Propulsion Technology –  High Voltage Power System Design](https://www.researchgate.net/publication/224441680_Indoor_ionic_propulsion_technology_-_high_voltage_power_system_design)

- [YUNYISONIC: High-Frequency Ultrasonic Cleaning in the Lab: When and Why It Matters](https://www.yunyisonic.com/high-frequency-ultrasonic-cleaning-in-the-lab-when-and-why-it-matters/?srsltid=AfmBOopkQFBerbvCK0ieflRaHmwUs67991eDK0i3NRQh7iqhvNpcaU_K)

- [Piezo SHOCK Show #35: Should I use a square or sine drive for my ultrasonic transducer?](https://www.youtube.com/live/YDQwkWBjVQU)

- [Ultrasound Physics Explained - What causes attenuation of sound waves?](https://www.youtube.com/watch?v=HbuTnQ_bbHA)

- [The Essential Guide to Ultrasonic Cleaning for Industry](https://www.theflexofactor.com/flexo-factor-blog/the-essential-guide-to-ultrasonic-cleaning-for-industry/?srsltid=AfmBOopLZJYfG1_F1-hMm2M-t2mfyKtTtLg-49GMPYYZXeJK91pBs5FY)

