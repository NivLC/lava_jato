# Hardware

## Pasta: Bode

Nesta pasta encontram-se todos os arquivos .csv gerados durante a caracterização do cristal piezoelétrico, para ambos os resistores e modos.

Amostras "nan" indicam um erro na medição e devem ser desconsideradas.

## Pasta: display_pcb

Nesta pasta encontram-se os arquivos relacionados a PCB fabricada para o *display*.

- **display_test.ioc**: Arquivo de configuração do STM32F303 na CubeMX.

- **ultrasonic-cleaner-panel.pdf**: PDF do esquemático da placa.

- **ultrasonic-cleaner-panel.zip**: Projeto comprimido do KiCad.

## Esquemático

As figuras abaixo foram retiradas do esquemático do projeto.

A primeira etapa é o conector da placa, que será posteriomente conectado a placa de potência do limpador.

Para realizar a conexão SCL e SDA, é comum utilizar uma técnica de roteamento de resistores que permite o projetista soldar a conexão de dois jeitos diferentes, caso os pinos estejam invertidos no componente e o SDA seja na verdade o SCL, ou vice-versa.

<div align=center>
<h5>Figura 1: Swap bridge</h5>
<img src="../img/swap_bridge.png" width="400">
</div><br><br>

O *display* é 5V, então é necessário um estágio de conversão de nível lógico entre 3V3 e 5V (figuras 2 e 3).

<div align=center>
<h5>Figura 2: Conversor de nível lógico</h5>
<img src="../img/shifter.png" width="300">
</div>

<div align=center>
<h5>Figura 3: Display OLED</h5>
<img src="../img/oled.png" width="450">
</div><br><br>

A figura abaixo mostra a conexão do *encoder* rotativo com filtros em *hardware*.

<div align=center>
<h5>Figura 4: Encoder</h5>
<img src="../img/encoder.png" width="450">
</div><br><br>

## PCB

Abaixo seguem figuras do *layout* da placa.

<div align=center>
<h5>Figura 5: Bottom layer</h5>
<img src="../img/bottom.png" width="400">
</div>

<div align=center>
<h5>Figura 6: Front layer</h5>
<img src="../img/front.png" width="400">
</div><br><br>

Abaixo seguem figuras da placa fabricada (sem componentes soldados).

<div align=center>
<h5>Figura 7: Bottom layer (fabricado)</h5>
<img src="../img/bottom_pcb.jpeg" width="400">
</div>

<div align=center>
<h5>Figura 8: Front layer (fabricado)</h5>
<img src="../img/front_pcb.jpeg" width="400">
</div><br><br>
