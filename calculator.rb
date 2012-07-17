
module AdvCalc
  class Calculator
    
    def evaluate_postfix(string)
      array = string.split
      calculate(array)
    end
    
    def evaluate_prefix(string)      
      array = string.split.reverse
      calculate(array)
    end
    
    def calculate(array)
      @array = array
      operands = ["+", "-", "*", "/"]
      if @array.length > 0
        @array.each do |item|
          if operands.include?(item)
            operate(item)
          end
        end
      end
      get_value
    end
    
    private
    
    def operate(operand)
      @index = @array.find_index(operand)
      @array[@index - 2] = 
        eval("#{@array[@index - 2].to_f} #{@array[@index]} #{@array[@index-1]}")
      @array.delete_at(@index)
      @array.delete_at(@index-1)
      calculate(@array)
    end
    
    def get_value
      @array[0].to_i
    end
    
  end
end

calc = AdvCalc::Calculator.new
puts calc.evaluate_postfix("2 1 8 2 + 5 * + *")
puts calc.evaluate_prefix("+ 2 * 5 10")