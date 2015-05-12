defmodule GpioModule do
	#defstruct current_channel: 0, pid_map: %{}

	def start_gpio(name, input_pin, led_pin, state) do
		{:ok, pid} = Gpio.start_link(input_pin, :input)
		:ok = Gpio.set_int(pid, :both)
		# {:ok, %{state | 17 => %{name: name, led_pin: led_pin}}}
		{:ok, led_pid} = Gpio.start_link(led_pin, :output)
		state = Dict.put_new(state, input_pin, %{:name => name, :led_pid => led_pid})
		{:ok, state}
	end

  def listen_for_change(state) do
		receive do
			{:gpio_interrupt, input_pin, :rising} ->
				IO.puts "got rising #{input_pin}"
				channel = state[input_pin]
				IO.inspect channel
				q = channel[:led_pid]
				IO.puts "wot?"
				IO.inspect q
				Gpio.write(q, 1)
				listen_for_change(state)

			{:gpio_interrupt, _pin, _state} ->
				listen_for_change(state)
			{_, _pin, _state} ->
				listen_for_change(state)
			{_, _, _, _} ->
				:ok
		end
	end
end
