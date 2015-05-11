defmodule GpioModule do

	def start_gpio(name, input_pin, led_pin) do
		{:ok, pid} = Gpio.start_link(pin, :input)
		:ok = Gpio.set_int(pid, :rising)
		:ok
	end

end
