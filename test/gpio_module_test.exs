defmodule GpioModuleTest do
  use ExUnit.Case
	
  @tag timeout: 300000
  test "gpio test" do
		state = %{}
    assert {:ok, state} = GpioModule.start_gpio("channel blue", 17, 5, state)
    assert {:ok, state} = GpioModule.start_gpio("channel red", 18, 4, state)
#	  {:ok, pid5} = Gpio.start_link(5, :output)
#	  {:ok, pid6} = Gpio.start_link(6, :output)
		GpioModule.listen_for_change(state)
  end
	
	
end
