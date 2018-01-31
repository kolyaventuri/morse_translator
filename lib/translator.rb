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
      morse_char = " " if(morse_char.nil?)

      morse_char
    end

    morse_chars.join("")
  end

  def morse_to_eng(text)
    all_chars = text.downcase.split("")
    morse_chars = text.downcase.split(" ")

    chars = []
    morse_chars.each_with_index do | char, index |
      temp_char = ""
      char.length.times do
        temp_char += all_chars.shift
      end
      chars.push(temp_char)
      if(all_chars[0..1].join("") == "  ")
        all_chars.shift(2)
        chars.push(" ")
      elsif(all_chars[0] == " ")
        all_chars.shift
      end
    end

    final_text = ""
    chars.each do | char |
      if(char == " ")
        final_text += " "
      else
        alpha_num_char = @dictionary.key(char)
        if(alpha_num_char)
          final_text += alpha_num_char
        end
      end

    end

    final_text
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