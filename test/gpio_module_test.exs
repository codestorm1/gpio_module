defmodule GpioModuleTest do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "gpio start test" do
    assert :ok = GpioModule.start_gpio("channel Z", 17, 5)
  end
	
  @tag timeout: 300000
  test "gpio test" do
    assert :ok = GpioModule.start_gpio("channel Z", 17, 5)
    assert :ok = GpioModule.start_gpio("channel Z", 18, 4)
		GpioModule.listen_for_change
  end
	
	
end
