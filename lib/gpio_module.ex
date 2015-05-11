defmodule GpioModule do

	def start_gpio(name, input_pin, led_pin) do
		{:ok, pid} = Gpio.start_link(input_pin, :input)
		:ok = Gpio.set_int(pid, :rising)
		:ok
	end

	def listen_for_change do
		 {:ok, pid5} = Gpio.start_link(5, :output)
		 {:ok, pid6} = Gpio.start_link(6, :output)
		
		receive do
#			{:gpio_interrupt, pin, state} -> IO.puts "got something #{pin} #{state}"
			{:gpio_interrupt, 17, :rising} -> 
				IO.puts "got rising 17"
				Gpio.write(pid6, 0)
				Gpio.write(pid5, 1)
					:timer.sleep(1000)
				listen_for_change
			{:gpio_interrupt, 18, :rising} -> 
				IO.puts "got rising 18"
				Gpio.write(pid5, 0)
				Gpio.write(pid6, 1)
					:timer.sleep(1000)
				listen_for_change
			{:gpio_interrupt, _pin, _state} ->
					listen_for_change
		end
	end
end
