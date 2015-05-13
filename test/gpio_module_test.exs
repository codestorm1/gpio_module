defmodule GpioModuleTest do
  use ExUnit.Case
	
  @tag timeout: 300000
  test "gpio test" do
		state = %GpioModule{}
    assert {:ok, state} = GpioModule.start_gpio("channel blue", 17, 5, state)
    assert {:ok, state} = GpioModule.start_gpio("channel red", 18, 6, state)
    assert {:ok, state} = GpioModule.start_gpio("channel green", 22, 13, state)
		GpioModule.listen_for_change(state)
  end
end
