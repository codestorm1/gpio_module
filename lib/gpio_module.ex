defmodule GpioModule do

	def start_gpio(name, input_pin, led_pin) do
		{:ok, pid} = Gpio.start_link(input_pin, :input)
		:ok = Gpio.set_int(pid, :rising)
		:ok
	end

	def listen_for_change do
		receive do
			{:gpio_interrupt, pin, state} -> IO.puts "got something #{pin} #{state}"
			listen_for_change
		end
	end


end
