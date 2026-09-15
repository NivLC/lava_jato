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

Uma observação imprtante é que o cristal pode ser considerado uma carga capacitiva. Com corrente constante, a tensão no capacitor é linear, portanto há um controle fino do movimento.

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

Foi utilizado DUREPOXI para a fixação do cristal na cuba de aço:



## Caracterização do indutor

## Escolha do embarcado

### Requisitos

- Dois ADCs;
- Frequência de ADC de 2~4x maior que a de comutação;
- Dois AMPOPS integrados.

## Testes

### *Display*

### Trava de segurança

Um simples pedido de confirmação é o suficiente.

### Configuração de *timer*

### Configuração de PWM (Sem *driver*)

### ADC

### SWEEP

## Referências


- [YUNYISONIC: What Influences Ultrasonic Cleaning Effectiveness](https://www.yunyisonic.com/what-influences-ultrasonic-cleaning-effectiveness/?srsltid=AfmBOor3Ai7u_kyIE6ecRtDf-KHuqUFtPqL6pnWAhgAGjBU3c9__m4wV)
- [Ultrasonic Cleaner Sweep Mode | Tovatech ](https://www.youtube.com/watch?v=2wetLSvoQwQ)
- []()