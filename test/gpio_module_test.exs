defmodule GpioModuleTest do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "gpio test" do
    assert :ok = GpioModule.start_gpio("channel Z", 17, 5)
  end
	
	
end
