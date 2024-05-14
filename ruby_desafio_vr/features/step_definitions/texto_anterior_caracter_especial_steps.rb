Dado('a string de entrada {string}') do |frase|
  puts "Frase Completa: #{frase}"
  @frase_completa = frase

end

Dado('os marcadores {string} e {string}') do |marcador_1, marcador_2|
  marcadores = [[marcador_1, marcador_2]]

#  marcadores[0][0] = marcador_1
#  marcadores[0][0] = marcador_2
end

Então('a saída esperada é: {string}') do |frase_1|
  if @frase_completa.include?(marcadores[0][0])
    @frase_completa.split(marcadores[0][0])
    @frase_completa[0]
    assert_includes(@frase_completa[0], frase_1)
  else if @frase_completa.include?(marcadores[0][1])
      @frase_completa.split(marcadores[0][1])
      @frase_completa[0]
      assert_includes(@frase_completa[0], frase_1)
    else
      raise "A frase não contém nenhum dos marcadores"
    end
  end
end
