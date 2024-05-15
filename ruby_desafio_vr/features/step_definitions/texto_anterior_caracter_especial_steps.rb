Dado('a string de entrada {string}') do |frase|
  @frase_completa = frase
end

Dado('os marcadores {string}') do |marcadores|
  @marcadores = marcadores.split(' ')
  end

Então('a saída esperada é: {string}') do |frase_1|
  @marcadores.each do |marcador|
    if @frase_completa.include?(marcador)
      puts "A frase #{@frase_completa} contém o marcador #{marcador}."
      frase_split = @frase_completa.split(marcador)
      puts "O primeiro trecho da frase anterior ao marcador #{marcador} é: #{frase_split[0]}"
      expect(frase_split[0].rstrip).to eq(frase_1)
      break
    end
  end
end
