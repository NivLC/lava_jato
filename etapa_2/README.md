# Etapa 2 - Design

A etapa 2 visa, principalmente, caracterizar o cristal piezoelétrico e planejar os controles, iniciando testes.

## Topologia

A topologia escolhida foi a opção **4: Fonte externa + Casamento de impedância**.

Esta topologia é a mais adequada pois traz um transformador *push-pull* que permite a conversão de energia através do casamento de impedância entre o primário e secundário, sendo necessárias apenas duas chaves *low-side* para realizar a comutação.

<br>
<div align=center>
<img src="img/push-pull.png" width="800">
</div> <br><br>

É possível fazer o controle de potência tanto por tensão quanto por frequência, utilizando PWM e *timer*.

<br>
<div align=center>
<img src="img/pwm-timer.png" width="500">
</div> <br><br>

Uma observação importante é que o cristal pode ser considerado uma carga capacitiva. Com corrente constante, a tensão no capacitor é linear, portanto há um controle fino do movimento.

<br>
<div align=center>
<img src="img/cap_curr.png" width="350">
<img src="img/cap_volt.png" width="350">
</div> <br><br>

O cristal pode ser considerado uma carga capacitiva. Com corrente constante, a tensão no capacitor é linear, portanto há um controle fino do movimento.

Como mencionado na Etapa 1, é possível adicionar um indutor em série no *tap* central do *push-pull* para fazer uma fonte de corrente. No entanto, o indutor tipicamente é grande e pode gerar picos de tensão altos na comutação das chaves.

Neste projeto, não há necessidade de controle fino da vibração, portanto podemos simplificar o projeto com fonte de tensão.

A fonte usada para a alimentação será de 24V/5A:


<br>
<div align=center>
<img src="img/fonte.png" width="350">
</div> <br><br>

## Caracterização do cristal

<br>
<div align=center>
<img src="img/caracterizacao.png" width="400">
</div> <br><br>


### Cristal em aberto

### Cristal fixado

É aconselhado fazer pequenas ranhuras na bacia para melhor aderência do adesivo:

<div align=center>
<img src="img/fixacao.jpeg" width="400">
</div><br>

Foi utilizado DUREPOXI para a fixação do cristal na cuba de aço:

<div align=center>
<img src="img/fixacao2.jpeg" width="400">
<img src="img/fixacao3.jpeg" width="400">
</div>

## Caracterização do indutor

$ I_S = \sqrt{\frac{P_{xtal}}{R_{res}}}  = \sqrt{\frac{30}{R_{res}}} \quad = \quad$

$ V_S = I_S \cdot R_{res} =  \quad = \quad$

$ \frac{N_S}{N_P} = \frac{V_S}{V_P} = \frac{V_S}{24} \quad = \quad$

## Escolha do embarcado

### Requisitos

- Dois ADCs;
- Frequência de ADC de 2~4x maior que a de comutação;
- Dois AMPOPs integrados.

O embarcado escolhido para esta aplicação foi o **STM32F303RET6**, possuindo:

- 4 ADCs de 0.14 MHz a 72 MHz;
- 4 AMPOPs internos.


<div align=center>
<img src="img/stm.png" width="400">
<br>
<img src="img/stm_features.avif" width="400">
</div>


## Testes

### *Display*

### Trava de segurança

Um simples pedido de confirmação é o suficiente.

### Configuração de *timer*

### Configuração de PWM (Sem *driver*)

### ADC

### *SWEEP*

## Referências


- [YUNYISONIC: What Influences Ultrasonic Cleaning Effectiveness](https://www.yunyisonic.com/what-influences-ultrasonic-cleaning-effectiveness/?srsltid=AfmBOor3Ai7u_kyIE6ecRtDf-KHuqUFtPqL6pnWAhgAGjBU3c9__m4wV)
- [Ultrasonic Cleaner Sweep Mode | Tovatech ](https://www.youtube.com/watch?v=2wetLSvoQwQ)
- []()