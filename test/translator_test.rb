require_relative 'test_helper.rb'

require './lib/Translator.rb'

class TranslatorTest < Minitest::Test

  def setup
    @translator = Translator.new
  end

  def test_translator_object_exists
    assert_instance_of Translator, @translator
  end

  def test_translator_does_eng_to_morse
    assert_equal "......-...-..--- .-----.-..-..-..", @translator.eng_to_morse("hello world")

    # Case insensitive
    assert_equal "......-...-..--- .-----.-..-..-..", @translator.eng_to_morse("hELlO wORlD")

    # Numbers
    assert_equal "-......-.. .-.-.. ...-- ..........--....", @translator.eng_to_morse("There are 3 ships")
  end


  def test_translator_loads_from_file
    assert_equal ".. .--- ..-. .- ..-....-...", @translator.from_file("input.txt")
  end

end