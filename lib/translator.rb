class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = {"a" => ".-",
                    "b" => "-...",
                    "c" => "-.-.",
                    "d" => "-..",
                    "e" => ".",
                    "f" => "..-.",
                    "g" => "--.",
                    "h" => "....",
                    "i" => "..",
                    "j" => ".---",
                    "k" => "-.-",
                    "l" => ".-..",
                    "m" => "--",
                    "n" => "-.",
                    "o" => "---",
                    "p" => ".--.",
                    "q" => "--.-",
                    "r" => ".-.",
                    "s" => "...",
                    "t" => "-",
                    "u" => "..-",
                    "v" => "...-",
                    "w" => ".--",
                    "x" => "-..-",
                    "y" => "-.--",
                    "z" => "--..",
                    "1" => ".----",
                    "2" => "..---",
                    "3" => "...--",
                    "4" => "....-",
                    "5" => ".....",
                    "6" => "-....",
                    "7" => "--...",
                    "8" => "---..",
                    "9" => "----.",
                    "0" => "-----",
                    " " => " "}
  end

  def eng_to_morse(text)
    letters = text.downcase.split("")
    morse_chars = letters.map do | char |
      morse_char = @dictionary[char]

      morse_char
    end

    morse_chars.join("")
  end

  def morse_to_eng(text)
    words = text.downcase.split("  ")

    alpha_numeric_words = words.map do | word |
      chars = word.split(" ")
      alpha_num_char = chars.map do | char |
        @dictionary.key(char)
      end

      alpha_num_char.join("")
    end

    alpha_numeric_words.join(" ")
  end


  def from_file(filename)
    if(!File.exist?(filename))
      puts "File does not exist!"
    else
      File.open(filename, 'r') do | file |
        text = file.read.gsub(/[\W]/, " ")
        eng_to_morse(text)
      end
    end

  end
end