defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  def handle_file({:ok, result}) do
    result = result
    |> String.split(",")
    |> Stream.map(fn number -> String.to_integer(number) end)
    |> Enum.sum()

    {:ok, %{result: result}}
  end

  def handle_file({:error, _msg}), do: {:error, %{message: "Invalid file"}}
end
